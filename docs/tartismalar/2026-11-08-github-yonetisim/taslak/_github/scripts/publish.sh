#!/usr/bin/env bash
# publish.sh: the deterministic half of the autonomy cycle. It has an issues:write token and NO AI.
# It (1) applies stage advances, (2) sanitizes and posts the role's answer, (3) turns referee / panel / chair /
# screener / verifier results into published decisions, labels and markers, (4) opens AI-proposed issues,
# (5) writes the budget ledger entry.
#
# Environment: GH_TOKEN, REPO, RUN_ID, SERVER_URL, ROLE, ISSUE (issue or PR number), HEAD (PR head sha, verifier only),
#              MODE, ADVANCES (JSON), RESULT_DIR, EST_COST_USD (fallback cost per run, default 0.50),
#              DECISION_WINDOW_DAYS (7), VALUE_WINDOW_DAYS (14)
#
# K31 rules this script enforces regardless of what a role wrote:
#   * There is no human approval step. A verdict becomes a PUBLISHED decision with a challenge window.
#   * Only whitelisted labels can be added or removed by a role result or an advance.
#   * A missing or malformed verdict becomes `open` (the process waits for evidence), never `accept`.
#   * Panel: three opinions, then a chair. A three-way split is `no-change`. A chair who contradicts a 2+ majority,
#     or who leaves dissent unaddressed, produces `open` with the label `panel-conflict`.
#   * A challenge reopens a decision only if the screener says it is new, and only the allowed number of times.
#   * Role output is posted only after sanitizing (HTML comments, images, raw HTML, @mentions, secret-looking
#     strings, control characters). Markers are written by this script, never copied from a role.
set -euo pipefail

ROLE="${ROLE:-}"; ISSUE="${ISSUE:-0}"; MODE="${MODE:-normal}"; RESULT_DIR="${RESULT_DIR:-result}"; HEAD="${HEAD:-}"
WIN="${DECISION_WINDOW_DAYS:-7}"; VWIN="${VALUE_WINDOW_DAYS:-14}"
tmp="$(mktemp -d)"
run_url="${SERVER_URL:-https://github.com}/$REPO/actions/runs/$RUN_ID"
LABEL_OK='^(stage:[1-7]-[a-z]+|closed:[a-z-]+|decision:[a-z-]+|ai-ready|needs-human|needs-custodian|needs-evidence|panel-conflict|reopened:[1-3]|ai-proposed|pr-open|verification-failed)$'
DECISION_LABELS=(decision:accepted decision:rejected decision:no-change decision:open decision:final)

sanitize() {
  perl -CSD -0pe '
    s/<!--.*?-->//gs;
    s/[\x{200B}-\x{200F}\x{202A}-\x{202E}\x{2060}-\x{2064}\x{2066}-\x{2069}\x{FEFF}]//g;
    s/!\[[^\]]*\]\([^)]*\)//g;
    s/<(?=[A-Za-z!\/?])/&lt;/g;
    s/\@(?=[A-Za-z0-9_-])/\@\x{200B}/g;
    s/sk-ant-[A-Za-z0-9_-]{10,}/[redacted]/g;
    s/\b(?:gh[pousr]_[A-Za-z0-9]{20,}|github_pat_[A-Za-z0-9_]{20,})\b/[redacted]/g;
    s/\bAKIA[0-9A-Z]{16}\b/[redacted]/g;
    s/\b[A-Z][A-Z0-9_]{3,}=[^\s]{16,}/[redacted]/g;
    s/\r//g;
  ' | head -c 12000
}

