#!/usr/bin/env bash
# heartbeat.sh: the dead man's switch, reworked for K31.
#
# K31 changed what it measures. The project no longer waits for a founder, so "founder presence" is meaningless.
# It now measures EXTERNAL HUMAN ATTENTION: the newest activity (issue, comment, review, pull request) by any account
# that is a person account and not an automation (user type "User"; GitHub Apps and "[bot]" accounts do not count).
# Custodian presence (people with OWNER / MEMBER / COLLABORATOR association) is measured and REPORTED separately,
# because only custodians can rotate keys, pay the bill, answer legal takedowns and execute Tier 3 decisions.
#
# States (attention): normal -> quiet (>= WARN_DAYS) -> safe-mode (>= SAFE_DAYS) -> dormant (>= DORMANT_DAYS)
#   quiet      public notice only
#   safe-mode  AI becomes MORE careful, not freer: 25 % of the budget, no proposer, no writer, no value decisions,
#              no Tier 2 merges (corrections that are already in the queue may still merge)
#   dormant    no Claude role at all; deterministic housekeeping only
# The switch never grants anyone any power. Any outside human activity returns the project to normal.
#
# Known weaknesses (written in the design, 02-tasarim.md): a person-account that is really an AI agent counts as a
# human; an attacker can keep the state "normal" with cheap comments, which only keeps the ordinary (guarded) routine
# running; nobody can force "dormant" except by silence.
#
# Environment: GH_TOKEN, REPO, WARN_DAYS (45), SAFE_DAYS (90), DORMANT_DAYS (180), CUSTODIAN_ALERT_DAYS (120),
#              GITHUB_OUTPUT (optional)
set -euo pipefail

WARN_DAYS="${WARN_DAYS:-45}"; SAFE_DAYS="${SAFE_DAYS:-90}"; DORMANT_DAYS="${DORMANT_DAYS:-180}"; CUST_DAYS="${CUSTODIAN_ALERT_DAYS:-120}"
now="$(date -u +%s)"
ctl="$(gh api -X GET "repos/$REPO/issues" -f labels=meta:control -f state=open -f per_page=1 --jq '.[0].number // empty')"
[[ -n "$ctl" ]] || { echo "No control issue (label meta:control). Nothing to do."; exit 0; }

newest() { sort -r | head -n1; }
# any person account, any association
c_any="$(gh api -X GET "repos/$REPO/issues/comments" -f sort=created -f direction=desc -f per_page=100 \
  --jq '.[] | select(.user.type == "User") | .created_at' | newest || true)"
i_any="$(gh api -X GET "repos/$REPO/issues" -f state=all -f sort=created -f direction=desc -f per_page=100 \
  --jq '.[] | select(.user.type == "User") | .created_at' | newest || true)"
# custodians only
c_cus="$(gh api -X GET "repos/$REPO/issues/comments" -f sort=created -f direction=desc -f per_page=100 \
  --jq '.[] | select(.user.type == "User") | select(.author_association | IN("OWNER","MEMBER","COLLABORATOR")) | .created_at' | newest || true)"
r_any=""; r_cus=""
for n in $(gh api -X GET "repos/$REPO/pulls" -f state=all -f per_page=30 -f sort=updated -f direction=desc --jq '.[].number'); do
  a="$(gh api "repos/$REPO/pulls/$n/reviews?per_page=100" --jq '.[] | select(.user.type == "User") | .submitted_at' 2>/dev/null | newest || true)"
  b="$(gh api "repos/$REPO/pulls/$n/reviews?per_page=100" --jq '.[] | select(.user.type == "User") | select(.author_association | IN("OWNER","MEMBER","COLLABORATOR")) | .submitted_at' 2>/dev/null | newest || true)"
  [[ -n "$a" && ( -z "$r_any" || "$a" > "$r_any" ) ]] && r_any="$a"
  [[ -n "$b" && ( -z "$r_cus" || "$b" > "$r_cus" ) ]] && r_cus="$b"
done
last_any="$(printf '%s\n' "$c_any" "$i_any" "$r_any" | newest)"
last_cus="$(printf '%s\n' "$c_cus" "$r_cus" | newest)"
created="$(gh api "repos/$REPO/issues/$ctl" --jq '.created_at')"
[[ -n "$last_any" ]] || last_any="$created"
[[ -n "$last_cus" ]] || last_cus="$created"
days=$(( (now - $(date -u -d "$last_any" +%s)) / 86400 ))
cdays=$(( (now - $(date -u -d "$last_cus" +%s)) / 86400 ))

state="normal"
(( days >= WARN_DAYS ))    && state="quiet"
(( days >= SAFE_DAYS ))    && state="safe-mode"
(( days >= DORMANT_DAYS )) && state="dormant"

labels=" $(gh api "repos/$REPO/issues/$ctl" --jq '[.labels[].name] | join(" ")') "
current="normal"
[[ "$labels" == *" state:quiet "* ]]     && current="quiet"
[[ "$labels" == *" state:safe-mode "* ]] && current="safe-mode"
[[ "$labels" == *" state:dormant "* ]]   && current="dormant"

echo "Days since outside human attention: $days. Days since a custodian was seen: $cdays. State: $current -> $state."
if [[ -n "${GITHUB_OUTPUT:-}" ]]; then
  { echo "days=$days"; echo "custodian_days=$cdays"; echo "state=$state"; } >> "$GITHUB_OUTPUT"
fi

if [[ "$state" != "$current" ]]; then
  args=()
  for s in quiet safe-mode dormant; do [[ "$s" != "$state" && "$labels" == *" state:$s "* ]] && args+=(--remove-label "state:$s"); done
  [[ "$state" != "normal" ]] && args+=(--add-label "state:$state")
  (( ${#args[@]} == 0 )) || gh issue edit "$ctl" --repo "$REPO" "${args[@]}"
  case "$state" in
    normal)    msg="A person outside the automation was active again ($days days since the last sign). The project is back to normal." ;;
    quiet)     msg="No person has looked at the project for $days days. Routine work continues and the weekly digest says that the project is waiting for human attention." ;;
    safe-mode) msg="No person has looked at the project for $days days. **Safe mode:** the AI roles become more careful, not freer: 25 percent of the monthly budget, no new proposals, no writer, no value decisions, no Tier 2 merges. Anyone may fork the project under its licence." ;;
    dormant)   msg="No person has looked at the project for $days days. **Dormant:** all AI roles are off; only deterministic housekeeping runs. @airokrasi/custodians: please look at the repository, the budget and the keys. Anyone may fork the project under its licence." ;;
  esac
  printf '%s\n\n_Automatic notice. Nothing in this message grants anyone any authority._\n' "$msg" | gh issue comment "$ctl" --repo "$REPO" --body-file -
fi

# Custodian presence is reported on its own (once per state change, tracked with a label).
if (( cdays >= CUST_DAYS )) && [[ "$labels" != *" custodian:absent "* ]]; then
  gh issue edit "$ctl" --repo "$REPO" --add-label "custodian:absent" || true
  printf 'No custodian (organization owner or team member) has been seen for %s days. Tier 3 changes (the machine'"'"'s own rules) stay frozen, and keys, billing and legal takedowns have nobody to look after them. Tier 1 and Tier 2 continue under their guards. @airokrasi/custodians: please check in. See GOVERNANCE.md, section on custodians.\n' "$cdays" \
    | gh issue comment "$ctl" --repo "$REPO" --body-file -
elif (( cdays < CUST_DAYS )) && [[ "$labels" == *" custodian:absent "* ]]; then
  gh issue edit "$ctl" --repo "$REPO" --remove-label "custodian:absent" || true
fi
