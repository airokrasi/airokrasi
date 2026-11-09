#!/usr/bin/env bash
# merge-decided.sh: merges pull requests whose conditions are met. Runs with the automation App token, which is the
# only identity allowed to bypass the "one approving review" rule, and only for pull requests (never direct pushes).
# It also closes issues whose rejecting decision has survived its challenge window.
#
# K31: no person approves anything here. The conditions below ARE the approval.
#   Tier 1 : 72 h cooling period (counted from the newest commit), clean gate, nothing flagged, no changes requested.
#   Tier 2 : the linked issue carries a published accepting decision (decision:accepted + decision:final),
#            the challenge window in the decision marker has ended, an independent verifier said "yes" for the CURRENT
#            head commit, no challenge against that decision is open, the weekly Tier 2 limit is not reached.
#   Tier 3 : never merged here. A human custodian executes a published decision.
# The tier is recomputed from the diff with the trusted classifier from the default branch. Labels on the pull request
# are never trusted. Refusal always means "wait".
#
# Two ways to satisfy the ruleset (KURULUM.md explains the choice):
#   A) one App that bypasses the "one approving review" rule for pull requests only;
#   B) (recommended) two Apps and NO bypass: APPROVER_TOKEN is the token of a second App that posts an automatic approving
#      review once the conditions above are met, and GH_TOKEN merges. Then GitHub itself still enforces code-owner review for
#      Tier 3 paths, which neither App can satisfy. The approval is a machine's, not a person's, and it says so.
#
# Environment: GH_TOKEN (App token), APPROVER_TOKEN (optional, second App), REPO, DEFAULT_BRANCH, COOL_HOURS (72),
#              MAX_MERGES (3), MAX_TIER2_PER_WEEK (5)
set -euo pipefail

COOL_HOURS="${COOL_HOURS:-72}"; MAX_MERGES="${MAX_MERGES:-3}"; MAX_T2="${MAX_TIER2_PER_WEEK:-5}"
[[ "$COOL_HOURS" =~ ^[0-9]{1,4}$ ]] || COOL_HOURS=72
[[ "$MAX_MERGES" =~ ^[0-9]{1,2}$ ]] || MAX_MERGES=3
[[ "$MAX_T2" =~ ^[0-9]{1,2}$ ]] || MAX_T2=5
tmp="$(mktemp -d)"; cd "$tmp"
now="$(date -u +%s)"; today="$(date -u +%F)"
raw() { gh api -H "Accept: application/vnd.github.raw" "repos/$REPO/contents/$1?ref=$DEFAULT_BRANCH"; }
raw .github/scripts/tier.py > tier.py
raw .github/tier-rules.tsv  > tier-rules.tsv

# ---- control panel -----------------------------------------------------------------------------------------
ctl="$(gh api -X GET "repos/$REPO/issues" -f labels=meta:control -f state=open -f per_page=1 --jq '.[0].number // empty')"
ctl_labels=" "
[[ -n "$ctl" ]] && ctl_labels=" $(gh api "repos/$REPO/issues/$ctl" --jq '[.labels[].name] | join(" ")') "
if [[ "$ctl_labels" == *" halt "* || "$ctl_labels" == *" state:dormant "* ]]; then
  echo "Merging is stopped (halt or dormant)."; exit 0
fi
allow_t1=1; allow_t2=1
[[ "$ctl_labels" == *" state:tier1-paused "* ]] && allow_t1=0
[[ "$ctl_labels" == *" state:safe-mode "* ]] && allow_t2=0   # nobody has looked for a long time: no new normative changes

# ---- revert alarm: three reverts in 30 days pause Tier 1 until a person looks (Error Account idea, Temeller A1) ----
since="$(date -u -d '30 days ago' +%Y-%m-%dT%H:%M:%SZ)"
reverts="$(gh api -X GET "repos/$REPO/commits" -f sha="$DEFAULT_BRANCH" -f since="$since" -f per_page=100 --jq '[.[] | select(.commit.message | startswith("Revert "))] | length')"
if (( reverts >= 3 )) && [[ -n "$ctl" ]]; then
  gh issue edit "$ctl" --repo "$REPO" --add-label "state:tier1-paused" || true
  printf 'Tier 1 merging is paused: %s reverts in the last 30 days. Somebody should look at what went wrong, then remove the label state:tier1-paused.\n' "$reverts" \
    | gh issue comment "$ctl" --repo "$REPO" --body-file - || true
  allow_t1=0
fi

