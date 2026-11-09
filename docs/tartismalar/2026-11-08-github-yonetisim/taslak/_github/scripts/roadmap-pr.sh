#!/usr/bin/env bash
# roadmap-pr.sh: proposes an update of the ROADMAP.md progress table as an AUTOMATIC PULL REQUEST. It never writes to
# the default branch. Runs after the weekly digest, with the automation App token (so that the PR triggers the checks).
#
# What it does (deterministic, no AI):
#   1. reads the issues that name a Roadmap ID or a Task ID (form fields) and finds the furthest pipeline step
#      (the stage:N-... label, N = 1..7) that any of them reached, per table row (mapping: .github/roadmap-map.tsv),
#   2. converts the step to the percentages of ROADMAP.md (5, 20, 40, 55, 70, 85, 100),
#   3. moves a row forward by at most 20 percentage points per week, never backward, never to a lower step,
#   4. opens ONE pull request that changes only those table rows. tier.py recognises such a change as Tier 1
#      (a status report, not a rule): 72 hours of cooling, anyone can hold it, anyone can revert it.
# The pull request names its evidence (issue numbers). The row text is built from fixed words only.
#
# Environment: GH_TOKEN (App token), REPO, DEFAULT_BRANCH, REPO_DIR (pristine checkout of the default branch),
#              BOT_NAME, BOT_EMAIL, RUN_ID, SERVER_URL
set -euo pipefail
cd "$REPO_DIR"
export GIT_CONFIG_NOSYSTEM=1 GIT_CONFIG_GLOBAL=/dev/null GIT_TERMINAL_PROMPT=0
tmp="$(mktemp -d)"
run_url="${SERVER_URL:-https://github.com}/$REPO/actions/runs/${RUN_ID:-0}"
week="$(date -u +%G-W%V)"

[[ -f ROADMAP.md && -f .github/roadmap-map.tsv ]] || { echo "No ROADMAP.md or roadmap-map.tsv. Nothing to do."; exit 0; }
open_pr="$(gh api -X GET search/issues -f q="repo:$REPO is:pr is:open label:roadmap-progress" --jq '.total_count' 2>/dev/null || echo 0)"
(( open_pr == 0 )) || { echo "A roadmap-progress pull request is already open."; exit 0; }

