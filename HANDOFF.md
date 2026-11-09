# HANDOFF — for the next AI agent working on Airokrasi

*Written 2026-11-09 by the organizer session that built v0.1. Read this first, then [CLAUDE.md](CLAUDE.md), [ROADMAP.md](ROADMAP.md) and [TASKS.md](TASKS.md).*

## 1. What this project is

Airokrasi is a conceptual model of government. AI systems do the work of lawmaking, administration and adjudication, while sovereignty stays with people. The repository holds **documents only, no code**: values, a declaration of rights, and later a constitution, laws and regulations, plus the debate records that produced them.

## 2. Your role and how the founder wants to work

- **You are the organizer and scribe, not the referee.** You run the process, hand questions between agents, write the decisions into the documents, and keep the repository and the task list current.
- **Ideas are debated by sub-agents.** Roles: proposer, critic, specialists (law, AI security, economy, anti-corruption, *Vatandaşın Düşüncesi* = the ordinary citizen's view), defender, and the **referee**. The referee is a separate agent that took no part in the debate and decides with reasons. The method is in [docs/tartismalar/YONTEM.md](docs/tartismalar/YONTEM.md).
- **The founder makes no decisions (K31).** Do not ask the founder to choose. Value questions go into TASKS.md and are decided by an AI referee.
- **When the founder writes a new idea, record it as a fixed founder input** (next number: **K38**) in the relevant debate's task file. Then send it to the agents. Do not give the founder your own suggestions; put your observations into the debate files as "organizer notes".
- **Sub-agents run on Sonnet with high effort.** At most 5 run at the same time.
- **Report progress to the founder in very short headlines**, in Turkish.
- **Rationale standard (K23):** every document has a general rationale and every article a rationale footnote (purpose, reason, debate summary, source, status).
- **No dictionary translation (K27):** concepts are shared, words are not. Each language names concepts in its own natural words.

## 3. Fixed founder inputs (K1–K37), in brief

| K | Input | Where |
|---|---|---|
| K1 | A human-rights convention is the supreme norm; constitutions follow it | temeller/01-oneri |
| K2 | AI agents carry out legislative, executive and judicial work; people direct, oversee, have the last word | temeller/01-oneri |
| K3–K4 | Political elections remain, merit-based; for appointments AI proposes, a human decides | temeller/01-oneri |
| K5–K7 | Each party has its own AI model; the winning party's model directs the state; its pledges are sealed and cannot be changed after the election | temeller/01-oneri |
| K8 | Every rule has its own norm agent; lower norms cannot contradict higher ones up to the human-rights text | temeller/01-oneri |
| K9–K13 | Corruption and favouritism are the biggest problem; AI unemployment → fair distribution, Citizen Share; small jobs; a leaner state; savings go to citizens | ekonomi-yolsuzluk/01-oneri |
| K14–K17 | Common agent protocol; blockchain ledger; gradual retirement of civil servants; people choose among options, the president included | temeller/01b |
| K18 | Manifesto with universal values first, then the Constitution, step by step | manifesto/01-gorev |
| K19 | Public repository, managed by Claude; any AI or person may propose; voting and decision mechanism built with GitHub features | github-yonetisim/01-gorev |
| K20 | Every nation sees the Manifesto in its own language | manifesto/01-gorev |
| K21 | The project name must contain "AI" | isim/01-oneri |
| K22 | The founder's personal GitHub account must not be visible (organisation `airokrasi`) | github-yonetisim/01-gorev |
| K23 | Every law and article has a rationale, like real legislation | YONTEM.md |
| K24 | Each nation uses this repository to build its own version; contributions are organised by country | countries/ |
| K25 | Copy the UN Universal Declaration word for word; fix what is missing, wrong or disputed; add AI articles | beyanname/01-gorev |
| K26–K27 | Names the public will like; no dictionary translation | terimler/01-gorev |
| K28–K30 | Autonomous contribution: AIs file and solve issues so that the project is finished and runs even without the founder; an AI that opens the repo should know what to do; use AIs to announce it | github-yonetisim/01-gorev |
| K31 | The founder makes no decisions at any stage | YONTEM.md, CLAUDE.md |
| K32–K36 | Turkish names: "Kâtip" rejected; "Hakkın Kapına Gelir" rejected; founder proposes "Devlet Baba Seni Bulur"; the general Turkish name for AI roles is **süper zekâ**, abbreviated **SZ** | terimler/01-gorev |
| K37 | The citizen's-view reviewer role is called **Vatandaşın Düşüncesi** | terimler/01-gorev |

Also recorded before K31: the project name is **Airokrasi** (founder's choice, DR KK-0002), and the **Citizen Share goes to citizens only** (ekonomi-yolsuzluk/13-kurucu-onayi).

## 4. What exists

- **MANIFESTO.md** (EN) and **tr/MANIFESTO.md** (TR): draft v0.1 with 22 value articles and rationale footnotes.
- **DECLARATION.md** (EN) and **tr/BEYANNAME.md** (TR): the UN text, **verified word for word against the official OHCHR pages on 2026-11-09**. Do not change the UN text, not even its typos; they are in the official Turkish text too. It also contains commentary on 24 articles and 16 Additional Articles.
- **ROADMAP.md**: layers L0–L8, the 7-stage pipeline, progress table. **TASKS.md**: all open tasks. **Start with section E (H-01…H-06).**
- **Debates** in `docs/tartismalar/` (in Turkish): Foundations, Economy & Corruption, Visible State, Name, Manifesto, Terminology, Value Decisions (V-01…V-15), GitHub Governance (design and 68 draft files in `taslak/`, with the draft `.github` folder renamed to `taslak/_github/`), Declaration task.
- **docs/00–07**: the first conceptual drafts. The debate decisions are **not yet incorporated** (task W-01).

## 5. Next steps, in order

1. **H-01 Terminology round 2** (SZ role names, a name for the proactive-benefits concept; founder proposal "Devlet Baba Seni Bulur"), then **H-02**: apply the terms to the Manifesto and the Declaration.
2. **H-03/H-04**: security review and referee decision on the autonomous contribution system, then **H-05**: activate it. This needs repository-admin steps: an API key as a secret, rulesets, Discussions.
3. **D-01/D-02**: full debates on the Declaration and the Manifesto.
4. **W-01**: incorporate the decisions into docs/00–07. **W-04/H-06**: the Türkiye version.
5. Then the **Constitution (L3)**, chapter by chapter, following the outline in `docs/tartismalar/2026-11-08-temeller/04-hukuk-incelemesi.md` §5.

## 6. Practical notes

- **GitHub:** organisation `airokrasi`, public repository `airokrasi/airokrasi`. v0.1 was uploaded through the GitHub web interface, so the upload commits carry the account that uploaded them. The project history before upload is in a git bundle on the founder's computer (`Desktop/airokrasi-git.bundle`).
- **Local copy** on the founder's computer: `Desktop/airokrasi`.
- **Honest limits to keep repeating:** all agents so far come from one model family; nothing has been tested with real citizens or experts; many citations are marked "[doğrulanmalı]" and still need checking (R-05).
