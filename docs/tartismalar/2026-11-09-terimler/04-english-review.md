# Terminology Debate — 04: English Review

- **Prepared by:** English-language reviewer agent
- **Date:** 2026-11-09
- **Status:** Review and proposal. Not a decision. The referee decides; the founder approves.

## 0. Scope and method

I judged only the English names in `02-oneriler.md` (registry, section 2) against the definitions given there. I did not judge the Turkish names or the Turkish family choice (Kâtip). Where the proposed English name has a problem, I give up to three alternatives and one preferred name, chosen the way an English speaker would name the thing, not by translating the Turkish (K27).

**What I checked for each name**
1. Is it natural, clear and trustworthy to an ordinary reader in the UK, the US and among international English users?
2. Unwanted connotations (K26: no fear, no surveillance, no domination; also no overclaiming and no underclaiming).
3. Collisions with existing institutions, products or technical terms.
4. Fit as a family of names.

**Verification status.** I ran short web searches. A search result title or snippet confirming that something exists is marked **[verified: exists]**. Everything resting on my own knowledge of English usage is marked **[usage judgement]** or **[not verified]**. I did not open statutes, and I did not run trademark or domain searches. Finding nothing proves nothing.

## 1. Verdict in brief

- **"Aide" should not be the umbrella name.** It sounds like a political staffer (a problem for a system with party models), it sounds exactly like "aid" ("Public Aide" reads as "public aid", which in the US means welfare), and it is rare in everyday UK speech outside politics. I prefer **Assistant** as the umbrella and the function-based role names built on it (section 3).
- **Eight names are fine as proposed:** Independent Reviewer, Case Coordinator, Binding Pledge, Seal, Guardrails, Citizens' Panel, Integrity Commission, Appointments Charter (some with small notes).
- **Weak names to replace:** Public Aide, Public Ledger, Common Protocol, No-Rollback Rule, Plan B, Model Card, Public Model Commons, Slate Officer, Model Oversight Board, Proactive Entitlement, Oversight Tier, Universal Charter, National Adaptation, Redress Account, Access Log (for public use), Sealed Release.
- **Two risks apply across the whole project**, not to single names:
  1. "Agent" is a poor public word in English (spy, "federal agents", and, for "legislative agent", lobbyist). It is fine as a technical term.
  2. Several phrases in the proposed set read as if the AI is the one governing or can never be undone ("Governing Model", "No Going Back", "No-Rollback"). That works against the sovereignty principle. I flag each one.

## 2. House rules I used (so the names form a family)

| Rule | Pattern |
|---|---|
| AI roles that do the work | **[Function] Assistant** (Drafting, Service, Justice, Rules, Processing) |
| AI role that checks independently | A different root: **Reviewer**. A different word makes the separation of duties visible in the name. |
| The one AI role that stitches a case together | **Coordinator** |
| Human institutions | Panel, Board, Commission, Charter. Plain civic nouns. |
| Sentence-style names (K27) | Where English naturally says it as a question or phrase, use that ("Who Looked?", "No application needed"). |
| "Public" vs "Citizens'" | **Public** = open to all or run by the state. **Citizens'** = acts on behalf of ordinary people, independent of the state. |
| Two layers (K26 point 6) | Public name for ordinary text, technical name for legal text. I give both. |

