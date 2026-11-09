#!/usr/bin/env bash
# project-sync.sh: keeps the GitHub Projects board in step with the issue labels. The board has seven columns, the 7 steps
# of ROADMAP.md: 1. Task, 2. Proposal, 3. Reviews, 4. Defence and reply, 5. Referee, 6. Text, 7. Languages and publication.
# The Status option of a card is taken ONLY from the issue's stage:N-... label. Nothing else is written.
# Deterministic, no AI. Runs with the App token (the App needs the organization permission "Projects: read and write").
#
# UNVERIFIED: the GraphQL shapes below were written from memory and have not been run against GitHub from the design
# environment. KURULUM.md has an acceptance test; if it fails, the board can be moved by hand and nothing else breaks.
#
# Environment: GH_TOKEN (App token), REPO, PROJECT_NUMBER (organization project number), MAX_ITEMS (default 150)
set -euo pipefail
owner="${REPO%%/*}"; MAX_ITEMS="${MAX_ITEMS:-150}"
[[ "${PROJECT_NUMBER:-}" =~ ^[0-9]{1,4}$ ]] || { echo "PROJECT_NUMBER is not set. Nothing to do."; exit 0; }
tmp="$(mktemp -d)"

q='query($o:String!,$n:Int!){organization(login:$o){projectV2(number:$n){id field(name:"Status"){... on ProjectV2SingleSelectField{id options{id name}}}}}}'
gh api graphql -f query="$q" -f o="$owner" -F n="$PROJECT_NUMBER" > "$tmp/proj.json"
pid="$(jq -r '.data.organization.projectV2.id // empty' "$tmp/proj.json")"
fid="$(jq -r '.data.organization.projectV2.field.id // empty' "$tmp/proj.json")"
[[ -n "$pid" && -n "$fid" ]] || { echo "Project or Status field not found."; exit 1; }
# option id by step number: the option names start with "1.", "2.", ... "7."
opt() { jq -r --arg p "$1." '.data.organization.projectV2.field.options[] | select(.name | startswith($p)) | .id' "$tmp/proj.json" | head -n1; }

gh api --paginate "repos/$REPO/issues?state=all&per_page=100&sort=updated&direction=desc" 2>/dev/null \
  | jq -c '.[] | select(.pull_request == null) | {node: .node_id, state: .state, step: ([.labels[].name | select(test("^stage:[1-7]-")) | .[6:7] | tonumber] | max // 0)} | select(.step > 0)' \
  | head -n "$MAX_ITEMS" > "$tmp/items.ndjson" || true

add='mutation($p:ID!,$c:ID!){addProjectV2ItemById(input:{projectId:$p,contentId:$c}){item{id}}}'
set_='mutation($p:ID!,$i:ID!,$f:ID!,$o:String!){updateProjectV2ItemFieldValue(input:{projectId:$p,itemId:$i,fieldId:$f,value:{singleSelectOptionId:$o}}){projectV2Item{id}}}'
n=0
exec 3< "$tmp/items.ndjson"
while read -r it <&3; do
  node="$(jq -r '.node' <<< "$it")"; step="$(jq -r '.step' <<< "$it")"
  # a closed issue that never reached the end stays where it is; only open ones and merged ones move
  [[ "$(jq -r '.state' <<< "$it")" == "open" || "$step" == "7" ]] || continue
  o="$(opt "$step")"; [[ -n "$o" ]] || continue
  item="$(gh api graphql -f query="$add" -f p="$pid" -f c="$node" --jq '.data.addProjectV2ItemById.item.id' 2>/dev/null || true)"
  [[ -n "$item" ]] || continue
  gh api graphql -f query="$set_" -f p="$pid" -f i="$item" -f f="$fid" -f o="$o" > /dev/null 2>&1 || true
  n=$((n + 1))
done
exec 3<&-
echo "Board synchronised for $n item(s)."
