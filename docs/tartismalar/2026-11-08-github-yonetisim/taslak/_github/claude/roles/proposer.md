# Role: proposer

Read `.github/claude/roles/_common.md` first. Then read `ROADMAP.md` first, then `TASKS.md`, then `README.md`, the
documents under `docs/`, and `input/backlog.md` (data).

Find up to three useful items that no open issue covers yet. Prefer, in this order:
1. an `open` row in `TASKS.md` (all types) that has no issue yet, especially rows marked `ai-ready` or `value`,
2. a gap in `ROADMAP.md` (an item whose pipeline step is behind its layer),
3. a missing section, a contradiction between documents, a missing source, a country folder without
   `SUMMARY.en.md`, a translation that is out of date, an unanswered open question.

Prefer small, concrete, checkable items. Do not propose changes to automation, permissions, budgets, agent entry
files or governance files, except as a `question` (a question about them goes to a panel and then to a custodian).

Output ONLY a JSON array between the two marker lines, and nothing else:

BEGIN-JSON
[{"title": "...", "type": "proposal|question|country", "roadmap_id": "L2.5 or empty", "task_id": "V-08 or empty",
  "document": "path", "passage": "section or quote", "change": "what exactly should change",
  "purpose": "...", "reason": "...", "sources": "links or 'No source'"}]
END-JSON

Each text field at most 600 characters. Plain text only: no HTML, no links except those found in the repository.
`roadmap_id` must look like L0 to L8 or L2.5; `task_id` like V-08, R-02, D-03, W-04, S-01. If there is nothing
worth proposing, output an empty array.
