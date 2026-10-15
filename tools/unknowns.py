"""Rewrite the docs/NOTES.md "Unknown (S5)" list from the coverage report (S5).

    uv run tools/coverage.py && uv run tools/unknowns.py

Every remaining unlabelled, never-read raw span gets one line: address range, size, the
functions around it, its first bytes, and what was checked (no runtime read or DMA in the
corpus, no jump-table entry or numeric code operand pointing into it, whether it is a fill).
The hand-written text above the generated block is kept.
"""
from __future__ import annotations

import bisect
import json
import re

import build
import m68k

ROOT = build.ROOT
BEGIN = "<!-- unknowns.py: generated below, do not edit by hand -->"


def main() -> int:
    rep = json.loads((ROOT / "build" / "coverage_report.json").read_text())
    rom = build.ROM.read_bytes()
    syms = {}
    for line in (ROOT / "build" / "symbols.txt").read_text().splitlines():
        nm, _, v = line.partition("=$")
        if v:
            syms.setdefault(int(v, 16), nm)
    fst = sorted(int(p.stem, 16) for p in (ROOT / "src" / "f").glob("*.asm"))
    lines = []
    for sp in rep["unlabelled_unread_spans"]:
        s, e = int(sp["start"], 16), int(sp["end"], 16)
        i = bisect.bisect_right(fst, s) - 1
        before = syms.get(fst[i], f"sub_{fst[i]:06X}") if i >= 0 else "-"
        after = syms.get(fst[i + 1], f"sub_{fst[i + 1]:06X}") if i + 1 < len(fst) else "-"
        blob = rom[s:e]
        fill = " all $00" if set(blob) <= {0} else " all $FF" if set(blob) <= {0xFF} else ""
        if not fill and s % 2 == 0 and e - s >= 4:
            ins = m68k.decode(rom, s)
            if ins is not None and ins.mnemonic not in ("ori.b", "ori.w") and \
                    any(m68k.base_mnemonic(m68k.decode(rom, x) or ins) in ("rts", "bra", "jmp")
                        for x in range(s, e - 1, 2) if m68k.decode(rom, x)):
                fill = f"; decodes as code (`{ins.mnemonic} {ins.op_str}` ...) but nothing references it: dead code?"
        lines.append(f"- `${s:06X}-${e:06X}` ({e - s} B) after {before}, before {after}: "
                     f"`{blob[:8].hex(' ')}`{fill}")
    p = ROOT / "docs" / "NOTES.md"
    t = p.read_text(encoding="utf-8")
    m = re.search(r"^## Unknown \(S5\)\n", t, re.M)
    if not m:
        raise SystemExit("NOTES.md has no '## Unknown (S5)' section")
    nxt = re.search(r"^## ", t[m.end():], re.M)
    end = m.end() + nxt.start() if nxt else len(t)
    head = t[m.end():end].split(BEGIN)[0].rstrip("\n")
    intro = ("\nNone of these was read or DMA'd anywhere in the 75-run corpus, and no jump-table entry "
             "or numeric code operand points into them (checked by tools/dataitems.py / autolabel.py). "
             "Most are a few bytes between functions: alignment padding or the tails of tables whose "
             "start is labelled. Regenerate with `uv run tools/unknowns.py`.\n")
    block = f"{head}\n\n{BEGIN}\n{intro}\n" + "\n".join(lines) + "\n\n"
    p.write_text(t[:m.end()] + block + t[end:], encoding="utf-8", newline="\n")
    print(f"{len(lines)} unknown span(s) listed, {sum(int(x['end'], 16) - int(x['start'], 16) for x in rep['unlabelled_unread_spans'])} bytes")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
