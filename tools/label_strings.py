"""Label C strings in raw ROM bytes (S3/S4), via label_data.py --batch (one rebuild).

    uv run tools/label_strings.py --refs --dry-run    # strings that code/jt reference numerically
    uv run tools/label_strings.py --refs
    uv run tools/label_strings.py --read              # also strings inside runtime-read raw spans

A string = printable ASCII (plus tab/newline) ending in NUL, padded with NULs to an even
address (MPW C puts each function's literals right after its code, word aligned). Names come
from the text: Str_<FirstWords> (Str_Empty_XXXXXX for ""), made unique with the address.
The comment records the text and who references it.
"""
from __future__ import annotations

import argparse
import json
import re
import subprocess
import sys
from collections import defaultdict
from pathlib import Path

import build
import convert

ROOT = build.ROOT
PRINT = set(range(0x20, 0x7F)) | {9, 10, 13}


def string_at(rom: bytes, a: int, end: int) -> int | None:
    """Length (incl. NUL + even padding) of the C string at a, if it ends before `end`."""
    i = a
    while i < end and rom[i] in PRINT:
        i += 1
    if i >= end or rom[i] != 0:
        return None
    i += 1
    if i % 2 and i < end and rom[i] == 0:
        i += 1
    return i - a


def name_for(text: str, a: int, used: set[str]) -> str:
    if not text:
        n = f"Str_Empty_{a:06X}"
    else:
        words = re.findall(r"[A-Za-z0-9]+", text)
        base = "".join(w.capitalize() if w.isupper() or w.islower() else w for w in words[:5])[:40]
        n = f"Str_{base or 'Sym'}"
        if n in used or not re.fullmatch(r"[A-Za-z_]\w*", n):
            n = f"{n}_{a:06X}"
    used.add(n)
    return n


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--refs", action="store_true")
    ap.add_argument("--read", action="store_true")
    ap.add_argument("--dry-run", action="store_true")
    a = ap.parse_args()
    rom = build.ROM.read_bytes()
    lines = (ROOT / "xmen2.asm").read_text().splitlines()
    spans = []
    for i, s, e in convert.incrom_spans(lines):
        prev = lines[i - 1].strip() if i else ""
        if not prev.split(";")[0].strip().endswith(":"):
            spans.append((s, e))
    used = {ln.split("=")[0] for ln in (ROOT / "build" / "symbols.txt").read_text().splitlines()}
    refs: dict[int, set[str]] = defaultdict(set)
    pat = re.compile(r"\$([0-9A-F]+)\(pc|\(\$([0-9A-F]+)\)\.l")
    for f in (ROOT / "src" / "f").glob("*.asm"):
        text = f.read_text()
        fn = re.search(r"^([A-Za-z_]\w*):", text, re.M).group(1)
        for line in text.splitlines():
            for m in pat.finditer(line.split(";")[0]):
                refs[int(m.group(1) or m.group(2), 16)].add(fn)
    for line in (ROOT / "src" / "jumptable.asm").read_text().splitlines():
        m = re.match(r"\tjtentry\t\$([0-9A-F]{6})\t; \[(\d+)\]", line)
        if m:
            refs[int(m.group(1), 16)].add(f"jt[{m.group(2)}]")
    cands: list[int] = []
    if a.refs:
        cands += [t for t in refs if any(s <= t < e for s, e in spans)]
    if a.read:
        rep = json.loads((ROOT / "build" / "coverage_report.json").read_text())
        cands += [int(x["start"], 16) for x in rep["raw_data_read_spans"]]
    items, taken = [], []
    for t in sorted(set(cands)):
        sp = next(((s, e) for s, e in spans if s <= t < e), None)
        if not sp or any(x <= t < x + n for x, n in taken):
            continue
        n = string_at(rom, t, sp[1])
        if n is None:
            continue
        text = rom[t:t + n].rstrip(b"\0").decode("latin-1")
        # "" only as a whole 2-byte NUL span (a function's lone literal); else >= 3 letters-ish chars
        if not text and (sp != (t, t + 2) or not any(not u.startswith("jt[") for u in refs.get(t, ()))):
            continue  # a jt-only zero word is data (e.g. a count), not a string literal
        if text and (len(text) < 3 or sum(c.isalnum() for c in text) < max(2, len(text) // 2)):
            continue
        name = name_for(text, t, used)
        who = ", ".join(sorted(refs.get(t, ()))[:3]) or "runtime read"
        shown = text.replace("\n", "\\n")[:60]
        items.append(f"{t:06X} {n:X} {name} C string \"{shown}\" (used by {who})")
        taken.append((t, n))
    print("\n".join(items))
    print(f"{len(items)} string(s)")
    if a.dry_run or not items:
        return 0
    batch = ROOT / "build" / "strings_batch.txt"
    batch.write_text("\n".join(items) + "\n", encoding="utf-8", newline="\n")
    return subprocess.run([sys.executable, str(ROOT / "tools" / "label_data.py"), "--batch", str(batch)],
                          cwd=ROOT).returncode


if __name__ == "__main__":
    raise SystemExit(main())
