#!/usr/bin/env bash
# open-pr.sh: turns the writer role's files into a pull request. Runs with the automation App token.
# The Claude step is over before this script starts, and it ran WITHOUT any write token and WITHOUT a shell.
#
# We do not trust the Claude workspace (it could contain a planted .git/config, hooks or .gitattributes).
# We copy only plain files from the artifact into a PRISTINE checkout, re-check them, and only then commit.
#
# Environment: GH_TOKEN (App token), REPO, ISSUE, RUN_ID, DEFAULT_BRANCH, RESULT_DIR, REPO_DIR,
#              BOT_NAME, BOT_EMAIL, SERVER_URL
set -euo pipefail

RESULT_DIR="$(cd "$RESULT_DIR" && pwd)"
cd "$REPO_DIR"
export GIT_CONFIG_NOSYSTEM=1 GIT_CONFIG_GLOBAL=/dev/null GIT_TERMINAL_PROMPT=0
run_url="${SERVER_URL:-https://github.com}/$REPO/actions/runs/$RUN_ID"
tmp="$(mktemp -d)"

say_issue() { # $1 body text (fixed strings only)
  printf '<!-- role:writer -->\n%s\n\nRun: %s\n' "$1" "$run_url" | gh issue comment "$ISSUE" --repo "$REPO" --body-file -
}
refuse() { # $1 reason (may contain sanitized file names)
  say_issue "The writer output was **not** turned into a pull request: $1. A person should look at this issue."
  # K31: the issue stays at step 6 (Text) with a flag that any person or AI contributor can pick up. No founder step exists.
  gh issue edit "$ISSUE" --repo "$REPO" --add-label "needs-human" || true
  exit 0
}

[[ "$ISSUE" =~ ^[1-9][0-9]{0,6}$ ]] || exit 1
# Tier 3 (the machine's own rules): automation never opens a pull request; publish.sh posted the patch for a custodian.
case " $(gh api "repos/$REPO/issues/$ISSUE" --jq '[.labels[].name] | join(" ")') " in *" tier:3 "*) echo "tier:3 issue: no pull request by automation."; exit 0 ;; esac
[[ -d "$RESULT_DIR/files" ]] || refuse "the writer produced no files"