Style notes for the editor: choose one spelling variety for the master text. The working list already uses UK spelling ("Neighbourhood"), so I use that. Fix one apostrophe convention: plural possessive for bodies made of citizens (Citizens' Panel); no apostrophe when "Citizen" is an adjective for a rights bundle (Citizen Guarantees); keep the established form "Citizen's Dividend" because that is the searchable term.

## 3. The role family: Aide, Assistant, Clerk

The proposer's Turkish family (Kâtip) rests on a good idea: someone writes and records, a human signs. I looked for the English word with the same job.

| Candidate | For | Against |
|---|---|---|
| **Aide** (proposed) | Short; implies a boss | Political staffer ("White House aide", "Senate aide") **[usage judgement]**. With party models in the design, "aide" sounds partisan. Homophone of "aid": "Public Aide" ~ "public aid"; "Judicial Aide" ~ "judicial aid"; "legal aide" ~ "legal aid". "Public aid" is a welfare term in the US: the Illinois Department of Public Aid existed **[verified: exists]**. Uncommon in everyday UK speech outside politics and "aide-memoire" **[usage judgement]**. |
| **Assistant** (my preference) | The word everyone already uses for AI helpers; plain, warm, clearly subordinate; understood worldwide. Placed after the function ("Drafting Assistant") it reads as a limited job, not a rank. | Before a title it is a rank ("Assistant Secretary", "Assistant Attorney General") **[usage judgement]**, so never write "Assistant Judge" style forms. Generic, so the name carries little character. Understates Level 1 autonomy (see section 9). |
| **Clerk** (closest to Kâtip) | Records, drafts, does not decide: "the clerk prepares, the official signs". Respected in "Clerk of the Court", "Town Clerk". | Lowly in everyday American English (file clerk, shop clerk). In some Commonwealth countries "clerk" is a low government grade **[not verified; my general knowledge]**. Collides with real court clerks and Parliamentary clerks, which suggests humans being replaced. Sounds dated in a modern citizen app. |
| **Agent** | Standard technical term for AI today | Spy, "federal agents", real-estate agent. **"Legislative agent" means a registered lobbyist in US state law** **[verified: exists; search results show the term in Massachusetts, Illinois, Ohio and Michigan lobbying and ethics materials. I did not open the statutes]**. |
| Officer, Deputy, Steward | | Officer = police or human official. Deputy = rank. Steward = flight attendant, shop steward, vague. |

**Preferred:** **Assistant** as the public umbrella, with **AI agent** kept as the technical umbrella only. Second choice: **Clerk**, if the referee wants the stronger "human signs" flavour and accepts the lowly-status risk.

**Technical-layer warning.** Do not use "legislative agent" for the drafting role in legal text, because in the US it means lobbyist. Use "legislative drafting AI agent" or "AI drafting system". The working list's "legislative / executive / judicial agent" should change.

## 4. Concept-by-concept review

Verdict key: **Keep** = good as proposed. **Adjust** = right idea, small change. **Replace** = weak; use my preferred name.

### 4.1 AI roles

| ID | Proposed | Verdict | Problem | Preferred (public) | Alternatives | Technical name |
|---|---|---|---|---|---|---|
| K-AJAN | Aide | Replace | See section 3 | **Assistant** | Clerk; Aide (fallback only) | AI agent |
| K-YASAMA-AJANI | Drafting Aide | Replace | "Aide"; also "Legislative Assistant" is a human congressional staff job in the US, so I avoid that wording **[usage judgement]** | **Drafting Assistant** | Bill Drafter; Lawmaking Assistant | legislative drafting AI agent |
| K-YURUTME-AJANI | Service Aide | Replace | "Aide" | **Service Assistant** | Public Service Assistant | executive AI agent |
| K-YARGI-AJANI | Judicial Aide | Replace | "Aide"/"aid"; "judicial assistant" is also a human court-staff title in the US **[usage judgement]**; "Judicial" is heavy for ordinary readers | **Justice Assistant** | Disputes Assistant; Judicial Assistant (technical text only) | judicial AI agent |
| K-NORM-AJANI | Rules Aide | Replace | "Aide". "Norm" must not leak into English: to English ears it means social norms | **Rules Assistant** | Rulebook Assistant | rule-level AI agent (not "norm agent") |
| K-UYGULAMA-AJANI | Casework Aide | Adjust | "Aide"; shares "Case" with Case Coordinator, which blurs two different roles | **Processing Assistant** ("processing your application" is everyday gov-speak) | Casework Assistant | rule-application AI agent |
| K-UYGUNLUK-AJANI | Independent Reviewer | Keep | UK has a statutory "Independent Reviewer of Terrorism Legislation" **[verified: exists]**, but the full title differs, so the risk is small. "Reviewer" suggests after-the-fact review, while this role checks each action; acceptable. | **Independent Reviewer** | Independent Checker; Compliance Reviewer | compliance AI agent |
| K-KIRMIZI-TAKIM | Red Team | Replace for public text | "Red team" is established in security and AI safety **[usage judgement]** but sounds hostile to a lay reader, and "red" carries Cold War baggage in the US | **Stress-Test Team** (bank stress tests taught the public that this means "check it can survive") | Challenge Team; Independent Testers | red team |
| K-DOSYA-KOORDINATORU | Case Coordinator | Keep | "Case coordinator" is also a human job in social care and courts **[usage judgement]**. That helps understanding more than it hurts. | **Case Coordinator** | Case Lead | case coordination AI agent |
| K-HALK-AJANI | Public Aide | Replace | "Public aid" = welfare in the US **[verified: the Illinois Department of Public Aid existed]**. "Public" also suggests it belongs to the state, but this role must be on the citizens' side, independent of any party or government. | **Citizens' Assistant** | Open Records Assistant; Public Records Assistant | citizen-access AI agent |

**Notes**
- On "Citizens' Assistant": I did not search for an existing product or organisation with this name **[not verified]**. The UK charity Citizens Advice is a close sound-alike; I rejected "Citizens' Advisor" for that reason **[usage judgement]**.
- "Stress-Test Team" refers to an AI role. Say "Stress-Test AI" if a reader might think it is human staff.

### 4.2 Structures

| ID | Proposed | Verdict | Problem | Preferred (public) | Alternatives | Technical name |
|---|---|---|---|---|---|---|
| K-DEVLET-AGI | Government Network | Keep, with caveat | "Government Network" is already the name of real IT services, e.g. in Qatar **[verified: exists]**, and "GovNet" is used for government networks in Jamaica **[verified: exists]**. Readers will take it for IT plumbing. That is partly true, so it does little harm. Define it on first use. | **Government Network** | Connected Government; Shared Government System | AI agent network |
| K-ORTAK-PROTOKOL | Common Protocol | Replace for public text | To lay readers "protocol" is etiquette or a hospital procedure; to technologists it is a network spec. In conspiracy circles "protocols" can be spun as a secret rulebook ("the Protocols" is a notorious forgery, **[usage judgement]**), so avoid it where public trust is the point. | **Common Standard** (public: "the standard all of the state's assistants follow") | Shared Rules; Open Standard | common agent protocol (this *is* the natural technical English, cf. current AI agent protocols **[not verified]**) |
| K-KAMU-DEFTERI | Public Ledger | Replace | "Public ledger" is literally a cryptocurrency term, which brings scam baggage; there was also a Philadelphia newspaper of that name **[verified: exists]**. "Ledger" means bookkeeping to most people. It also suggests everything is public, which would be a privacy problem if personal data are on it. | **Public Record** ("it is on the public record" is trusted, familiar English) | Shared Record; Common Record | tamper-evident ledger |
| K-KAMU-TEMELI | Public Model Commons | Replace | "Commons" means the UK/Canadian House of Commons, or "digital commons" jargon. It sounds like a chamber. | **Public Model Library** (many sources, anyone may borrow, libraries are trusted) | Public AI Utility; Shared Model Pool | common public model infrastructure |

**Notes**
- On Public Record: if the registry's meaning is that the Ledger holds only decision records and proofs, "Public Record" is accurate. If it holds personal data, "Public" misleads; use "Shared Record". The proposer should confirm which.
- "Sealed Record" is not a safe alternative: in US courts a sealed record is a hidden one, the opposite of the intent. **[usage judgement]**
- "Public AI Utility" has good trust connotations (water, power) but implies one supplier; the concept has several independent sources.

### 4.3 Pledge and seal

| ID | Proposed | Verdict | Problem | Preferred (public) | Alternatives | Technical name |
|---|---|---|---|---|---|---|
| K-SOZ-BELGESI | Binding Pledge | Keep | Strong and natural. In US politics a "pledge" can mean a specific signed tax pledge, but the sense is plain enough. | **Binding Pledge** | Written Pledge; The Pledge (short form) | binding pledge |
| K-MUHUR | Seal | Keep | "Seal" can read as a stamp of approval rather than a lock; say "sealed before the vote" to fix the sense. | **Seal** (verb: to seal) | Lock-in; Lodging | seal |
| K-MUHURLU-ZARF | Sealed Release | Replace | "Release" reads as a software release or a release from custody. | **Sealed Version** | Sealed Package; Sealed Build (technical) | sealed release package |
| K-SOZ-KAPISI | Guardrails | Keep | Already the mainstream English word for AI safety limits and for policy limits generally **[usage judgement]**. Slightly soft: guardrails suggest guidance, while this layer enforces. State plainly that they are hard limits. | **Guardrails** | Red-Line Check; Pledge Check | rule layer / pledge enforcement layer |
| K-GERI-ADIM-YOK | No-Rollback Rule | Replace | "Rollback" is a software term, and in AI context "no rollback" sounds like "this system can never be undone", the opposite of the intent. "Rollback" in politics (rollback of rights) is also a negative word, which makes the rule's name sound like the thing it forbids. | **One-Way Rule** ("protections only move one way: in your favour") | No Backsliding Rule; Never Worse Off (only if its scope is stated exactly) | non-regression rule ("ratchet" only inside the team) |
| K-B-PLANI | Plan B | Replace | Natural idiom, but "Plan B" is also a famous US emergency contraception brand **[verified: exists]**, which will dominate search results and jokes. | **Fallback Plan** | Backup Plan | contingency plan |
| K-KAPSAM-RAPORU | Model Card | Replace for public text | "Model card" is an AI-industry term from a 2018 paper by Google researchers and others **[verified: exists]**. It is a lab's own documentation, not a state-sealed scope statement, so using it invites confusion with voluntary lab practice. To a lay reader it also sounds like a plastic card or a fashion model's comp card. | **Scope Report** | Fact Sheet; Tested-For Statement | model card (keep as technical synonym) |

**Notes**
- On "Never Worse Off": it is the warmest wording, but it is a strong promise. UK politicians have repeatedly promised "no one will be worse off" **[usage judgement]**. Only use it if the rule really means that. As defined in the registry it covers changes made after the election to agent powers and to citizens' legal position, which is narrower.
- "Sealed Version": the Turkish idea of an envelope opened in public does not carry over. In English a "sealed envelope" suggests secrecy, which is wrong here.

### 4.4 People and institutions

| ID | Proposed | Verdict | Problem | Preferred (public) | Alternatives | Technical name |
|---|---|---|---|---|---|---|
| K-MECLIS | Assembly | Adjust | Generic and neutral, but "citizens' assembly" is an established English term for a randomly chosen deliberative body, e.g. the UCL Constitution Unit's Citizens' Assembly on Democracy in the UK **[verified: exists]**. That blurs the line with the Citizens' Panel. Each English-speaking country will say Parliament, Congress or Legislature anyway. | **Assembly** in the model text; Legislature as the neutral technical word | Legislature | legislature |
| K-YURTTAS-PANELI | Citizens' Panel | Keep | "Citizens' panel" is used in the UK for survey panels run by councils **[not verified]**, so it can sound passive. "Citizens' Jury" is the strongest English word for people chosen by lot, but "jury" implies a verdict. Choose by function. | **Citizens' Panel** if it only advises; **Citizens' Jury** if its approval is binding | Citizens' Jury | citizens' panel |
| K-ATAMA-ANAYASASI | Appointments Charter | Keep | "Appointments" suggests someone appoints (patronage) while the design uses lot and qualification pools. | **Appointments Charter** | Selection Charter | appointments charter |
| K-SECENEK-SORUMLUSU | Slate Officer | Replace | "Slate" means a list of candidates in US politics, but is opaque in the UK and elsewhere **[usage judgement]**. | **Shortlist Officer** | Options Officer (risk: "stock options"); Choices Officer | option-set officer |
| K-LIYAKAT-KURULU | Merit Board | Keep, with caveat | "Merit board" sounds like US federal personnel bodies (the Merit Systems Protection Board) **[verified: exists]**. In the US, "merit" is also politically contested in recent debates **[usage judgement]**. Neutral in the UK. | **Merit Board** | Selection Standards Board | merit board |
| K-DURUSTLUK-KURUMU | Integrity Commission | Keep | Real bodies exist under this name, e.g. Jamaica's Integrity Commission **[verified: exists]**. That fits the registry's own rule (use the existing body if there is one). | **Integrity Commission** | Anti-Corruption Commission | integrity commission |
| K-SOZ-DENETIM-KURULU | Model Oversight Board | Replace | Meta's well-known "Oversight Board" **[verified: exists]**. "Oversight" is also used for the tier system (Oversight Tier), so one word does two jobs. | **Pledge Audit Board** | Pledge Review Board (but "Review" clashes with Independent Reviewer) | model audit board |

### 4.5 Citizen guarantees

| ID | Proposed | Verdict | Problem | Preferred (public) | Alternatives | Technical name |
|---|---|---|---|---|---|---|
| K-YURTTAS-GUVENCESI | Citizen Safeguards | Adjust | In the UK, "safeguarding" is a loaded social-care term (protecting children and vulnerable adults) **[usage judgement]**; "safeguards" is close to it. | **Citizen Guarantees** (a bundle of guarantees; "guarantee" is trusted consumer language) | Citizen Safeguards; Citizen Protections | citizen guarantee provisions |
| K-HATA-HESABI | Redress Account | Adjust | "Redress" is formal and rare in US speech. It also suggests a payment to citizens, whereas this is a budget line charged to the institution. | **Mistakes Account** ("if the system gets it wrong, the cost is charged to the agency's Mistakes Account") | Redress Account (formal text); Error Budget (the nearest technical term from reliability engineering, but it lacks the compensation meaning) | error cost account |
| K-DEVLET-SENI-ARAR | Proactive Entitlement | Replace | Jargon. "Entitlement" is a loaded word in US politics (Social Security and Medicare, and "entitlement mentality") **[usage judgement]**. "The State Finds You" (working list) sounds like a police line in English. | **No application needed** (as a label: "No Application Needed") | Automatic Entitlements (UK/international only); Benefits That Find You | proactive entitlement recognition |
| K-YURTTAS-PAYI | Citizen's Dividend | Keep | Established term in basic-income discussion **[verified: exists]**; the Alaska Permanent Fund Dividend is the best-known example. UK readers know "citizen's income" better. Founder decision on the name is still pending per the registry. | **Citizen's Dividend** | Citizens' Share | citizen's dividend |
| K-GECIS-GUVENCESI | Bridge Support | Keep | "Support" is a UK benefit word (Income Support) **[usage judgement]**, but "bridge" is a clear metaphor ("bridging loan"). | **Bridge Support** | Transition Pay; Bridge Income | transition support |
| K-MAHALLE-KATKISI | Neighbourhood Jobs | Adjust | "Jobs" overclaims. The scheme is a few paid hours a month. Avoid "community service" (a court punishment in English), "payback" (UK offender scheme) and "workfare". | **Neighbourhood Jobs**, always with its scale stated ("small paid local projects, up to 24 hours a month") | Neighbourhood Work; Neighbourhood Projects | neighbourhood public-benefit work (pilot) |
| K-BAKIS-GORUNUMU | Access Log | Replace for public text | Accurate but IT jargon. English speakers would ask the question. "Who viewed your profile" is a familiar social-media phrase, so the idea is easy to grasp. | **Who Looked?** (full form: "Who looked at my file?") | See Who Looked | access log view |
| K-SIRA-DEFTERI | Waiting List | Keep | Very natural. In the UK it carries NHS-delay associations **[usage judgement]**, which is the true situation. Note it hides the "public sealed rule" feature; the person-facing card "Where am I in the queue?" does the job. | **Waiting List** | Queue Position (card name) | sealed queue register |

### 4.6 Levels, top rule, national version

| ID | Proposed | Verdict | Problem | Preferred (public) | Alternatives | Technical name |
|---|---|---|---|---|---|---|
| K-BASAMAK | Oversight Tier | Replace | "Tier" means service plans (Free/Pro), support tiers, and, in England in 2020, the COVID restriction tiers where "Tier 3" meant the strictest rules **[verified: exists]**. That is a poor association for a human-oversight scale. | **Oversight Level**, with plain labels: **Level 1, Automatic**; **Level 2, Human-Approved**; **Level 3, Human-First** | Sign-Off Level | oversight level |
| K-UST-NORM | Universal Charter | Replace | Vague ("a universal what?") and too close to the Universal Declaration of Human Rights. "Norm" must not be used: it sounds academic. | **Human Rights Charter** | Rights Charter; Universal Rights Charter | supreme rule / supreme charter |
| K-ULKE-UYARLAMASI | National Adaptation | Replace | "National Adaptation Plan" is the standard climate-policy term, so search and speech both pull toward climate. | **National Version** | National Edition; domestication (legal term, not for public use) | domestic incorporation |

**Note on the three level labels.** "Automatic / Human-Approved / Human-First" are my wording for the registry's three levels (favourable low-impact decisions may stay with the AI; discretionary and adverse decisions need human approval; for constitutional-floor decisions the human forms their own view first). The proposer should confirm they match the intended meaning.

## 5. Names for party model, governing model, shadow model

The proposer could not find halk-level names. In English, "model" is now widely understood as "AI model", so it is workable. The trouble lies in the qualifiers.

| ID | Proposed | Problem | Preferred (public) | Alternatives | Technical |
|---|---|---|---|---|---|
| K-PARTI-MODELI | Party Model | Fine and clear in context. | **Party Model** (first use: "a party's own AI model, which you can try before you vote") | Programme Model; Platform Model (US only) | party model |
| K-IKTIDAR-MODELI | Governing Model | In English, "governing" can read as "the model that governs", which contradicts "sovereignty stays with people". "Government Model" is worse: it reads as a type of government. | **Mandate Model** ("the model carrying out the voters' mandate to the winning party") | Government Model (avoid); Governing Model, only inside the technical layer and always as "the governing party's model" | governing model |
| K-GOLGE-MODEL | Shadow Model | "Shadow Cabinet" is a natural Westminster term, but in the US "shadow government" suggests a hidden cabal, and "shadow AI" means unauthorised tools **[usage judgement]**. | **Opposition Model** | Alternative Model; Shadow Model (UK and Commonwealth text only) | shadow model |

**Lifecycle reading.** Before the election every party has a **Party Model**. The winner's becomes the **Mandate Model**; the others become **Opposition Models**. This is a natural sentence structure in English, and it keeps the idea that voters, not the AI, grant authority.

**Cautions.**
- "Mandate" in US usage can also mean a legal requirement (vaccine mandate). In "electoral mandate" it is well understood. I judge the risk acceptable, but it is a judgement call.
- Do not use "Manifesto Model". "Manifesto" is already the first roadmap step in this project (K18), and in US news it often means an extremist's writing **[usage judgement]**.

## 6. Family consistency check

- **Assistants** (Drafting, Service, Justice, Rules, Processing, Citizens') form a clear family. Their checker is a **Reviewer**, a separate word, so independence shows in the name.
- **Coordinator**, **Team** (Stress-Test) and **Reviewer** are the three non-"Assistant" roles. Each has a reason.
- **Human bodies** use plain civic nouns: Panel, Board, Commission, Charter, Officer. Good.
- **Clashes inside the set that I fixed:** "Oversight" used for both tiers and the board; "Case" repeated in two roles; "Review" in both the AI checker and a possible board name; "Public" used for both state-owned things and the citizen-side assistant.
- **Remaining tension:** "Citizens' Assistant" and "Citizens' Panel" share a prefix. It is acceptable because the second words differ, but readers will meet them in the same text. A style guide entry is enough.

## 7. Sample paragraph

> Amira wanted to open a small bakery, so she applied for a food permit on her phone. A Case Coordinator found every rule that applied and asked a Rules Assistant for each one; all of them confirmed her plans met the rules. An Independent Reviewer then checked the result on its own, without seeing how the assistants had reasoned. Because the decision was in her favour and low-risk, it stayed at Level 1, Automatic, and the permit arrived that afternoon. Had the answer been no, a named official would have had to approve it first, and any mistake would have been charged to the agency's Mistakes Account. Amira could also open Who Looked? to see which offices had opened her file, and every step was recorded in the Public Record, where it cannot be quietly changed.

**How it sounds.** The names read as ordinary working English. No name needs explaining on first contact, and none sounds like surveillance or rank. The weak spot is the same one the proposer found: "assistants" at Level 1 are making real decisions, and the word "assistant" undersells that. See section 9.

## 8. How other languages should choose names

Building on the proposer's 13-point guide (`02-oneriler.md`, section 4):

1. **The English names are one language's answer, not a template.** Do not translate "Assistant" or "Public Record" word for word. Start from the concept ID and definition (point 1 of the guide).
2. **Separate the three jobs a name does**: say who acts, say who checks, say who decides. English uses Assistant / Reviewer / human official. A language may use one root for acting and a different one for checking, but should keep the three roles visibly apart.
3. **Test the name in a question or a short sentence** ("Who looked?", "No application needed"). Many languages name things better as phrases than as nouns. English did here, and K27 invites it.
4. **Check false friends and sound-alikes in the local language**, not only meanings. English "aide" ~ "aid" is a case where a name is lost to a homophone. Check also for words that are the country's actual welfare, police or tax terms.
5. **Check technical imports.** English words like "tier", "rollback", "ledger" and "protocol" already carry a strong other meaning. Imported English technical terms may be worse in other languages, where they are simply foreign.
6. **Avoid names that make the AI the ruler.** English "governing model" was the example. Prefer wording that puts the mandate, the pledge or the decision with the people.
7. **Do not overclaim in the name**, and write the real scope next to it (for example "Never Worse Off" promises more than the rule delivers; "Jobs" suggests more than a few paid hours).
8. **Keep a technical name beside the public name.** The technical layer may be an imported international term (agent, protocol, ledger); the public layer should not be.
9. **Record the check you ran** (who you asked, which collisions you searched) in the registry entry, so the next reviewer does not repeat it. Mark anything you could not verify.
10. **Allow regional variants.** English has UK, US and international forms; larger languages may need the same. The concept ID stays the same across all of them (point 12 of the guide).

## 9. Limits of this review and open points for the referee

**Not verified**
- Whether "Citizens' Assistant", "Pledge Audit Board", "Stress-Test Team", "Mandate Model", "Opposition Model" or "Public Model Library" are used as product, organisation or trademark names. I ran no trademark or domain search.
- Whether UK councils use "citizens' panel" for survey panels (my recollection, not confirmed).
- The low-status reading of "clerk" in some Commonwealth countries, and the US-political loading of "merit" and "entitlement". These rest on general knowledge of usage.
- How "Common Protocol" and the current AI-agent protocol names are used in practice.
- I confirmed that "legislative agent" appears in US state lobbying and ethics materials, but I did not open the laws to check exact definitions.

**Open points for the referee**
1. **Assistant or Clerk** as the umbrella. Does the referee accept that "Assistant" understates Level 1 autonomy, given that the registry already requires a published authority limit for each role?
2. **Mandate Model** against keeping "Governing Model": a judgement about connotation, not a fact.
3. **Citizens' Panel or Citizens' Jury**: depends on whether the body's approval is binding.
4. **Public Record or Shared Record**: depends on whether personal data sit on it.
5. **One-Way Rule or Never Worse Off**: depends on how wide the rule actually is.
6. **Working-list items outside the registry** (Candidate Information File, Disaster Playbook, caretaker government, Rent Decisions, Three-Source Rule, last safe state, "stop, hand over, renew") were not part of this review. "Caretaker government" in English already names an interim government before elections, so it should be checked before the project uses it for "bekçi yönetim".
