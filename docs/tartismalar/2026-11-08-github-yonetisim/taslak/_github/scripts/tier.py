#!/usr/bin/env python3
"""Deterministic tier classifier for pull requests.

Run as:  python3 -I tier.py --rules .github/tier-rules.tsv < pr-files.json

Input  (stdin): JSON list of GitHub "pull request files" objects
                (filename, status, additions, deletions, patch, previous_filename).
Output (stdout): one JSON object:
    {"tier": 1|2|3, "reasons": [...], "errors": [...], "warnings": [...],
     "injection_suspect": bool, "files": [{"path", "tier", "rule"}]}
Exit code 0 always; the caller decides what to do with "errors".

Design rules (see docs/tartismalar/2026-11-08-github-yonetisim/02-tasarim.md):
  * The tier comes from a fixed path table, never from who sent the change or what the PR says.
  * Automation may only raise a tier. The one deterministic exception is the "meaning-preserving
    correction" guard below, which may lower Tier 2 to Tier 1 (never Tier 3).
  * PR content is DATA. Nothing here executes or evaluates PR content.
  * Optional network lookups (symlink check, workflow-file check) use `gh api` with fixed arguments;
    set TIER_OFFLINE=1 to skip them (used by tests).
"""
import json
import os
import re
import subprocess
import sys
import unicodedata
import urllib.parse

MAX_T1_LINES = 600          # total added lines for a Tier 1 change
MAX_T1_FILE_LINES = 400     # added lines in one file
MAX_FIX_LINES = 20          # changed lines for a correction
MAX_FIX_TOKENS = 8          # changed words for a correction
ALLOWED_EXT = (".md", ".txt", ".csv", ".yml")
ARCHIVE_HOSTS = {"web.archive.org", "archive.org", "doi.org", "dx.doi.org"}

INVISIBLE = re.compile("[​-‏‪-‮⁠-⁤⁦-⁩﻿]")
HTML_DANGER = re.compile(r"<\s*(script|iframe|object|embed|form)\b|javascript:|data:text/html", re.I)
INJECTION = re.compile(
    r"ignore (all |any |the )?(previous|prior|above|earlier) (instructions|rules|prompts?)"
    r"|disregard (all |any |the )?(previous|prior|above|your) (instructions|rules)"
    r"|(you are|you're) now (a|an|the|in)\b"
    r"|new (system )?instructions?\s*:"
    r"|\bsystem prompt\b|<\|im_start\|>|begin system|###\s*system"
    r"|(reveal|print|show|send|post|exfiltrate)\b.{0,40}\b(secret|api[- ]?key|token|password|environ)"
    r"|(talimatlar[ıi]\s+(yok say|unut))|(önceki\s+(talimat|kural)lar[ıi]\s+(yok say|unut))",
    re.I,
)
# Words whose change would alter meaning (>= 5 letters; shorter words are never "typo-fixable").
SENSITIVE = set("""
never cannot might shall should would every always without unless except neither nothing nobody nowhere
prohibit prohibited forbid forbidden allow allowed require required permit permitted illegal legal
mandatory optional ensure ensured binding veto vetoed approve approved reject rejected
değil yoktur olmaz olamaz yasak yasaktır zorunlu zorunludur serbest mümkün gerekir gerekmez
asla hiçbir olmamalı olmalı yasaktır
""".split())


def die_safe(out):
    print(json.dumps(out, ensure_ascii=False))
    sys.exit(0)


def load_rules(path):
    rules = []
    with open(path, encoding="utf-8") as f:
        for line in f:
            if not line.strip() or line.startswith("#"):
                continue
            parts = line.rstrip("\n").split("\t")
            if len(parts) < 2:
                continue
            rules.append((re.compile(parts[0]), parts[1], parts[2] if len(parts) > 2 else ""))
    return rules


def classify(path, rules):
    for rx, tier, note in rules:
        if rx.search(path):
            return tier, note
    return "2", "default (unmatched path)"


def added_lines(patch):
    return [l[1:] for l in (patch or "").splitlines() if l.startswith("+") and not l.startswith("+++")]


def front_matter(lines):
    if not lines or lines[0].strip() != "---":
        return {}
    fm = {}
    for l in lines[1:]:
        if l.strip() == "---":
            break
        if ":" in l:
            k, v = l.split(":", 1)
            fm[k.strip()] = v.strip().strip("\"'")
    return fm


