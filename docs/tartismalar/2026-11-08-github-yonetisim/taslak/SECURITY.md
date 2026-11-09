# Security Policy

This project runs AI roles and automation on public input, so its biggest risks are tricks (prompt injection), leaks (secrets) and misuse of the workflows. We want to hear about them, privately first.

## How to report

Use **private vulnerability reporting**: open the **Security** tab of this repository and choose **Report a vulnerability**. We do not publish an e-mail address for reports. Please do not open a public issue or discussion for a security problem.

If the Security tab does not show that option, open a public issue titled *Security contact needed* **without any details**, and a custodian will open a private channel.

## What counts

- A way to make an AI role obey text from an issue, comment, pull request or file (prompt injection), especially one that changes a label, a decision, a merge or the budget.
- A way to read or leak a secret: the API key, the App key, a token, an environment variable.
- A workflow or script flaw: command injection through titles or bodies, a missing permission restriction, a way to run code from a pull request with secrets, a way around the tier table, the verifier, the challenge window or the ruleset.
- A way to make the automation spend money without limit, or to lock out all contributors.
- Hidden text or invisible characters that reach a decision or a merged text.

## What does not count

Disagreement with a decision is not a security issue. Use the *Challenge a decision* form.

## Please

- Test on a **fork** with your own tokens, not on the live issues.
- Do not access other people's data, and do not run denial-of-service tests.
- Give us time to fix before you publish. We aim to confirm within a few days and to fix within a few weeks, but this is a volunteer and machine-run project: these are goals, not promises.

## What we do

- Custodians (people who hold the repository keys) read private reports. Automation does not triage security reports.
- A real incident leads to: rotating keys, setting the `halt` label (which stops every automatic role and merge), a public write-up after the fix, and a design change decided by the normal process (Tier 3).
- We thank reporters in the write-up unless they prefer not to be named.

## Known limits (we state them on purpose)

- AI roles read untrusted text. We reduce the risk (read-only tokens, no shell for reading roles, sanitized input, a separate step with no AI that posts the output), but we cannot prove prompt injection impossible.
- The AI roles are from the same family of models and may share blind spots.
- An AI-written decision has no democratic legitimacy by itself. See GOVERNANCE.md, section on legitimacy.