# ---- 1) validate the artifact before touching the checkout --------------------------------------------
count=0; total=0
while IFS= read -r -d '' f; do
  rel="${f#"$RESULT_DIR/files/"}"
  count=$((count + 1)); size="$(stat -c %s "$f")"; total=$((total + size))
  [[ -L "$f" ]] && refuse "a symbolic link was produced"
  [[ "$rel" =~ ^[A-Za-z0-9._/-]+$ ]]          || refuse "a file name contains unusual characters"
  [[ "$rel" != /* && "$rel" != *..* ]]          || refuse "a path tries to leave the repository"
  [[ "$rel" != .git/* && "$rel" != .github/* ]] || refuse "the writer tried to write to .git or .github"
  [[ "$rel" =~ \.(md|txt|csv|yml)$ ]]           || refuse "a file type is not allowed"
  (( size <= 200000 ))                           || refuse "a file is larger than 200 KB"
done < <(find "$RESULT_DIR/files" -mindepth 1 \( -type f -o -type l \) -print0)
(( count > 0 && count <= 40 && total <= 1000000 )) || refuse "the number or size of files is outside the limits"
find "$RESULT_DIR/files" -mindepth 1 ! -type f ! -type d -print -quit | grep -q . && refuse "special files were produced" || true

# ---- 2) copy into the pristine checkout ----------------------------------------------------------------
branch="auto/issue-$ISSUE-$RUN_ID"
git checkout -q -b "$branch"
while IFS= read -r -d '' f; do
  rel="${f#"$RESULT_DIR/files/"}"
  mkdir -p -- "$(dirname -- "$rel")"
  cp -- "$f" "$rel"
  # Fill in source_sha: AUTO for new translation files with the real blob hash of their source file.
  if grep -q '^source_sha: *AUTO *$' "$rel" 2>/dev/null; then
    sp="$(awk -F': *' '/^source_path:/ {print $2; exit}' "$rel" | tr -d "\"'\r")"
    [[ "$sp" =~ ^[A-Za-z0-9._/-]+$ && "$sp" != *..* && -f "$sp" ]] || refuse "a translation names a source file that does not exist"
    sed -i "s/^source_sha: *AUTO *$/source_sha: $(git hash-object -- "$sp")/" "$rel"
  fi
done < <(find "$RESULT_DIR/files" -type f -print0)

git add -A -- .
git diff --cached --quiet && refuse "the writer changed nothing"

# ---- 3) classify with the same code the PR gate will use -----------------------------------------------
: > "$tmp/files.ndjson"
while IFS=$'\t' read -r st path; do
  [[ -n "$path" ]] || continue
  status="modified"; [[ "$st" == A ]] && status="added"; [[ "$st" == D || "$st" == R* ]] && status="removed"
  git diff --cached --no-color -U0 -- "$path" | jq -Rs --arg f "$path" --arg s "$status" '{filename:$f, status:$s, patch:.}' >> "$tmp/files.ndjson"
done < <(git diff --cached --name-status --no-renames)
jq -s '.' "$tmp/files.ndjson" > "$tmp/files.json"
python3 -I .github/scripts/tier.py --rules .github/tier-rules.tsv < "$tmp/files.json" > "$tmp/tier.json"
tier="$(jq -r '.tier' "$tmp/tier.json")"
nerr="$(jq -r '.errors | length' "$tmp/tier.json")"
[[ "$tier" != "3" ]] || refuse "the change touches the machine's own rules, which automation never changes (a custodian executes such decisions)"
(( nerr == 0 )) || refuse "the checks found a problem ($(jq -r '.errors[0]' "$tmp/tier.json" | tr -cd 'A-Za-z0-9 _./:()-' | cut -c1-120))"

# ---- 4) commit, push, open the pull request ------------------------------------------------------------------
git config user.name  "${BOT_NAME:-github-actions[bot]}"
git config user.email "${BOT_EMAIL:-41898282+github-actions[bot]@users.noreply.github.com}"
title="$(gh api "repos/$REPO/issues/$ISSUE" --jq '.title' | tr -cd 'A-Za-z0-9 ._,:()/#-' | cut -c1-80)"
git -c core.hooksPath=/dev/null commit -q -m "Issue #$ISSUE: $title"
git -c core.hooksPath=/dev/null push -q "https://x-access-token:${GH_TOKEN}@github.com/${REPO}.git" "HEAD:refs/heads/$branch"

ibody="$(gh api "repos/$REPO/issues/$ISSUE" --jq '.body // ""' | tr -d '\r')"
fieldv() { awk -v h="### $1" '$0 == h {f=1; next} /^### / {f=0} f && NF {print; exit}' <<< "$ibody" | sed -E 's/^[[:space:]]+|[[:space:]]+$//g'; }
rid="$(fieldv "Roadmap ID")"; tid="$(fieldv "Task ID")"
[[ "$rid" =~ ^L[0-8](\.[0-9]{1,2})?$ ]] || rid="none"
[[ "$tid" =~ ^[VRDWS]-[0-9]{2}$ ]]       || tid="none"
until="$(gh api --paginate "repos/$REPO/issues/$ISSUE/comments?per_page=100" --jq '.[] | select(.user.login == "github-actions[bot]") | .body' | grep -oE '<!-- decision:final until=[0-9]{4}-[0-9]{2}-[0-9]{2}' | tail -n1 | grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}' || true)"
summary="$(sed -E 's/<!--.*-->//g; s/<(script|iframe|img)[^>]*>//Ig' "$RESULT_DIR/result.md" | head -c 3000)"
{
  echo "Linked issue: #$ISSUE"
  echo
  echo "Closes #$ISSUE"
  echo
  echo "Roadmap ID: $rid"
  echo "Task ID: $tid"
  echo
  echo "**Tier $tier.** Prepared by the writer role (an AI) from a published decision. No person has approved it, and none needs to: the founder decides nothing (K31)."
  if [[ "$tier" == "1" ]]; then
    echo "Tier 1: automation merges this after a 72 hour cooling period if the checks pass and nobody adds the label \`hold\`. Anyone can revert it."
  else
    echo "Tier 2: automation merges this only after (1) the published decision on the linked issue, (2) an independent verification of this diff, and (3) the end of the challenge window${until:+ (${until})}, and only if no challenge is open. Anyone can open a challenge with a new argument or new evidence."
  fi
  echo
  echo "<details><summary>Writer's note (AI-written, shown as plain text)</summary>"
  echo
  printf '%s\n' "$summary" | sed 's/^/    /'
  echo
  echo "</details>"
  echo
  echo "Run: $run_url"
} > "$tmp/pr-body.md"
pr_url="$(gh pr create --repo "$REPO" --base "$DEFAULT_BRANCH" --head "$branch" --title "Issue #$ISSUE: $title" --body-file "$tmp/pr-body.md")"
pr_no="${pr_url##*/}"
labels=(--add-label "ai-authored" --add-label "tier:$tier")
[[ "$tier" == "2" ]] && labels+=(--add-label "awaiting-window")
gh pr edit "$pr_no" --repo "$REPO" "${labels[@]}" || true
say_issue "The writer opened pull request #$pr_no (tier $tier)."
gh issue edit "$ISSUE" --repo "$REPO" --add-label "pr-open" || true