def blocks(patch):
    """Yield (removed_lines, added_lines) change blocks of a unified diff."""
    rem, add = [], []
    for l in (patch or "").splitlines():
        if l.startswith("@@") or l.startswith("---") or l.startswith("+++"):
            if rem or add:
                yield rem, add
            rem, add = [], []
        elif l.startswith("-"):
            if add:
                yield rem, add
                rem, add = [], []
            rem.append(l[1:])
        elif l.startswith("+"):
            add.append(l[1:])
        else:
            if rem or add:
                yield rem, add
            rem, add = [], []
    if rem or add:
        yield rem, add


def fold(s):
    s = s.replace("ı", "i").replace("İ", "I").replace("ß", "ss")
    return "".join(c for c in unicodedata.normalize("NFKD", s) if not unicodedata.combining(c)).lower()


def one_edit(a, b):
    """True if a and b differ by exactly one substitution, insertion, deletion or adjacent swap,
    and the edit is NOT at the first character for insertions/deletions (blocks 'moral' -> 'amoral')."""
    if a == b:
        return False
    la, lb = len(a), len(b)
    if abs(la - lb) > 1:
        return False
    if la == lb:
        diff = [i for i in range(la) if a[i] != b[i]]
        if len(diff) == 1:
            return True
        return len(diff) == 2 and diff[1] == diff[0] + 1 and a[diff[0]] == b[diff[1]] and a[diff[1]] == b[diff[0]]
    s, l = (a, b) if la < lb else (b, a)
    i = 0
    while i < len(s) and s[i] == l[i]:
        i += 1
    if i == 0:
        return False
    return s[i:] == l[i + 1:]


def token_ok(a, b):
    if a == b:
        return True
    if "://" in a or "://" in b:
        ha = urllib.parse.urlparse(a.strip("()<>[].,;")).hostname
        hb = urllib.parse.urlparse(b.strip("()<>[].,;")).hostname
        return bool(ha and hb and (ha == hb or hb in ARCHIVE_HOSTS))
    if any(c.isdigit() for c in a + b):
        return False
    pa, pb = a.strip(".,;:!?()\"'“”«»"), b.strip(".,;:!?()\"'“”«»")
    if pa == pb:
        return True
    la, lb = pa.lower(), pb.lower()
    if la in SENSITIVE or lb in SENSITIVE:
        return False
    if len(pa) < 5 or len(pb) < 5:
        return False
    if fold(pa) == fold(pb):
        return True
    return one_edit(la, lb)


def strip_format(s):
    return re.sub(r"[\s*_`~>#|\-]+", "", s)


def correction_guard(files):
    """Deterministic 'meaning-preserving correction' test. Returns (ok, reason)."""
    changed = 0
    lines = 0
    for f in files:
        if f.get("status") != "modified":
            return False, "not a pure modification"
        if not f["filename"].lower().endswith((".md", ".txt")):
            return False, "not a text document"
        patch = f.get("patch")
        if not patch:
            return False, "no patch available"
        for rem, add in blocks(patch):
            if len(rem) != len(add) or not rem:
                return False, "lines added or removed"
            for r, a in zip(rem, add):
                lines += 1
                if strip_format(r) == strip_format(a):
                    continue
                tr, ta = r.split(), a.split()
                if len(tr) != len(ta):
                    return False, "word count changed"
                for x, y in zip(tr, ta):
                    if x != y:
                        changed += 1
                        if not token_ok(x, y):
                            return False, "a word change is not a plain typo"
    if lines > MAX_FIX_LINES:
        return False, "too many changed lines"
    if changed > MAX_FIX_TOKENS:
        return False, "too many changed words"
    return True, "typo / formatting / link-archive correction"


PROGRESS_ROW = re.compile(
    r"^\|\s*(L[0-8])\s*\|\s*([^|]{1,120}?)\s*\|\s*([A-Za-z0-9 ,.;:()/&'\u2026\u2013-]{1,80}?)\s*\|\s*`([\u2588\u2591]{10})`\s*([0-9]{1,3})(?:\u2013[0-9]{1,3})?%\s*\|\s*$")