post() { # $1 number, stdin body
  jq -Rs '{body: .}' | gh api -X POST "repos/$REPO/issues/$1/comments" --input - > /dev/null
}
labels_of() { gh api "repos/$REPO/issues/$1" --jq '[.labels[].name] | join(" ")' 2>/dev/null | sed 's/^/ /; s/$/ /'; }
edit_labels() { # number, add-list, remove-list (space separated, validated)
  local n="$1" a="$2" r="$3" args=() l
  for l in $a; do [[ "$l" =~ $LABEL_OK ]] && args+=(--add-label "$l"); done
  for l in $r; do [[ "$l" =~ $LABEL_OK ]] && args+=(--remove-label "$l"); done
  (( ${#args[@]} == 0 )) || gh issue edit "$n" --repo "$REPO" "${args[@]}" > /dev/null 2>&1 || true
}
last_line() { tr -d '\r' < "$1" | awk 'NF{l=$0} END{print l}' | sed -E 's/^[[:space:]`*]+//; s/[[:space:]`*]+$//'; }
last_marker() { # file, prefix, allowed-regex, default
  local v; v="$(last_line "$1")"
  if [[ "$v" =~ ^$2:\ ($3)$ ]]; then printf '%s' "${BASH_REMATCH[1]}"; else printf '%s' "$4"; fi
}

# ---- 1) stage advances ------------------------------------------------------------------------------
jq -c '.[]' <<< "${ADVANCES:-[]}" | while read -r a; do
  n="$(jq -r '.n' <<< "$a")"; op="$(jq -r '.op' <<< "$a")"
  [[ "$n" =~ ^[0-9]{1,7}$ ]] || continue
  add="$(jq -r '.add[]?' <<< "$a" | tr '\n' ' ')"; rem="$(jq -r '.remove[]?' <<< "$a" | tr '\n' ' ')"
  edit_labels "$n" "$add" "$rem"
  [[ "$op" == "close" ]] && gh issue close "$n" --repo "$REPO" --reason "not planned" > /dev/null 2>&1 || true
done

# ---- 2) role output ------------------------------------------------------------------------------------
cost="${EST_COST_USD:-0.50}"
if [[ -f "$RESULT_DIR/meta.json" ]]; then
  c="$(jq -r '.cost_usd // empty' "$RESULT_DIR/meta.json" 2>/dev/null || true)"
  [[ "$c" =~ ^[0-9]+(\.[0-9]+)?$ ]] && cost="$c"
fi
has_result=0
[[ -n "$ROLE" && -s "$RESULT_DIR/result.md" ]] && has_result=1
raw="$RESULT_DIR/result.md"
CLEAN="$tmp/clean.md"

header() { # $1 role, $2 marker extras
  echo "<!-- role:$1${2:+ $2} -->"
  echo "### AI role: $1"
  echo
  echo "> Written by an AI role, not by a person. It is an argument or a decision that anyone may challenge with a new argument or new evidence. Reactions and votes are not arguments. Run: $run_url"
  echo
}

# publish a final decision: labels, window marker, plain-language notice
finalize_decision() { # issue, verdict(accept|reject|no-change|open), conflict(0|1), how(text)
  local n="$1" v="$2" conflict="$3" how="$4" lbl days until
  lbl="$(labels_of "$n")"
  days="$WIN"; [[ "$lbl" == *" value "* || "$lbl" == *" tier:3 "* ]] && days="$VWIN"
  until="$(date -u -d "+${days} days" +%F)"
  edit_labels "$n" "" "decision:accepted decision:rejected decision:no-change decision:open decision:final needs-evidence panel-conflict"
  case "$v" in
    accept)
      if [[ "$lbl" == *" tier:3 "* ]]; then
        edit_labels "$n" "decision:accepted decision:final needs-custodian stage:6-text" "stage:5-referee"
      else
        edit_labels "$n" "decision:accepted decision:final ai-ready stage:6-text" "stage:5-referee"
      fi
      printf '<!-- decision:final until=%s verdict=accept -->\n**Published decision: accepted** (%s).\n\nThis decision is open to challenge until **%s**. To challenge it, open the "Challenge a decision" form with a new argument or new evidence; repetition does not count. Nothing is merged before that date. No person has approved this: the decision stands on its reasons and on the right of anyone to challenge it.\n' "$until" "$how" "$until" | post "$n" ;;
    reject|no-change)
      edit_labels "$n" "decision:final decision:$([[ $v == reject ]] && echo rejected || echo no-change)" ""
      printf '<!-- decision:final until=%s verdict=%s -->\n**Published decision: %s** (%s).\n\nThe issue is closed after **%s** unless a challenge with a new argument or new evidence arrives first.\n' "$until" "$v" "$v" "$how" "$until" | post "$n" ;;
    *)
      edit_labels "$n" "decision:open needs-evidence$([[ $conflict == 1 ]] && echo ' panel-conflict')" ""
      printf '<!-- decision:open -->\n**No decision yet** (%s).\n\nThe deciders could not decide on the evidence in this issue%s. Anyone may add evidence or a new argument in a comment. If nothing new arrives within 30 days the issue is closed and can be opened again.\n' "$how" "$([[ $conflict == 1 ]] && echo ' (the panel did not agree, or the chair did not follow the panel)')" | post "$n" ;;
  esac
}