# ---- weekly Tier 2 limit (anti-churn: the rules must not change every day) --------------------------------------------
wk="$(date -u -d '7 days ago' +%F)"
t2_week="$(gh api -X GET search/issues -f q="repo:$REPO is:pr is:merged label:tier:2 merged:>=$wk" --jq '.total_count' 2>/dev/null || echo 0)"
(( t2_week < MAX_T2 )) || allow_t2=0

# ---- open challenges: targets of challenges that are still open ----------------------------------------------------------
: > "$tmp/open-targets.txt"
gh api --paginate "repos/$REPO/issues?state=open&labels=type:challenge&per_page=100" --jq '.[] | select(.pull_request == null) | .body // ""' 2>/dev/null \
  | tr -d '\r' | awk '/^### Decision issue$/ {f=1; next} /^### / {f=0} f && NF {print; f=0}' | grep -oE '[0-9]{1,7}' >> "$tmp/open-targets.txt" || true
challenged() { grep -qx "$1" "$tmp/open-targets.txt"; }

decision_marker() { # issue -> "until verdict" of the newest published decision marker
  gh api --paginate "repos/$REPO/issues/$1/comments?per_page=100" --jq '.[] | select(.user.login == "github-actions[bot]") | .body' \
    | grep -oE '<!-- decision:final until=[0-9]{4}-[0-9]{2}-[0-9]{2} verdict=[a-z-]+' | tail -n1 \
    | sed -E 's/.*until=([0-9-]+) verdict=([a-z-]+)/\1 \2/' || true
}

merged=0
gh api --paginate "repos/$REPO/pulls?state=open&per_page=100&sort=created&direction=asc" \
  --jq '.[] | select(.draft == false) | {n: .number, sha: .head.sha, head_repo: (.head.repo.full_name // ""), labels: [.labels[].name], body: (.body // "")}' \
  > "$tmp/prs.ndjson" || true

