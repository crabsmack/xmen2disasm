"""Extend AI-script thunk tables with the `jmp d(a5)` entries that are still raw (static code).

    uv run tools/extend_thunks.py --dry-run
    uv run tools/extend_thunks.py

An AI script is a count word followed by that many `jmp d(a5)` thunks (the script runner
jumps to entry k); only entries the corpus executed got disassembled. For every raw run of
$4EED dddd words (d a jump-table slot) that directly follows a src/f file ending in such a
thunk, the run is appended to that file as `jmp $d(a5) ; -> target` lines and removed from
the incrom span. Rebuilds and rolls back unless byte-identical.
"""
from __future__ import annotations

import argparse
import re
import struct
import sys
from pathlib import Path

import build
import convert

ROOT = build.ROOT


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    a = ap.parse_args()
    rom = build.ROM.read_bytes()
    main_p = ROOT / "xmen2.asm"
    lines = main_p.read_text().splitlines(keepends=True)
    orig_main = "".join(lines)
    jt_names = {}
    for ln in (ROOT / "src" / "jumptable.asm").read_text().splitlines():
        m = re.match(r"\tjtentry\t(\S+)\t; \[(\d+)\]", ln)
        if m:
            jt_names[int(m.group(2))] = m.group(1)
    raw = convert.incrom_spans([ln.rstrip("\n") for ln in lines])
    changed: dict[Path, str] = {}
    orig: dict[Path, str] = {}
    edits = []  # (line index, new incrom line or None)
    total = 0
    for k, s, e in raw:
        prev = lines[k - 1].strip() if k else ""
        if prev.split(";")[0].strip().endswith(":"):
            continue  # labelled data
        m = re.match(r'include "src/f/([0-9A-F]{6})\.asm"', prev)
        if not m:
            continue
        f = ROOT / "src" / "f" / f"{m.group(1)}.asm"
        text = changed.get(f) or f.read_text()
        code = [ln for ln in text.splitlines() if ln.startswith("\t")]
        if not code or not re.match(r"\tjmp\t\$[0-9A-F]+\(a5\)", code[-1]):
            continue
        a_ = s
        add = []
        while a_ + 4 <= e and struct.unpack(">H", rom[a_:a_ + 2])[0] == 0x4EED:
            d = struct.unpack(">H", rom[a_ + 2:a_ + 4])[0]
            if d < 0x22 or (d - 0x22) % 8:
                break
            slot = (d - 0x22) // 8
            add.append(f"\tjmp\t${d:X}(a5)\t; -> {jt_names.get(slot, '?')}\n")
            a_ += 4
        if not add:
            continue
        orig.setdefault(f, f.read_text())
        changed[f] = text.rstrip("\n") + "\n" + "".join(add)
        edits.append((k, f"\tincrom\t${a_:06X},${e - a_:X}\n" if a_ < e else None))
        total += len(add)
        print(f"{f.stem}: +{len(add)} thunk(s) ${s:06X}-${a_:06X}")
    print(f"{total} thunk(s) in {len(changed)} file(s)")
    if a.dry_run or not edits:
        return 0
    for k, new in sorted(edits, reverse=True):
        if new is None:
            del lines[k]
        else:
            lines[k] = new
    for f, t in changed.items():
        f.write_text(t, newline="\n")
    main_p.write_text("".join(lines), newline="\n")
    sys.argv = [sys.argv[0], "--quiet"]
    if build.main() != 0:
        for f, t in orig.items():
            f.write_text(t, newline="\n")
        main_p.write_text(orig_main, newline="\n")
        print("extend_thunks: rolled back (build was not byte-identical)")
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