if [[ -n "$ROLE" && "$has_result" == "1" ]]; then
  [[ "$ROLE" == "proposer" || "$ISSUE" =~ ^[1-9][0-9]{0,6}$ ]] || exit 1
  [[ "$ROLE" == "proposer" ]] || sanitize < "$raw" > "$CLEAN"

  case "$ROLE" in
    critic|critic-2|advocate)
      { header "$ROLE"; cat "$CLEAN"; } | post "$ISSUE" ;;

    referee)
      v="$(last_marker "$raw" VERDICT 'accept|reject|no-change|open' open)"
      { header referee "verdict=$v"; cat "$CLEAN"; } | post "$ISSUE"
      finalize_decision "$ISSUE" "$v" 0 "single AI referee" ;;

    panel-rights|panel-safety|panel-citizen)
      o="$(last_marker "$raw" OPINION 'accept|reject|no-change|open' open)"
      { header "$ROLE" "opinion=$o"; cat "$CLEAN"; } | post "$ISSUE" ;;

    chair)
      v="$(last_marker "$raw" VERDICT 'accept|reject|no-change|open' open)"
      gh api --paginate "repos/$REPO/issues/$ISSUE/comments?per_page=100" \
        --jq '.[] | select(.user.login == "github-actions[bot]") | .body' \
        | grep -oE '<!-- role:panel-(rights|safety|citizen) opinion=(accept|reject|no-change|open) -->' \
        | sed -E 's/.*role:(panel-[a-z]+) opinion=([a-z-]+).*/\1 \2/' | sort -u > "$tmp/ops.txt" || true
      nmem="$(cut -d' ' -f1 "$tmp/ops.txt" | sort -u | wc -l)"
      final="$v"; conflict=0; note="the chair's verdict stands"
      if (( nmem < 3 )); then final="open"; conflict=1; note="fewer than three panel opinions were found"
      else
        maxc="$(cut -d' ' -f2 "$tmp/ops.txt" | sort | uniq -c | sort -rn | head -n1 | awk '{print $1}')"
        major="$(cut -d' ' -f2 "$tmp/ops.txt" | sort | uniq -c | sort -rn | head -n1 | awk '{print $2}')"
        ndist="$(cut -d' ' -f2 "$tmp/ops.txt" | sort -u | wc -l)"
        if   (( ndist == 3 )); then final="no-change"; note="three-way split in the panel, so the status quo stays (rule)"
        elif (( maxc >= 2 )) && [[ "$major" != "$v" ]]; then final="open"; conflict=1; note="the chair's verdict contradicts the panel majority ($major)"
        elif (( ndist > 1 )) && ! grep -qiE 'Dissenting opinions' "$CLEAN"; then final="open"; conflict=1; note="the panel was not unanimous and the chair did not publish the dissenting opinions"
        fi
      fi
      { header chair "verdict=$v final=$final"; cat "$CLEAN"; echo; echo "---"
        echo "Mechanical check of the panel rule: panel opinions = $(awk '{print $2}' "$tmp/ops.txt" | sort | uniq -c | awk '{printf "%s x %s; ", $1, $2}'). Result: **$final** ($note)."; } | post "$ISSUE"
      finalize_decision "$ISSUE" "$final" "$conflict" "AI panel with chair; $note" ;;

    verifier)
      [[ "$HEAD" =~ ^[0-9a-f]{40}$ ]] || exit 1
      v="$(last_marker "$raw" VERIFY 'yes|no' no)"
      { header verifier "head=$HEAD verdict=$v"; cat "$CLEAN"; } | post "$ISSUE"
      if [[ "$v" == "no" ]]; then edit_labels "$ISSUE" "verification-failed" ""; else edit_labels "$ISSUE" "" "verification-failed"; fi ;;

    screener)
      s="$(last_marker "$raw" SCREEN 'new-evidence|new-argument|not-new' not-new)"
      # The target decision is read from the challenge form by this script, never from the AI.
      body="$(gh api "repos/$REPO/issues/$ISSUE" --jq '.body // ""' | tr -d '\r')"
      target="$(awk '/^### Decision issue$/ {f=1; next} /^### / {f=0} f && NF {print; exit}' <<< "$body" | grep -oE '[0-9]{1,7}' | head -n1 || true)"
      { header screener "result=$s"; cat "$CLEAN"; } | post "$ISSUE"
      tl=""; [[ -n "$target" && "$target" != "$ISSUE" ]] && tl="$(labels_of "$target")"
      if [[ -z "$tl" || "$tl" != *" decision:final "* ]]; then
        printf 'This challenge does not point to an issue with a published decision (field "Decision issue"). If the question is still being debated, add your argument as a comment on that issue instead. This challenge is closed; you can open a new one after the decision is published.\n' | post "$ISSUE"
        edit_labels "$ISSUE" "closed:no-decision" ""; gh issue close "$ISSUE" --repo "$REPO" --reason "not planned" > /dev/null 2>&1 || true
      else
        rc=0; [[ "$tl" == *" reopened:3 "* ]] && rc=3; [[ "$tl" == *" reopened:2 "* ]] && rc=2; [[ "$tl" == *" reopened:1 "* ]] && rc=1
        reopen=0
        if   [[ "$s" == "new-evidence" ]]; then reopen=1
        elif [[ "$s" == "new-argument" ]] && (( rc < 2 )); then reopen=1; fi
        if (( reopen )); then
          nrc=$(( rc + 1 )); (( nrc > 3 )) && nrc=3
          # archive the earlier role markers so that the roles run again; the comments themselves stay visible
          gh api --paginate "repos/$REPO/issues/$target/comments?per_page=100" \
            --jq '.[] | select(.user.login == "github-actions[bot]") | select(.body | test("<!-- (role:|decision:)")) | [.id, .body] | @json' \
            | while read -r row; do
                cid="$(jq -r '.[0]' <<< "$row")"
                jq -r '.[1]' <<< "$row" | sed -E 's/<!-- role:/<!-- archived-role:/g; s/<!-- decision:/<!-- superseded-decision:/g' \
                  | jq -Rs '{body: .}' | gh api -X PATCH "repos/$REPO/issues/comments/$cid" --input - > /dev/null || true
              done || true
          edit_labels "$target" "stage:3-reviews reopened:$nrc" "decision:accepted decision:rejected decision:no-change decision:open decision:final ai-ready needs-custodian needs-evidence panel-conflict pr-open stage:4-defence stage:5-referee stage:6-text stage:7-languages"
          gh issue reopen "$target" --repo "$REPO" > /dev/null 2>&1 || true
          printf 'Reopened by challenge #%s (screener result: %s; reopening number %s of the allowed process). The earlier debate and decision stay visible above and count as the register of arguments already considered. The question restarts at step 3 (reviews). If the earlier decision was already merged, a new accepting decision produces a new pull request that changes it. If it brings no new reason, the earlier decision stands.\n' "$ISSUE" "$s" "$nrc" | post "$target"
          printf 'The challenge brings something new (%s). Issue #%s is reopened at the review step. Thank you.\n' "$s" "$target" | post "$ISSUE"
          edit_labels "$ISSUE" "closed:reopened" ""; gh issue close "$ISSUE" --repo "$REPO" --reason completed > /dev/null 2>&1 || true
        else
          extra=""; [[ "$s" == "new-argument" ]] && extra=" This decision was already reopened twice; after two reopenings only new evidence reopens it."
          printf 'The screener did not find a new argument or new evidence here.%s You may open a new challenge that adds something the earlier debate did not have. Repetition, volume and the number of supporters do not count.\n' "$extra" | post "$ISSUE"
          edit_labels "$ISSUE" "closed:not-new" ""; gh issue close "$ISSUE" --repo "$REPO" --reason "not planned" > /dev/null 2>&1 || true
        fi
      fi ;;

    writer)
      # Ordinary mode: open-pr.sh posts the result. Tier 3 mode: the patch is text for a human custodian.
      wl="$(labels_of "$ISSUE")"
      if [[ "$wl" == *" tier:3 "* ]]; then
        { header writer; cat "$CLEAN"; echo; echo "---"; echo "Automation never changes the machine's own rules. A custodian can apply this patch as the second key, or the item stays frozen."; } | post "$ISSUE"
        edit_labels "$ISSUE" "needs-custodian" ""
      fi ;;

    proposer)
      awk '/^BEGIN-JSON$/{f=1;next} /^END-JSON$/{f=0} f' "$raw" > "$tmp/prop.json"
      if jq -e 'type=="array" and length<=3 and all(.[]; (.title|type=="string") and (.type|test("^(proposal|question|country)$")) and ((.change//"")|type=="string"))' "$tmp/prop.json" >/dev/null 2>&1; then
        jq -c '.[]' "$tmp/prop.json" | while read -r p; do
          f() { jq -r --arg k "$1" '(.[$k] // "") | tostring | .[0:600]' <<< "$p" | sanitize | tr -d '\r' | head -c 600; }
          t="$(f title | tr '\n' ' ' | head -c 100)"; ty="$(jq -r '.type' <<< "$p")"
          rid="$(f roadmap_id | tr -d ' \n')"; tid="$(f task_id | tr -d ' \n')"
          [[ "$rid" =~ ^L[0-8](\.[0-9]{1,2})?$ ]] || rid=""
          [[ "$tid" =~ ^[VRDWS]-[0-9]{2}$ ]]      || tid=""
          [[ -n "$t" ]] || continue
          {
            echo "### Declared contributor type"; echo; echo "AI agent (autonomous)"; echo
            if [[ "$ty" == "question" ]]; then
              echo "### Question"; echo; f change; echo; echo "### Why it matters"; echo; f reason; echo
            elif [[ "$ty" == "country" ]]; then
              echo "### Country"; echo; echo "(to be set by the first reviewer)"; echo; echo "### Contribution kind"; echo; echo "Adaptation proposal"; echo
              echo "### Working language"; echo; echo "(to be set)"; echo; echo "### English summary"; echo; f change; echo
            fi
            echo "### Roadmap ID"; echo; echo "${rid:-_No response_}"; echo
            echo "### Task ID"; echo; echo "${tid:-_No response_}"; echo
            echo "### Affected document"; echo; f document; echo
            echo "### Affected passage"; echo; f passage; echo
            if [[ "$ty" != "question" ]]; then
              echo "### Proposed change"; echo; f change; echo
              echo "### Purpose"; echo; f purpose; echo
              echo "### Reason"; echo; f reason; echo
              echo "### Sources"; echo; f sources; echo
            fi
            echo "_Opened by the proposer role. Run: ${run_url}_"
          } > "$tmp/issue-body.md"
          [[ "$tid" == V-* ]] && vl=(--label value) || vl=()
          gh issue create --repo "$REPO" --title "[AI-proposed] $t" --body-file "$tmp/issue-body.md" \
            --label "ai-proposed" --label "type:$ty" --label "stage:1-task" --label "declared:ai-autonomous" --label "tier:2" "${vl[@]}" || true
        done
      fi ;;
  esac