exec 3< "$tmp/prs.ndjson"
while read -r pr <&3; do
  (( merged < MAX_MERGES )) || break
  n="$(jq -r '.n' <<< "$pr")"; sha="$(jq -r '.sha' <<< "$pr")"; head_repo="$(jq -r '.head_repo' <<< "$pr")"
  labels=" $(jq -r '.labels | join(" ")' <<< "$pr") "
  skip() { echo "PR #$n: skipped ($1)"; }
  [[ -n "$head_repo" ]] || { skip "head repository is gone"; continue; }
  [[ "$labels" == *" hold "* || "$labels" == *" verification-failed "* ]] && { skip "hold or verification failed"; continue; }

  cdate="$(gh api "repos/$REPO/commits/$sha" --jq '.commit.committer.date' 2>/dev/null || echo "")"
  [[ -n "$cdate" ]] || { skip "no commit date"; continue; }
  age_h=$(( (now - $(date -u -d "$cdate" +%s)) / 3600 ))

  if gh api --paginate "repos/$REPO/pulls/$n/reviews?per_page=100" --jq '[.[] | select(.state == "CHANGES_REQUESTED")] | length' | awk '{s+=$1} END{exit !(s>0)}'; then
    skip "changes requested"; continue
  fi

  body="$(jq -r '.body' <<< "$pr" | tr -d '\r')"
  ino="$(grep -m1 -E '^Linked issue:[[:space:]]*#[0-9]+[[:space:]]*$' <<< "$body" | grep -oE '[0-9]+' | head -n1 || true)"
  [[ -n "$ino" ]] || { skip "no linked issue"; continue; }
  ilabels=" $(gh api "repos/$REPO/issues/$ino" --jq '[.labels[].name] | join(" ")' 2>/dev/null || echo "hold") "
  [[ "$ilabels" == *" hold "* || "$ilabels" == *" security:injection-suspect "* || "$ilabels" == *" needs-evidence "* ]] && { skip "linked issue is held, flagged or lacks evidence"; continue; }
  challenged "$ino" && { skip "a challenge against issue #$ino is open"; continue; }

  gate="$(gh api "repos/$REPO/commits/$sha/check-runs" --jq '[.check_runs[] | select(.name == "gate") | .conclusion] | first // "none"')"
  [[ "$gate" == "none" || "$gate" == "success" ]] || { skip "gate check is $gate"; continue; }

  gh api --paginate "repos/$REPO/pulls/$n/files?per_page=100" | jq -s 'add' > "$tmp/files.json"
  REPO="$REPO" HEAD_REPO="$head_repo" HEAD_SHA="$sha" python3 -I tier.py --rules tier-rules.tsv < "$tmp/files.json" > "$tmp/tier.json"
  tier="$(jq -r '.tier' "$tmp/tier.json")"; nerr="$(jq -r '.errors | length' "$tmp/tier.json")"; inj="$(jq -r '.injection_suspect' "$tmp/tier.json")"
  [[ "$nerr" == "0" && "$inj" == "false" ]] || { skip "checks found a problem"; continue; }

  how=""
  if [[ "$tier" == "1" ]]; then
    (( allow_t1 )) || { skip "Tier 1 is paused"; continue; }
    (( age_h >= COOL_HOURS )) || { skip "cooling period (${age_h}h of ${COOL_HOURS}h)"; continue; }
    how="Tier 1 rule, after ${age_h}h of cooling"
  elif [[ "$tier" == "2" ]]; then
    (( allow_t2 )) || { skip "Tier 2 is not allowed now (safe mode or weekly limit)"; continue; }
    [[ "$ilabels" == *" decision:accepted "* && "$ilabels" == *" decision:final "* ]] || { skip "no published accepting decision"; continue; }
    read -r until verdict < <(decision_marker "$ino" || true) || true
    [[ "${verdict:-}" == "accept" && "${until:-}" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]] || { skip "no decision marker"; continue; }
    [[ "$today" > "$until" ]] || { skip "challenge window open until $until"; continue; }
    vline="$(gh api --paginate "repos/$REPO/issues/$n/comments?per_page=100" --jq '.[] | select(.user.login == "github-actions[bot]") | .body' \
              | grep -oE "<!-- role:verifier head=$sha verdict=[a-z-]+ -->" | tail -n1 || true)"
    [[ "$vline" == *"verdict=yes"* ]] || { skip "no 'yes' from the verifier for the current head"; continue; }
    how="Tier 2 rule: published decision, verifier yes, challenge window ended $until"
  else
    skip "Tier $tier is never merged by automation"; continue
  fi

  state="$(gh pr view "$n" --repo "$REPO" --json mergeable --jq '.mergeable')"
  [[ "$state" == "MERGEABLE" ]] || { skip "not mergeable ($state)"; continue; }

  if [[ -n "${APPROVER_TOKEN:-}" ]]; then
    if ! GH_TOKEN="$APPROVER_TOKEN" gh pr review "$n" --repo "$REPO" --approve \
          --body "Automatic approval by the approver App. This is a machine's approval, not a person's: the merge rules are met ($how). Nobody else has approved this, and none needs to (K31)." > /dev/null 2>&1; then
      skip "the approver App could not approve"; continue
    fi
  fi
  if gh pr merge "$n" --repo "$REPO" --squash --match-head-commit "$sha"; then
    merged=$((merged + 1)); [[ "$tier" == "2" ]] && t2_week=$((t2_week + 1)) && { (( t2_week < MAX_T2 )) || allow_t2=0; }
    printf 'Merged automatically (%s). Nobody approved this by hand, because the founder decides nothing (K31). Anyone can revert the commit or open a challenge with a new argument or new evidence; three reverts in 30 days pause Tier 1. See GOVERNANCE.md.\n' "$how" \
      | gh pr comment "$n" --repo "$REPO" --body-file - || true
    # ROADMAP.md step 7: published, now waiting for the other languages (the board column follows the label)
    gh issue edit "$ino" --repo "$REPO" --add-label "stage:7-languages" --remove-label "pr-open" --remove-label "stage:6-text" > /dev/null 2>&1 || true
  fi
done
exec 3<&-
echo "Merged $merged pull request(s)."

# ---- rejecting decisions that survived their window are closed ------------------------------------------------------
gh api --paginate "repos/$REPO/issues?state=open&labels=decision:final&per_page=100" --jq '.[] | select(.pull_request == null) | {n: .number, l: [.labels[].name]}' 2>/dev/null \
  | jq -c 'select(((.l | index("decision:rejected")) != null) or ((.l | index("decision:no-change")) != null))' > "$tmp/closing.ndjson" || true
while read -r row; do
  [[ -n "$row" ]] || continue
  i="$(jq -r '.n' <<< "$row")"
  challenged "$i" && continue
  read -r until verdict < <(decision_marker "$i" || true) || true
  [[ "${until:-}" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ && "$today" > "$until" ]] || continue
  gh issue close "$i" --repo "$REPO" --reason "not planned" > /dev/null 2>&1 || true
  printf 'Closed: the decision (%s) stood after its challenge window ended on %s. You can still challenge it with a new argument or new evidence; that reopens it.\n' "${verdict:-?}" "$until" \
    | gh issue comment "$i" --repo "$REPO" --body-file - || true
done < "$tmp/closing.ndjson"
