"""Write a function's documented header (definition-of-done N2) in place of the generated one.

    uv run tools/header.py Mem_Copy "copy N bytes (memcpy)" --in "8(a6)=dst $C(a6)=src $10(a6)=long n" \
        --out "none" --evidence "16-byte unrolled long copy when aligned; 13 callers"
    uv run tools/header.py --batch headers.jsonl   # one {"name","purpose","in","out","evidence"} per line

NAME is the function's current label (or a hex address / file stem). The block between the
first two `; ----` rules is replaced by
    ; Name - purpose
    ; In:  ...          (omitted if not given)
    ; Out: ...
    ; Evidence: ...
    ; Found: <the generated discovery note, shortened>
Comments only, so no rebuild here; build/commit as usual afterwards.
"""
from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
RULE = "; " + "-" * 75


def find_file(name: str) -> Path:
    f = ROOT / "src" / "f"
    if re.fullmatch(r"(0x|\$)?[0-9A-Fa-f]{1,6}", name):
        p = f / f"{int(name.lstrip('$'), 16):06X}.asm"
        if p.exists():
            return p
    for p in f.glob("*.asm"):
        with p.open() as fh:
            for line in fh:
                if re.match(r"^[A-Za-z_]\w*:", line):
                    if line.split(":")[0] == name:
                        return p
                    break
    sys.exit(f"header: no src/f function whose first label is {name!r}")


def shorten_found(note: str) -> str:
    m = re.match(r"runtime: executed in (.*)", note)
    if m:
        runs = m.group(1).split("+")
        return f"runtime: executed in {len(runs)} run(s)" + (f" ({runs[0]}...)" if len(runs) > 1 else f" ({runs[0]})")
    return note


def apply(name: str, purpose: str, inp: str | None, out: str | None, evidence: str | None) -> str:
    p = find_file(name)
    lines = p.read_text().splitlines()
    label = next(ln.split(":")[0] for ln in lines if re.match(r"^[A-Za-z_]\w*:", ln))
    rules = [i for i, ln in enumerate(lines[:40]) if ln.startswith("; ----")]
    if len(rules) < 2 or rules[0] != 0:
        return f"{p.name}: unexpected header layout, not changed"
    old = lines[1:rules[1]]
    found = ""
    for ln in old:
        m = re.match(r"^; (?:sub|loc)_[0-9A-F]{6}\t\[(.*)\]$", ln) or re.match(r"^; Found: (.*)$", ln)
        if m:
            found = shorten_found(m.group(1))
    new = [f"; {label} - {purpose.strip()}"]
    if inp:
        new.append(f"; In:  {inp.strip()}")
    if out:
        new.append(f"; Out: {out.strip()}")
    if evidence:
        new.append(f"; Evidence: {evidence.strip()}")
    if found:
        new.append(f"; Found: {found}")
    lines[1:rules[1]] = new
    p.write_text("\n".join(lines) + "\n", newline="\n")
    return f"{p.name}: {label}"


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?")
    ap.add_argument("purpose", nargs="?")
    ap.add_argument("--in", dest="inp")
    ap.add_argument("--out")
    ap.add_argument("--evidence")
    ap.add_argument("--batch")
    a = ap.parse_args()
    if a.batch:
        for line in Path(a.batch).read_text(encoding="utf-8").splitlines():
            if line.strip():
                d = json.loads(line)
                print(apply(d["name"], d["purpose"], d.get("in"), d.get("out"), d.get("evidence")))
    elif a.name and a.purpose:
        print(apply(a.name, a.purpose, a.inp, a.out, a.evidence))
    else:
        ap.error("give NAME PURPOSE [--in --out --evidence] or --batch FILE")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
