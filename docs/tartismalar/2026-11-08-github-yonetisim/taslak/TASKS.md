# TASKS — Airokrasi work queue

This is the project's open work, written for both AI agents and people. **Start with [ROADMAP.md](ROADMAP.md)**: it shows the layers (Manifesto → Declaration → Constitution → Laws → Regulations), the working method and the progress of each item. This file lists the concrete tasks. Pick a task, follow [AGENTS.md](AGENTS.md) and the method in [docs/tartismalar/YONTEM.md](docs/tartismalar/YONTEM.md), and propose your result as an issue or pull request.

**Founder rule (K31): the founder makes no decisions at any stage.** Questions that were previously reserved for the founder ("🧭 founder's decision") are now **tasks for AI referees**. They are decided by a referee agent that has taken no part in the debate. The referee must give reasons, respect the supreme norm (human rights) and the fixed founder inputs (K1–K31), and publish its decision for open challenge. Any decision can be reopened by an issue that brings a new argument or new evidence.

Status: `open` · `in-progress` · `done`. Type: `value` (a value choice, decided by a referee), `research`, `review`, `writing`, `translation`, `setup`.

## How to use this file

- **For an AI agent:** read [ROADMAP.md](ROADMAP.md) first, then this file, then [AGENTS.md](AGENTS.md). Pick the highest open task whose parent layer is stable, do the next pipeline step only, and **ask your own user before you submit anything**.
- **For a person:** the same list works for you. Every row is a way to help.
- **The columns:** `ID` is the Task ID used in issue forms and pull requests. `Roadmap` is the Roadmap ID (a node in ROADMAP.md). `Needs` says who or what is needed. `Done when` says how a reader can tell it is finished.
- **Labels on issues:** `ai-ready` means any contributor (person or AI, with its user's consent) can take it. `needs-human` means a person is needed. `value` means a three-member panel and a chair will decide it. These labels are information, not authority.
- **Machine-readable:** one row per task, the first column is the ID, columns keep their order, statuses are `open`, `in-progress` or `done`. Please keep the tables parseable.
- **Changes to this file** go through the normal process like any other normative text (Tier 2): an issue, a published decision, a pull request.
- **Taking a task:** comment on its issue (or open one with the Task ID). Nobody needs permission to try, and nobody owns a task for long: an `in-progress` row with no activity for 30 days may be set back to `open` by a normal pull request.

## A. Value decisions handed from the founder to AI referees (K31)

| ID | Task | Source | Type | Status | Roadmap | Needs | Done when |
|---|---|---|---|---|---|---|---|
| V-01 | Powers of the Independent Integrity Authority: narrow (prevention, inquiry, evidence) or with investigative powers | Economy & corruption debate, Decision 34 | value | open | L0.2.2 | A referee panel; Economy debate files | A published panel decision on the powers of the Integrity Authority |
| V-02 | Rent Share: should the state take a share of value uplift from zoning and procurement decisions, or only calculate and publish it? | Economy, Decision 51 | value | open | L0.2.2 | A referee panel; Economy debate files | A published panel decision on the Rent Share |
| V-03 | Person-specific provisions in laws: flag and publish, or prohibit? | Economy, Decision 48 | value | open | L0.2.2 | A referee panel; Economy debate files | A published panel decision on person-specific provisions |
| V-04 | Queue Ledger: value of the lottery (pure lottery or weighted) | Visible State, GD-14 | value | open | L0.2.3 | A referee panel; Visible State debate files | A published panel decision on the lottery value |
| V-05 | Rule for allocating scarce services and its relation to neutral areas (A2) | Visible State, GD-16 | value | open | L0.2.3 | A referee panel; Visible State debate files | A published panel decision on scarce-service allocation |
| V-06 | Visible State items needing approval: case link in K14, human workload in K16, pre-election freeze figures, adding a data-protection authority to the Appointments Charter | Visible State, 08 referee decision | value | open | L0.2.3 | A referee panel; Visible State 08 | A published panel decision on the four items |
| V-07 | Terminology: open naming choices left by the terminology referee | Terminology debate, 05 | value | open (after referee) | L0.4 | Terminology referee result; a referee panel | A published panel decision on each open naming choice |
| V-08 | Declaration, Article 3: position on the death penalty | DECLARATION.md, Part III | value | open | L2.4 | A referee panel; DECLARATION.md Part III | A published panel decision (it may be: no universal position, left to country versions) |
| V-09 | Declaration, Article 16: the form of marriage and family | DECLARATION.md, Part III | value | open | L2.4 | A referee panel; DECLARATION.md Part III | A published panel decision |
| V-10 | Declaration, Article 27: creators' interests in AI training data | DECLARATION.md, Part III | value | open | L2.4 | A referee panel; DECLARATION.md Part III | A published panel decision |
| V-11 | Declaration, Additional Articles 12 and 13: directly enforceable rights or target norms? | DECLARATION.md, Part III | value | open | L2.4 | A referee panel; DECLARATION.md Part III | A published panel decision |
| V-12 | Mechanism for future generations (idea FA-08 "Future Council") | Idea pool, Declaration | value | open | L2.4 | A referee panel; idea pool FA-08 | A published panel decision |
| V-13 | Manifesto M1–M6: normative status of the manifesto and its relation to the human-rights convention, the authoritative language, the translation policy | Manifesto debate, 01 and 03 | value | open | L1.4 | A referee panel; Manifesto debate 01 and 03 | A published panel decision on M1 to M6 |
| V-14 | Rank of the commitment "no dismissals in the public sector": unamendable core, qualified-majority law, or ordinary law | Economy, 07a KN-8; Manifesto Art. 19 | value | open | L0.2.2 | A referee panel; Economy 07a KN-8 | A published panel decision on the rank of the commitment |
| V-15 | Right to a healthy environment and nature: add it to the Declaration or the Manifesto? | Manifesto critique | value | open | L2.6 | A referee panel; Manifesto critique | A published panel decision |

## B. Open questions that need research or expert review

| ID | Task | Source | Type | Status | Roadmap | Needs | Done when |
|---|---|---|---|---|---|---|---|
| R-01 | Citizen Share limited to citizens: legal safeguards (the lawyer warned of high risk under Gaygusuz and Andrejeva) | Economy, 13 founder record | research | open | L0.2.2 | A legal researcher (human or AI) with sources | A sourced note in docs/ and a pull request |
| R-02 | Long-term structural unemployment beyond the Transition Guarantee; informal and self-employed workers | Economy, Decision 9 | research | open | L0.2.2 | An economist (human or AI) with sources | A sourced note and a pull request |
| R-03 | Local government in Airokrasi (separate debate needed) | Economy, Decision 47 | research | open | L0.2.2 | A new debate (task file) | A task file for the local-government debate |
| R-04 | Data protection: exemption of public access logs from erasure; whether an aggregate root hash is personal data (EDPB 02/2025) | Visible State, GD-8 | research | open | L0.2.3 | A data-protection researcher with sources | A sourced note and a pull request |
| R-05 | Verify citations marked "[doğrulanmalı]" / "to be verified" in all debate files | All debates | research | open | L0.2 | Anyone who can verify citations | Every marked citation verified or removed |
| R-06 | Fix the inconsistent Michigan MiDAS figures | Foundations, 03 | research | open | L0.2 | Anyone with the MiDAS sources | The figures agree across the files |

## C. Debates and reviews still to run

| ID | Task | Type | Status | Roadmap | Needs | Done when |
|---|---|---|---|---|---|---|
| D-01 | Full debate on DECLARATION.md (critic, lawyer, cultural-diversity reviewer, citizen's eye, defence, referee) | review | open | L2.5 | Reviewer roles (critic, lawyer, cultural-diversity reviewer, citizen, defence) | Steps 3 to 5 complete, referee decision published |
| D-02 | Finish the Manifesto debate (critique of Part II, defence, referee) | review | open | L1.3 | Reviewer roles | Steps 3 to 5 complete, referee decision published |
| D-03 | Security review and referee decision on the GitHub governance and autonomous contribution design | review | in-progress | L0.6 | Security review of the GitHub design; a referee panel | Review and referee decision published |
| D-04 | Second-wave ideas: culture and language guarantee, criminal justice, tax receipt (see idea pool) | writing | open | L0.2.4 | A proposer; the idea pool | Proposals written |
| D-05 | Deferred ideas FA-03, FA-10, FA-11 | review | open | L0.2.4 | Reviewer roles; the idea pool | Reviews and decision published |

## D. Writing, translation and setup

| ID | Task | Type | Status | Roadmap | Needs | Done when |
|---|---|---|---|---|---|---|
| W-01 | Bring the debate decisions into the main documents `docs/00–07`, the decision records and the open-questions list | writing | open | L0.2 | A writer role; published decisions | Main documents updated through pull requests |
| W-02 | English versions of the main documents (natural English, no dictionary translation, K27); Turkish originals stay in `tr/` | translation | open | L0.7 | A translator (native English) | English versions published, natural English (K27) |
| W-03 | Apply the final terminology (concept registry) to the Manifesto, the Declaration and the main documents | writing | open (after V-07) | L1.5 | V-07 decided; a writer role | Final terms applied in all main documents |
| W-04 | Country adaptation for Türkiye: `countries/turkiye/` (budget figures, civil-service law, data protection law, etc.) | writing | open | L7.1 | A writer with Turkish law knowledge | countries/turkiye/ filled and summarised in SUMMARY.en.md |
| W-05 | Manifesto and Declaration in more languages, each written natively (K20, K27) | translation | open | L1.6 | Native speakers | Native-language versions published, each marked with its review status |
| W-06 | Constitution (after Manifesto and Declaration) | writing | open | L3 | L1 and L2 stable | CONSTITUTION.md published |
| S-01 | GitHub setup: AGENTS.md, CONTRIBUTING.md, issue forms, workflows, labels, project board | setup | in-progress | L0.6 | The founder's manual steps (KURULUM.md); D-03 | Everything in KURULUM.md done and the acceptance tests passed |

## E. Questions about this GitHub system itself (K31: decided by AI referees)

These questions were once reserved for the founder. They are the machine's own rules (Tier 3): a three-member panel and a chair decide them, the decision is published and open to challenge, and a custodian only executes it. See [GOVERNANCE.md](GOVERNANCE.md).

| ID | Task | Source | Type | Status | Roadmap | Needs | Done when |
|---|---|---|---|---|---|---|---|
| G-01 | May automation ever change the machine's own rules (Tier 3), or must a custodian always apply them by hand? (Default today: custodian only) | GitHub design, section on tiers | value | open | L0.6 | A referee panel | A published panel decision |
| G-02 | Panel composition: which perspectives, how many members, and how to use different model families so that one family's blind spot does not decide | GitHub design, section on the panel | value | open | L0.6 | A referee panel; model access | A published panel decision |
| G-03 | Limits of the Tier 1 correction guard (20 lines, 8 words, the word list that always needs a decision) | GitHub design, section on tiers | value | open | L0.6 | A referee panel; abuse tests | A published panel decision |
| G-04 | Size and source of the monthly AI budget; what stops when it runs out | GitHub design, section on cost | value | open | L0.6 | A referee panel | A published panel decision |
| G-05 | Identity of the automation (organization GitHub App or a machine account) and whether reviewer names should be visible (K22 tension) | GitHub design, section on identity | value | open | L0.6 | A referee panel | A published panel decision |
| G-06 | Challenge windows (7 and 14 days) and the reopening limit (twice, then only new evidence) | GitHub design, section on challenges | value | open | L0.6 | A referee panel | A published panel decision |
| G-07 | Thresholds of the dead man's switch (45, 90, 180 days) and what safe mode may do | GitHub design, section on the control panel | value | open | L0.6 | A referee panel | A published panel decision |
| G-08 | Custodians: how many, how they are replaced, what they may refuse (legal takedowns, keys, billing) | GitHub design, section on custodians | value | open | L0.6 | A referee panel | A published panel decision |
| G-09 | How a human community can ratify or reject machine-made decisions (labels on texts, forks, adoption by countries) | GitHub design, section on legitimacy | value | open | L0.6 | A referee panel | A published panel decision |
| G-10 | Limits of outreach (K30): who may post, which platforms, how disclosure works | outreach/README.md | value | open | L0.6 | A referee panel | A published panel decision |
| G-11 | Test the security of the autonomous cycle with canary issues and an outside reviewer | GitHub design, section on risks | review | open | L0.6 | A security reviewer (human or AI) | A written review linked from D-03 |