# 1) evidence: every issue with a stage label, with its two ID fields
gh api --paginate "repos/$REPO/issues?state=all&per_page=100&sort=updated&direction=desc" 2>/dev/null \
  | jq -c '
      def field($h): ((.body // "") | gsub("\r";"") | split("\n")) as $l
        | ($l | index($h)) as $i
        | if $i == null then "" else ([ $l[($i+1):][] | select(length>0) ] | .[0] // "") end;
      .[] | select(.pull_request == null)
      | { n: .number,
          rid: (field("### Roadmap ID") | gsub("^\\s+|\\s+$";"")),
          tid: (field("### Task ID")    | gsub("^\\s+|\\s+$";"")),
          step: ([ .labels[].name | select(test("^stage:[1-7]-")) | .[6:7] | tonumber ] | max // 0) }
      | select(.step > 0 and (.rid != "" or .tid != ""))' 2>/dev/null | head -n 1500 > "$tmp/evidence.ndjson" || true

# 2) compute and rewrite the table
python3 -I - "$tmp/evidence.ndjson" .github/roadmap-map.tsv ROADMAP.md "$tmp/summary.txt" <<'PY'
import json, re, sys
ev_path, map_path, road_path, out_path = sys.argv[1:5]
PCT = {1: 5, 2: 20, 3: 40, 4: 55, 5: 70, 6: 85, 7: 100}
NAME = {1: "Task", 2: "Proposal", 3: "Reviews", 4: "Defence and reply", 5: "Referee", 6: "Text", 7: "Languages and publication"}
ev = [json.loads(l) for l in open(ev_path, encoding="utf-8") if l.strip()]
maps = []
for l in open(map_path, encoding="utf-8"):
    if l.startswith("#") or not l.strip():
        continue
    layer, item, rid_re, tid_re = l.rstrip("\n").split("\t")
    maps.append((layer, item, re.compile(rid_re), re.compile(tid_re)))
text = open(road_path, encoding="utf-8").read().split("\n")
ROW = re.compile(r"^\|\s*(L[0-8])\s*\|\s*([^|]+?)\s*\|\s*([^|]+?)\s*\|\s*`([█░]{10})`\s*([0-9]{1,3})(?:–[0-9]{1,3})?%\s*\|\s*$")
changed, lines = 0, []
for i, line in enumerate(text):
    m = ROW.match(line)
    if not m:
        continue
    layer, item, _stage, _bar, cur = m.group(1), m.group(2), m.group(3), m.group(4), int(m.group(5))
    for (ml, mi, rr, tr) in maps:
        if ml == layer and mi == item:
            hits = [e for e in ev if rr.match(e["rid"]) or (tr.pattern != "^$" and tr.match(e["tid"]))]
            if not hits:
                break
            step = max(e["step"] for e in hits)
            target = PCT[step]
            new = min(target, cur + 20)
            if new <= cur:
                break
            # keep to the nearest pipeline percentage that is not above the cap
            allowed = [p for p in PCT.values() if cur < p <= new]
            if not allowed:
                break
            new = max(allowed)
            stepname = NAME[[k for k, v in PCT.items() if v == new][0]]
            filled = max(1, new // 10) if new > 0 else 0
            bar = "█" * filled + "░" * (10 - filled)
            text[i] = "| %s | %s | %s | `%s` %d%% |" % (layer, item, stepname, bar, new)
            nums = sorted({e["n"] for e in hits if e["step"] >= [k for k, v in PCT.items() if v == new][0]})[:8]
            lines.append("- %s %s: %d%% -> %d%% (%s). Evidence: %s" % (layer, item, cur, new, stepname, ", ".join("#%d" % n for n in nums)))
            changed += 1
            break
if changed:
    open(road_path, "w", encoding="utf-8").write("\n".join(text))
open(out_path, "w", encoding="utf-8").write("\n".join(lines))
print(changed)
PY
git diff --quiet -- ROADMAP.md && { echo "The progress table is up to date."; exit 0; }

# 3) the evidence issue and the pull request
{
  echo "This issue records the evidence for the automatic ROADMAP.md progress update of week $week."
  echo
  echo "Progress is measured by the pipeline step an item has reached (ROADMAP.md, \"How every item is made\"), taken from the stage labels of linked issues. A row moves forward by at most 20 percentage points per week and never backward."
  echo
  cat "$tmp/summary.txt"
  echo
  echo "_Generated by a workflow, no AI. Run: ${run_url}_"
} > "$tmp/evidence.md"
ino="$(gh issue create --repo "$REPO" --title "Roadmap progress, $week" --body-file "$tmp/evidence.md" --label "meta:roadmap" | grep -oE '[0-9]+$')"
branch="auto/roadmap-$week-${RUN_ID:-0}"
git checkout -q -b "$branch"
git add -- ROADMAP.md
git config user.name  "${BOT_NAME:-github-actions[bot]}"
git config user.email "${BOT_EMAIL:-41898282+github-actions[bot]@users.noreply.github.com}"
git -c core.hooksPath=/dev/null commit -q -m "Roadmap progress, $week"
git -c core.hooksPath=/dev/null push -q "https://x-access-token:${GH_TOKEN}@github.com/${REPO}.git" "HEAD:refs/heads/$branch"
{
  echo "Linked issue: #$ino"
  echo
  echo "Automatic weekly update of the ROADMAP.md progress table (never written directly to the default branch)."
  echo
  echo "This is a status report, not a rule, so it is **Tier 1**: 72 hours of cooling, then automation merges it. Anyone can hold it (label \`hold\`), correct it, or revert it. The evidence is in issue #$ino."
  echo
  cat "$tmp/summary.txt"
  echo
  echo "Run: $run_url"
} > "$tmp/pr-body.md"
pr_url="$(gh pr create --repo "$REPO" --base "$DEFAULT_BRANCH" --head "$branch" --title "Roadmap progress, $week" --body-file "$tmp/pr-body.md")"
gh pr edit "${pr_url##*/}" --repo "$REPO" --add-label "roadmap-progress" --add-label "ai-authored" --add-label "tier:1" || true
echo "Opened $pr_url"
