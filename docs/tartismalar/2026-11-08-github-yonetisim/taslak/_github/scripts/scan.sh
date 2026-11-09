#!/usr/bin/env bash
# scan.sh: decides what the autonomy cycle does in this run. Read-only, deterministic, no AI.
#
# Environment: GH_TOKEN, REPO, APP_ID (vars.APP_ID; empty = no writer), ENABLED (vars.AUTONOMY_ENABLED),
#              BUDGET (vars.CLAUDE_MONTHLY_BUDGET_USD), MAX_RUNS_DAY (vars.CLAUDE_MAX_RUNS_PER_DAY, default 8),
#              DEFAULT_BRANCH, GITHUB_OUTPUT
# Outputs    : run, role, issue (issue or PR number), head (PR head sha for the verifier), mode, advances, reason
#
# One run does at most ONE Claude role. Deterministic stage advances can be many.
# Untrusted text (titles, bodies) is never printed or written to outputs: only numbers and fixed words.
#
# Decision paths (K31: the founder decides nothing; no human approval step exists):
#   Stages are the 7 steps of ROADMAP.md: 1 Task, 2 Proposal, 3 Reviews, 4 Defence and reply, 5 Referee, 6 Text,
#   7 Languages and publication. The Projects board uses the same seven columns.
#   Tier 1 fast path : task -> text -> PR -> 72 h cooling -> auto-merge
#   ordinary Tier 2  : task -> proposal -> reviews -> defence -> single referee decision -> text -> PR
#                      -> verifier -> challenge window -> auto-merge
#   value or Tier 3  : same, but stage 5 is a PANEL: three blind perspective referees, then a chair
#   challenge issues : a screener decides whether a challenge brings a new argument or new evidence
set -euo pipefail

OUT="${GITHUB_OUTPUT:-/dev/stdout}"
emit() { printf '%s=%s\n' "$1" "$2" >> "$OUT"; }
tmp="$(mktemp -d)"
now="$(date -u +%s)"
today="$(date -u +%F)"
epoch() { date -u -d "$1" +%s; }
raw() { gh api -H "Accept: application/vnd.github.raw" "repos/$REPO/contents/$1?ref=$DEFAULT_BRANCH"; }

finish_none() { emit run false; emit role ""; emit issue 0; emit head ""; emit mode normal; emit advances '[]'; emit reason "$1"; exit 0; }

[[ "${ENABLED:-}" == "true" ]] || finish_none "AUTONOMY_ENABLED is not true"

# ---- control panel: kill switch and attention state ---------------------------------------------------------
ctl="$(gh api -X GET "repos/$REPO/issues" -f labels=meta:control -f state=open -f per_page=1 --jq '.[0].number // empty')"
ctl_labels=" "
[[ -n "$ctl" ]] && ctl_labels=" $(gh api "repos/$REPO/issues/$ctl" --jq '[.labels[].name] | join(" ")') "
[[ "$ctl_labels" == *" halt "* ]] && finish_none "halt label on the control issue"
mode="normal"
[[ "$ctl_labels" == *" state:safe-mode "* ]] && mode="safe"
dormant=0
[[ "$ctl_labels" == *" state:dormant "* ]] && dormant=1

# ---- budget ledger ---------------------------------------------------------------------------------------------
ledger="$(gh api -X GET "repos/$REPO/issues" -f labels=meta:ledger -f state=open -f per_page=1 --jq '.[0].number // empty')"
[[ -n "$ledger" ]] || finish_none "ledger issue (label meta:ledger) is missing"
month_start="$(date -u +%Y-%m-01T00:00:00Z)"
gh api --paginate "repos/$REPO/issues/$ledger/comments?since=$month_start&per_page=100" \
  --jq '.[] | select(.user.login == "github-actions[bot]") | select(.body | contains("<!-- ledger -->")) | .body' \
  > "$tmp/ledger.txt" || true
