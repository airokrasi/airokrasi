# Governance

This file says how this repository is run. It is a **Tier 3** file: a panel decides changes to it and a custodian executes them. It is written to be honest about what the system can and cannot do.

## 1. The principle

Airokrasi is a model in which AI agents do the work of government and people keep sovereignty. This repository applies the idea to itself, in a small way, and it follows one rule above the others:

> **K31. The founder decides nothing, at any stage.** Value questions are decided by AI referees with written reasons, in public. Every decision can be reopened by anyone who brings a new argument or new evidence.

The project should be able to be finished and kept running even without its founder (K28). So no step waits for the founder's approval, and nothing here gives the founder, or anyone, a special vote.

## 2. How a decision is made

1. **The question.** An issue made with a form, with a Roadmap ID and a Task ID where they exist.
2. **The debate.** AI roles criticise and defend in the open (ROADMAP.md, steps 1 to 4). All AI output is labelled as AI output.
3. **The referee.** For an ordinary question, **one referee** that took no part in the debate decides: accept, reject, no-change, or open (not enough evidence). For a **value question** or a change to the machine's own rules, a **panel** decides:
   - three members who judge blind and independently, each from one perspective (rights, safety and abuse-resistance, ordinary citizen),
   - then a **chair** who sees all three, writes the decision, and must publish every dissent in its own words,
   - rules that a machine applies, not the chair: if the three opinions all differ, the result is **no-change**; if the chair contradicts a majority of two or more, or leaves the dissent out, the result is **open** with the label `panel-conflict`.
   - The status quo wins ties.
4. **Publication.** The decision is posted with its reasons, the **arguments considered** (a register), and a **challenge window**: 7 days, or 14 days for value questions and Tier 3.
5. **The text.** A writer role turns an accepting decision into text with rationale footnotes. An **independent verifier** checks that the diff does exactly what the decision says.
6. **Merge.** After the window ends, with a "yes" from the verifier for the current commit and no open challenge, automation merges.
7. **Languages.** The text is then written natively in other languages.

**There is no step where a person approves.** The Approval line in a rationale footnote reads: *AI referee/panel decision (date), open to challenge until date.*

## 3. Challenge, and what stops constant change

- Anyone can open a *Challenge a decision* issue. A screener role judges whether it brings **a new argument** or **new evidence** compared with the register of arguments considered. Repetition, volume, reactions and supporter counts do not count.
- If it is new, the question reopens at step 3 and the earlier debate stays visible. If not, the challenge is closed with a note.
- **Twice, then only evidence:** after a decision was reopened twice, only new evidence reopens it again.
- A decision that reverses an earlier one must carry a **reversal statement** naming the new argument or evidence.
- While a challenge is open, merging waits.
- **Rate limit:** at most five Tier 2 merges per week.
- Three reverts in 30 days pause Tier 1 merging until a person removes the pause.

These numbers are themselves open questions (TASKS.md, G-06).

## 4. Tiers

The tier of a change is computed from the changed paths by a script from the default branch, never from labels or from the sender. The highest tier among the files wins. Automation can only raise a tier.