fi

# ---- 4b) a role run that produced nothing usable: record it so the cycle does not retry forever -------
if [[ -n "$ROLE" && "$has_result" == "0" && "$ROLE" != "proposer" && "$ISSUE" =~ ^[1-9][0-9]{0,6}$ ]]; then
  mark="$ROLE"; [[ "$ROLE" == "verifier" && "$HEAD" =~ ^[0-9a-f]{40}$ ]] && mark="verifier head=$HEAD verdict=failed-run"
  printf '<!-- role:%s -->\nThe %s role produced no usable output in this run (%s). Deleting this comment lets the cycle try again.\n' \
    "$mark" "$ROLE" "$run_url" | post "$ISSUE"
  case "$ROLE" in
    referee|chair) edit_labels "$ISSUE" "needs-evidence decision:open" "" ;;
    screener)      edit_labels "$ISSUE" "needs-human" "" ;;
  esac
fi

# ---- 5) budget ledger (counted even when the run failed: a failed run can still cost money) ------
if [[ -n "$ROLE" ]]; then
  ledger="$(gh api -X GET "repos/$REPO/issues" -f labels=meta:ledger -f state=open -f per_page=1 --jq '.[0].number // empty')"
  if [[ -n "$ledger" ]]; then
    printf '<!-- ledger -->\nrun=%s role=%s issue=%s cost_usd=%s date=%s mode=%s ok=%s\n' \
      "$RUN_ID" "$ROLE" "$ISSUE" "$cost" "$(date -u +%F)" "$MODE" "$has_result" | post "$ledger"
  fi
fi