spent="$(grep -oE 'cost_usd=[0-9]+(\.[0-9]+)?' "$tmp/ledger.txt" | cut -d= -f2 | awk '{s+=$1} END{printf "%.2f", s}')"
budget="${BUDGET:-0}"
[[ "$budget" =~ ^[0-9]+(\.[0-9]+)?$ ]] || budget=0
[[ "$mode" == "safe" ]] && budget="$(awk -v b="$budget" 'BEGIN{printf "%.2f", b*0.25}')"
claude_ok=1
awk -v s="$spent" -v b="$budget" 'BEGIN{exit !(b<=0 || s>=b)}' && claude_ok=0
economy=0
awk -v s="$spent" -v b="$budget" 'BEGIN{exit !(s>=0.8*b)}' && economy=1
runs_today="$(grep -c "date=$today" "$tmp/ledger.txt" || true)"
(( runs_today < ${MAX_RUNS_DAY:-8} )) || claude_ok=0
(( dormant == 0 )) || claude_ok=0
[[ "$economy" == "1" && "$mode" == "normal" ]] && mode="economy"

advances='[]'
: > "$tmp/actions.txt"
add_adv() { # n, remove-list, add-list (comma separated)
  advances="$(jq -c --argjson n "$1" --arg rm "$2" --arg ad "$3" '. + [{n:$n, op:"label", remove:($rm|split(",")|map(select(length>0))), add:($ad|split(",")|map(select(length>0)))}]' <<< "$advances")"
}
label_age_days() { # issue, label -> days since the label was last applied
  local t
  t="$(gh api --paginate "repos/$REPO/issues/$1/events?per_page=100" \
        --jq "[.[] | select(.event == \"labeled\" and .label.name == \"$2\") | .created_at] | last // empty")"
  [[ -n "$t" ]] || { echo 0; return; }
  echo $(( (now - $(epoch "$t")) / 86400 ))
}
roles_of() { # issue or PR -> role markers posted by automation
  gh api --paginate "repos/$REPO/issues/$1/comments?per_page=100" \
    --jq '.[] | select(.user.login == "github-actions[bot]") | .body' | grep -oE '<!-- role:[a-z0-9-]+( [^>]*)? -->' | sort | uniq -c || true
}
have_role() { grep -qE "<!-- role:$1( [^>]*)? -->" "$tmp/roles.txt"; }

# ---- 1) issues in the stage machine ----------------------------------------------------------------------------
: > "$tmp/issues.json"
for s in 1-task 2-proposal 3-reviews 4-defence 5-referee 6-text; do
  gh api --paginate "repos/$REPO/issues?state=open&labels=stage:$s&per_page=100&sort=created&direction=asc" \
    --jq '.[] | select(.pull_request == null) | {n: .number, created: .created_at, labels: [.labels[].name]}' >> "$tmp/issues.json" || true
done
jq -s '.[0:40]' "$tmp/issues.json" > "$tmp/cands.json"

while read -r row; do
  [[ -n "$row" ]] || continue
  n="$(jq -r '.n' <<< "$row")"
  labels=" $(jq -r '.labels | join(" ")' <<< "$row") "
  created="$(jq -r '.created' <<< "$row")"
  # Not touched by any role until someone looks at the flag:
  if [[ "$labels" == *" needs-info "* || "$labels" == *" needs-evidence "* || "$labels" == *" hold "* || "$labels" == *" security:injection-suspect "* ]]; then continue; fi
  stage="$(grep -oE ' stage:[0-9]-[a-z]+ ' <<< "$labels" | head -n1 | tr -d ' ')"
  [[ -n "$stage" ]] || continue
  roles_of "$n" > "$tmp/roles.txt"
  age="$(label_age_days "$n" "$stage")"
  fast=0;  [[ "$labels" == *" tier:1 "* ]] && fast=1
  panel=0; [[ "$labels" == *" value "* || "$labels" == *" tier:3 "* ]] && panel=1
  chal=0;  [[ "$labels" == *" type:challenge "* ]] && chal=1

  if (( chal )); then
    # A challenge only needs the screener (does it bring a new argument or new evidence?).
    have_role screener || echo "05|$created|$n|screener" >> "$tmp/actions.txt"
    continue
  fi

  case "$stage" in
    stage:1-task)        # the question and its scope are written down (triage checked the form)
      if (( fast )); then
        (( age >= 2 )) && add_adv "$n" "stage:1-task" "stage:6-text,ai-ready" || true
      else add_adv "$n" "stage:1-task" "stage:2-proposal"; fi ;;
    stage:2-proposal)    # the proposal is visible; others may add to it for two days
      (( age >= 2 )) && add_adv "$n" "stage:2-proposal" "stage:3-reviews" || true ;;
    stage:3-reviews)
      if ! have_role critic;   then echo "30|$created|$n|critic"   >> "$tmp/actions.txt"
      elif (( age >= 3 ));     then add_adv "$n" "stage:3-reviews" "stage:4-defence"; fi ;;
    stage:4-defence)     # defence, then one reply by the critic
      if   ! have_role advocate; then echo "40|$created|$n|advocate" >> "$tmp/actions.txt"
      elif ! have_role critic-2; then echo "30|$created|$n|critic-2" >> "$tmp/actions.txt"
      elif (( age >= 3 ));       then add_adv "$n" "stage:4-defence" "stage:5-referee"; fi ;;
    stage:5-referee)
      if (( panel )); then
        # blind, independent perspectives first; the chair only when all three are in
        missing=0
        for r in panel-rights panel-safety panel-citizen; do
          if ! have_role "$r"; then echo "10|$created|$n|$r" >> "$tmp/actions.txt"; missing=1; fi
        done
        (( missing )) || have_role chair || echo "09|$created|$n|chair" >> "$tmp/actions.txt"
      else
        have_role referee || echo "10|$created|$n|referee" >> "$tmp/actions.txt"
      fi ;;
    stage:6-text)        # the decision is written as clean text with rationale footnotes (a PR)
      pr="$(gh api -X GET search/issues -f q="repo:$REPO is:pr in:body \"Linked issue: #$n\"" --jq "[.items[] | select(.body | test(\"Linked issue: #$n([^0-9]|\$)\"))] | length" 2>/dev/null || echo 0)"
      attempts="$(awk '/role:writer/ {s+=$1} END{print s+0}' "$tmp/roles.txt")"
      if (( pr > 0 )); then [[ "$labels" == *" pr-open "* ]] || add_adv "$n" "" "pr-open"
      elif [[ "$labels" == *" needs-custodian "* ]]; then :
      elif (( attempts < 2 )); then echo "20|$created|$n|writer" >> "$tmp/actions.txt"; fi ;;
  esac