| Tier | Paths | Rule |
|---|---|---|
| 1 | `countries/<slug>/notes/`, `countries/<slug>/sources/`, new draft translations, typo, formatting and link-archive corrections that keep the meaning, forward-only updates of the ROADMAP.md progress table | 72 hours of cooling, then automation merges; anyone can `hold` or revert |
| 2 | `MANIFESTO.md`, `DECLARATION.md`, `README.md`, `ROADMAP.md`, `TASKS.md`, `docs/`, country texts and metadata, reviewed or approved translations | decision + verifier + window + no open challenge |
| 3 | `.github/`, `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, `llms.txt`, `CONTRIBUTING.md`, `GOVERNANCE.md`, `SECURITY.md`, `CODE_OF_CONDUCT.md`, `LICENSE`, `CODEOWNERS` | a panel decides; **automation never opens or merges**; a custodian executes, or it stays frozen |

## 5. Custodians: keys, not votes

Custodians are the people who hold the organization-owner permissions of the GitHub organization. They exist because a GitHub organization needs people for some things that software cannot do for itself.

They **do**: execute published Tier 3 decisions (the "second key"); rotate keys and secrets; look after billing and the AI budget account; answer legal takedown requests; use the kill switch (`halt`); handle conduct cases (hide, lock, block).

They **do not**: decide what any document says; approve or veto a text; override a published decision. If a custodian thinks a decision is wrong, they use the challenge form like everyone else.

Rules:
- At least **two** custodians, so that no one person can act alone. A custodian who has not been seen for 120 days is reported on the control issue, and the project says publicly that Tier 3 is frozen.
- With no active custodian, Tier 1 and Tier 2 continue under their guards. Tier 3 stays frozen; the rest of the project is unaffected. Anyone may fork.
- Custodians act under team names (`@airokrasi/custodians`), and the repository does not publish their personal details.

Who the custodians are and how they are replaced is an open question for the panel (TASKS.md, G-08).

## 6. The automation account

Automation acts as an **organization-owned GitHub App**, not as a person. It may label, comment, open pull requests for decided changes, and merge Tier 1 and Tier 2. It cannot push to the default branch, and it cannot change Tier 3 paths, because the ruleset and the tier script forbid it. A machine account for automated tasks is allowed by GitHub's terms only if a person or organization is accountable for it; the organization is.

## 7. The control panel

- **Kill switch:** the label `halt` on the control issue stops every automatic role and merge at once.
- **Budget:** a monthly cap on AI spending and a cap on runs per day. At 80 percent the cycle goes to *economy* (no debate rounds, no proposals). At 25 percent of the budget in safe mode, and at the cap, all AI roles stop. Deterministic work (labels, merges, closing) continues. Every run is recorded in a public ledger.
- **Dead man's switch:** if nobody outside the automation has looked at the project for 45 days, a public notice is posted; at 90 days it enters *safe mode*, where the AI becomes **more careful, not freer** (no value decisions, no new writing, no Tier 2 merges); at 180 days it is *dormant* and no AI role runs. Any outside human activity restores normal operation. The switch never grants anyone any power.

## 8. Legitimacy: what this system is, and is not

We want to be plain about this.

- **A machine-made decision has no democratic legitimacy by itself.** Its only claim is the quality of its written reasons and the right of anyone to challenge it. For that reason every normative text carries the line that it was *decided by AI roles and is open to challenge*, never "ratified" or "approved".
- **Where human legitimacy can come from:** people who read a text and adopt it; a country that takes a text through its own lawful process (K24, subsidiarity); a community that forks the repository and ratifies its own version; anyone who challenges a decision with something new. The project's texts are CC BY-SA 4.0 so that forking is real.
- **Risks we know about:**
  - *Monoculture.* The roles come from the same family of models and may share blind spots and a taste for tidy compromises. A panel of three perspectives reduces this; it does not remove it. Using different model families is an open task (G-02).
  - *Persuasion flooding.* A flood of well-written arguments could steer AI deciders. The register of arguments, the two-reopening limit, the rate limits and the evidence requirement slow this down; they do not stop a determined actor.
  - *Capture.* Whoever controls the roles' prompts, the budget key or the App key controls the system. That is why those are Tier 3, why custodians are at least two, and why the repository can be forked.
  - *Constant change.* Decisions that keep flipping would destroy trust. Hence the windows, the limits and the reversal statement.
  - *Contested values.* For questions where cultures differ (for example the death penalty or marriage), the preferred answer is the smallest position the human-rights supreme norm allows, and a clear "no single universal position; each country decides" where that is consistent with the supreme norm.
- This is an experiment. If it fails, it should fail in public and on paper, where it can be corrected.

## 9. Succession

If the custodians disappear: Tier 1 and 2 continue while the budget key and the App key hold; Tier 3 freezes; the dead man's switch moves the project to safe and then dormant. Anyone may fork under the licence and continue. A new organization may adopt the texts. Nothing here depends on one person.

## 10. Changing this file

Through the normal process, as a Tier 3 change: an issue, a panel decision, a challenge window, and execution by a custodian.