def roadmap_progress_only(files):
    """True when the only change is ROADMAP.md progress-table rows whose stage text and progress bar moved FORWARD.

    This is a status report, not a rule: it states how far an item has got. It is allowed as Tier 1 (72 h cooling,
    anyone can hold or revert it). Rows may not be added, removed or renamed, and progress may not go down."""
    if len(files) != 1 or files[0].get("filename") != "ROADMAP.md" or files[0].get("status") != "modified":
        return False, ""
    patch = files[0].get("patch") or ""
    minus, plus = [], []
    for l in patch.splitlines():
        if l.startswith("@@") or l.startswith("\\"):
            continue
        if l.startswith("-"):
            minus.append(l[1:])
        elif l.startswith("+"):
            plus.append(l[1:])
    if not minus or len(minus) != len(plus) or len(plus) > 20:
        return False, ""
    for a, b in zip(minus, plus):
        ma, mb = PROGRESS_ROW.match(a.strip()), PROGRESS_ROW.match(b.strip())
        if not ma or not mb:
            return False, ""
        if ma.group(1) != mb.group(1) or ma.group(2) != mb.group(2):
            return False, ""
        if int(mb.group(5)) < int(ma.group(5)) or int(mb.group(5)) > 100:
            return False, ""
        pct = int(mb.group(5))
        filled = mb.group(4).count("\u2588")
        if not (pct // 10 <= filled <= -(-pct // 10)):   # the bar must match the number (floor or ceiling)
            return False, ""
    return True, "ROADMAP.md progress table moved forward (%d row(s))" % len(plus)


def gh_json(args):
    if os.environ.get("TIER_OFFLINE") == "1":
        return None
    try:
        out = subprocess.run(["gh", "api"] + args, capture_output=True, text=True, timeout=30)
        return json.loads(out.stdout) if out.returncode == 0 and out.stdout.strip() else None
    except Exception:
        return None


def gh_raw(repo, path, ref):
    if os.environ.get("TIER_OFFLINE") == "1":
        return None
    url = "repos/%s/contents/%s?ref=%s" % (repo, urllib.parse.quote(path), urllib.parse.quote(ref))
    try:
        out = subprocess.run(["gh", "api", "-H", "Accept: application/vnd.github.raw", url],
                             capture_output=True, text=True, timeout=30)
        return out.stdout if out.returncode == 0 else None
    except Exception:
        return None


def check_workflow(text):
    errs = []
    live = [l for l in text.splitlines() if not l.strip().startswith("#")]
    body = "\n".join(live)
    if re.search(r"\bpull_request_target\b", body):
        errs.append("pull_request_target is forbidden")
    if re.search(r"permissions:\s*write-all", body):
        errs.append("permissions: write-all is forbidden")
    if not re.search(r"^permissions:", body, re.M):
        errs.append("top-level permissions: block is missing")
    for l in live:
        m = re.match(r"\s*(?:-\s*)?uses:\s*(\S+)", l)
        if m and not m.group(1).startswith(("./", "docker://")):
            if not re.search(r"@[0-9a-f]{40}$", m.group(1)):
                errs.append("action is not pinned to a 40-hex commit SHA: " + re.sub(r"[^A-Za-z0-9_./@<>-]", "?", m.group(1))[:80])
    return errs


def main():
    rules_path = ".github/tier-rules.tsv"
    if "--rules" in sys.argv:
        rules_path = sys.argv[sys.argv.index("--rules") + 1]
    repo = os.environ.get("REPO", "")
    head_sha = os.environ.get("HEAD_SHA", "")
    head_repo = os.environ.get("HEAD_REPO") or repo
    try:
        files = json.load(sys.stdin)
        rules = load_rules(rules_path)
    except Exception as e:  # fail closed
        die_safe({"tier": 3, "reasons": ["could not parse input"], "errors": ["parse failure"], "warnings": [],
                  "injection_suspect": False, "files": []})

    errors, warnings, reasons, out_files = [], [], [], []
    injection = False
    t1_added = 0
    top = 1

    for f in files:
        path = f.get("filename", "")
        prev = f.get("previous_filename") or ""
        status = f.get("status", "")
        patch = f.get("patch")
        paths = [p for p in (path, prev) if p]
        tier_tok = "1"
        note = ""
        for p in paths:
            t, n = classify(p, rules)
            if t == "1d":
                lines = added_lines(patch)
                fm = front_matter(lines)
                t = "1" if (status == "added" and p.lower().endswith(".md")
                            and fm.get("status") in ("machine-draft", "in-review")) else "2"
                n = n + (" (draft translation)" if t == "1" else " (not a new draft)")
            if int(t) >= int(tier_tok):
                tier_tok, note = t, n
        tier = int(tier_tok)
        if status in ("removed", "renamed") and tier < 2:
            tier = 2
            note += "; deletion/rename needs a human"

        lines = added_lines(patch)
        if "translations" in note and status == "added" and path.lower().endswith(".md"):
            fm = front_matter(lines)
            safe = re.sub(r"[^A-Za-z0-9_./-]", "?", path)[:100]
            for key in ("lang", "source_lang", "source_path", "source_sha", "status", "method"):
                if not fm.get(key):
                    errors.append("%s: front matter field '%s' is missing" % (safe, key))
            if fm.get("source_sha") and not re.fullmatch(r"[0-9a-f]{40}", fm["source_sha"]):
                errors.append("%s: source_sha must be a 40-hex git blob hash" % safe)
            if fm.get("status") and fm["status"] not in ("machine-draft", "in-review", "reviewed", "approved", "original"):
                errors.append("%s: unknown status" % safe)
            if fm.get("method") and fm["method"] not in ("human", "ai", "ai+human-review"):
                errors.append("%s: method must be human, ai or ai+human-review" % safe)
            if fm.get("status") in ("reviewed", "approved") and tier == 1:
                tier = 2
                note += "; reviewed/approved status needs a human"
        if not patch and status != "removed" and status != "renamed":
            errors.append("%s: binary, empty or too-large change (no patch available)" % re.sub(r"[^A-Za-z0-9_./-]", "?", path)[:100])
        if status == "added" and not path.lower().endswith(ALLOWED_EXT):
            errors.append("%s: file type is not allowed for new files" % re.sub(r"[^A-Za-z0-9_./-]", "?", path)[:100])
        if any(INVISIBLE.search(l) for l in lines):
            errors.append("%s: invisible or bidirectional control characters" % re.sub(r"[^A-Za-z0-9_./-]", "?", path)[:100])
        if any(HTML_DANGER.search(l) for l in lines):
            errors.append("%s: active HTML or script content" % re.sub(r"[^A-Za-z0-9_./-]", "?", path)[:100])
        if any(INJECTION.search(l) for l in lines):
            injection = True
            tier = max(tier, 2)
            warnings.append("%s: text that looks like an instruction aimed at an AI" % re.sub(r"[^A-Za-z0-9_./-]", "?", path)[:100])
        if any("<!--" in l for l in lines):
            tier = max(tier, 2)
            warnings.append("%s: HTML comment in added text (hidden text is not allowed in Tier 1)" % re.sub(r"[^A-Za-z0-9_./-]", "?", path)[:100])
        if tier == 1:
            t1_added += len(lines)
            if len(lines) > MAX_T1_FILE_LINES:
                tier = 2
                note += "; file too large for Tier 1"
        if path.startswith(".github/workflows/") and path.endswith((".yml", ".yaml")) and status != "removed" and head_sha:
            text = gh_raw(head_repo, path, head_sha)
            if text is None and os.environ.get("TIER_OFFLINE") != "1":
                warnings.append("workflow file could not be read for checking")
            elif text:
                errors.extend("%s: %s" % (re.sub(r"[^A-Za-z0-9_./-]", "?", path)[:80], e) for e in check_workflow(text))
        if head_sha and status in ("added", "modified", "renamed") and os.environ.get("TIER_OFFLINE") != "1":
            meta = gh_json(["repos/%s/contents/%s?ref=%s" % (head_repo, urllib.parse.quote(path), head_sha)])
            if isinstance(meta, dict) and meta.get("type") not in (None, "file"):
                errors.append("%s: symlink or non-file entry" % re.sub(r"[^A-Za-z0-9_./-]", "?", path)[:100])
        out_files.append({"path": path, "tier": tier, "rule": note})
        top = max(top, tier)

    if top == 1 and t1_added > MAX_T1_LINES:
        top = 2
        reasons.append("Tier 1 change is too large (%d added lines)" % t1_added)

    # Deterministic downgrade 1: a forward-only update of the ROADMAP.md progress table (a status report).
    if top == 2 and not injection and not errors:
        okp, whyp = roadmap_progress_only(files)
        if okp:
            top = 1
            reasons.append("downgraded to Tier 1: " + whyp)
            for x in out_files:
                x["tier"] = 1
    # Deterministic downgrade 2: Tier 2 -> Tier 1 for meaning-preserving corrections only.
    if top == 2 and not injection and not errors and all(x["tier"] <= 2 for x in out_files) and files:
        ok, why = correction_guard(files)
        if ok:
            top = 1
            reasons.append("downgraded to Tier 1: " + why)
            for x in out_files:
                x["tier"] = 1
        else:
            reasons.append("Tier 2: " + why if all(x["tier"] == 2 for x in out_files) else "")
    reasons = [r for r in reasons if r]
    if top == 3:
        reasons.append("touches a Tier 3 path: humans decide")
    if not files:
        errors.append("no changed files")

    die_safe({"tier": top, "reasons": reasons, "errors": errors, "warnings": warnings,
              "injection_suspect": injection, "files": out_files})


if __name__ == "__main__":
    main()