done < <(jq -c '.[]' "$tmp/cands.json")

# ---- 2) pull requests that need an independent verification ---------------------------------------------------------
raw .github/scripts/tier.py > "$tmp/tier.py"; raw .github/tier-rules.tsv > "$tmp/tier-rules.tsv"
gh api "repos/$REPO/pulls?state=open&per_page=30&sort=created&direction=asc" \
  --jq '.[] | select(.draft == false) | {n: .number, sha: .head.sha, head_repo: (.head.repo.full_name // ""), created: .created_at, body: (.body // "")}' > "$tmp/prs.ndjson" || true
while read -r pr; do
  [[ -n "$pr" ]] || continue
  pn="$(jq -r '.n' <<< "$pr")"; sha="$(jq -r '.sha' <<< "$pr")"; hrepo="$(jq -r '.head_repo' <<< "$pr")"; created="$(jq -r '.created' <<< "$pr")"
  [[ -n "$hrepo" ]] || continue
  ino="$(jq -r '.body' <<< "$pr" | tr -d '\r' | grep -m1 -E '^Linked issue:[[:space:]]*#[0-9]+[[:space:]]*$' | grep -oE '[0-9]+' | head -n1 || true)"
  [[ -n "$ino" ]] || continue
  il=" $(gh api "repos/$REPO/issues/$ino" --jq '[.labels[].name] | join(" ")' 2>/dev/null || echo "") "
  [[ "$il" == *" decision:final "* && "$il" != *" hold "* ]] || continue
  roles_of "$pn" > "$tmp/roles.txt"
  grep -q "head=$sha " "$tmp/roles.txt" && continue
  gh api --paginate "repos/$REPO/pulls/$pn/files?per_page=100" | jq -s 'add' > "$tmp/files.json"
  t="$(REPO="$REPO" HEAD_REPO="$hrepo" HEAD_SHA="$sha" python3 -I "$tmp/tier.py" --rules "$tmp/tier-rules.tsv" < "$tmp/files.json" | jq -r 'select((.errors|length)==0) | .tier')"
  [[ "$t" == "2" ]] && echo "15|$created|$pn|verifier|$sha" >> "$tmp/actions.txt"
