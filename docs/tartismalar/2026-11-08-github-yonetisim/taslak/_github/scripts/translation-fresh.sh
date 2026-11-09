#!/usr/bin/env bash
# translation-fresh.sh: finds translations whose source text changed after they were written (K20).
# A translation file carries front matter: lang, source_path, source_sha (git blob hash of the source it was
# written from). If the source file now has a different blob hash, the translation is out of date.
# Nothing is changed in the repository. One issue per language lists the stale files.
# The translation's body is never read; only the first lines of front matter are parsed.
#
# Environment: GH_TOKEN, REPO, DEFAULT_BRANCH
set -euo pipefail
tmp="$(mktemp -d)"

gh api "repos/$REPO/git/trees/$DEFAULT_BRANCH?recursive=1" --jq '.tree[] | select(.type == "blob") | "\(.sha) \(.path)"' > "$tmp/tree.txt"
declare -A SHA=()
while read -r sha path; do SHA["$path"]="$sha"; done < "$tmp/tree.txt"

grep -E ' [a-z]{2,3}(-[a-z0-9]{2,8})*/.*\.md$' "$tmp/tree.txt" | grep -vE ' (docs|countries)/' | head -n 300 > "$tmp/langfiles.txt" || true

declare -A STALE=()
while read -r _ path; do
  [[ "$path" =~ ^[A-Za-z0-9._/-]+$ ]] || continue
  fm="$(gh api -H "Accept: application/vnd.github.raw" "repos/$REPO/contents/$path?ref=$DEFAULT_BRANCH" 2>/dev/null | head -n 20 | tr -d '\r' || true)"
  [[ "$(head -n1 <<< "$fm")" == "---" ]] || continue
  sp="$(awk -F': *' '/^source_path:/ {print $2; exit}' <<< "$fm" | tr -d "\"'")"
  ss="$(awk -F': *' '/^source_sha:/  {print $2; exit}' <<< "$fm" | tr -d "\"'")"
  [[ "$sp" =~ ^[A-Za-z0-9._/-]+$ && "$ss" =~ ^[0-9a-f]{40}$ ]] || continue
  cur="${SHA[$sp]:-}"
  if [[ -z "$cur" || "$cur" != "$ss" ]]; then
    lang="${path%%/*}"
    STALE["$lang"]+="- \`$path\` (source: \`$sp\`)"$'\n'
  fi
done < "$tmp/langfiles.txt"

# open or update one issue per language with stale files; close issues whose language is up to date
existing="$(gh api -X GET "repos/$REPO/issues" -f labels=translation:stale -f state=open -f per_page=100 --jq '.[] | select(.pull_request == null) | "\(.number)\t\(.title)"')"
for lang in "${!STALE[@]}"; do
  title="Out-of-date translation: $lang"
  body="$(printf 'The source text changed after these files were written. Translators: please update them by meaning (not word by word, K27) and refresh `source_sha`.\n\n%s\n_Automatic list. Only front matter was read._\n' "${STALE[$lang]}")"
  no="$(awk -F'\t' -v t="$title" '$2 == t {print $1; exit}' <<< "$existing")"
  if [[ -n "$no" ]]; then
    gh issue edit "$no" --repo "$REPO" --body "$body"
  else
    gh issue create --repo "$REPO" --title "$title" --body "$body" --label "translation:stale" --label "type:translation" --label "stage:1-task" --label "tier:1" --label "ai-ready"
  fi
done
while IFS=$'\t' read -r no title; do
  [[ -n "$no" ]] || continue
  lang="${title#Out-of-date translation: }"
  [[ -n "${STALE[$lang]:-}" ]] || { gh issue comment "$no" --repo "$REPO" --body "All files for this language are up to date again." ; gh issue close "$no" --repo "$REPO" --reason completed; }
done <<< "$existing"