done < "$tmp/prs.ndjson"

# ---- 3) housekeeping that needs no AI ---------------------------------------------------------------------------------
for lbl in needs-info needs-evidence; do
  days=7; [[ "$lbl" == "needs-evidence" ]] && days=30
  gh api --paginate "repos/$REPO/issues?state=open&labels=$lbl&per_page=100" --jq '.[] | select(.pull_request == null) | .number' | while read -r n; do
    age="$(label_age_days "$n" "$lbl")"
    (( age >= days )) && echo "$n" >> "$tmp/close-$lbl.txt" || true
  done || true
  if [[ -s "$tmp/close-$lbl.txt" ]]; then
    while read -r n; do advances="$(jq -c --argjson n "$n" '. + [{n:$n, op:"close", add:["closed:incomplete"], remove:[]}]' <<< "$advances")"; done < "$tmp/close-$lbl.txt"
  fi
done

# ---- 4) choose at most one Claude role -----------------------------------------------------------------------------------
role=""; issue=0; head=""
if (( claude_ok )) && [[ -s "$tmp/actions.txt" ]]; then
  allowed='screener|critic|critic-2|advocate|referee|panel-rights|panel-safety|panel-citizen|chair|verifier|writer'
  # economy: finish decisions and implementations, skip debate rounds
  [[ "$mode" == "economy" ]] && allowed='screener|referee|panel-rights|panel-safety|panel-citizen|chair|verifier|writer'
  # safe mode (nobody has looked at the project for a long time): no value decisions, no new writing
  [[ "$mode" == "safe" ]]    && allowed='screener|critic|critic-2|advocate|referee|verifier'
  [[ -n "${APP_ID:-}" ]] || allowed="$(sed -E 's/\|writer//' <<< "$allowed")"
  pick="$(sort -t'|' -k1,1n -k2,2 "$tmp/actions.txt" | awk -F'|' -v a="^($allowed)$" '$4 ~ a {print; exit}')"
  if [[ -n "$pick" ]]; then
    issue="$(cut -d'|' -f3 <<< "$pick")"; role="$(cut -d'|' -f4 <<< "$pick")"; head="$(cut -d'|' -f5 <<< "$pick")"
  fi
fi
# The proposer turns open TASKS.md rows and gaps into issues: weekly, normal mode only, small backlog only.
if (( claude_ok )) && [[ -z "$role" && "$mode" == "normal" ]]; then
  last="$(grep 'role=proposer' "$tmp/ledger.txt" | grep -oE 'date=[0-9-]+' | cut -d= -f2 | sort | tail -n1 || true)"
  days=99; [[ -n "$last" ]] && days=$(( (now - $(epoch "$last")) / 86400 ))
  open_prop="$(gh api -X GET search/issues -f q="repo:$REPO is:issue is:open label:ai-proposed" --jq '.total_count' 2>/dev/null || echo 99)"
  if (( days >= 6 && open_prop < 10 )); then role="proposer"; issue=0; fi
fi

emit advances "$advances"
emit mode "$mode"
emit head "$head"
if [[ -n "$role" ]]; then emit run true; emit role "$role"; emit issue "$issue"; emit reason "role selected"
elif [[ "$advances" != "[]" ]]; then emit run true; emit role ""; emit issue 0; emit reason "housekeeping only"
else emit run false; emit role ""; emit issue 0; emit reason "nothing to do (spent=$spent budget=$budget mode=$mode)"; fi
