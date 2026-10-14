"""One-time initial split: build/explore.json -> xmen2.asm + src/.

    uv run tools/explore.py && uv run tools/split.py --force

Pass 1 assembles every discovered instruction at its own `org` and compares the
listing bytes to the ROM; any instruction AS cannot reproduce exactly becomes a
dc.w line carrying the capstone text as a comment. Pass 2 writes the real tree
and runs tools/build.py, which must report byte-identical.

This OVERWRITES src/ and xmen2.asm. After the first commit, use convert.py for
new code instead; never re-split over hand-edited sources.
"""
from __future__ import annotations

import argparse
import json
import shutil
import sys

import build
import m68k

ROOT = m68k.ROOT
PREAMBLE = """\
; ===========================================================================
; X-Men 2: Clone Wars (USA, Europe) - Sega Genesis / Mega Drive
; Byte-matching disassembly. Build ONLY with: uv run tools/build.py
; ROM SHA-1 61409e6cf6065ab67d8952b891d8edcf47777193 (supply your own dump)
; ===========================================================================
	cpu 68000
	padding off		; don't pad dc.b
	supmode on		; no privileged-instruction warnings
	listing purecode
	page 0
	include "src/macros.asm"
	include "src/ram.asm"

	org 0
"""
MACROS = """\
; Raw, not-yet-explored ROM bytes. Replace with real code/data as it is understood.
incrom macro start,len
	binclude "xmen2.bin",start,len
	endm

; One A5 jump-table entry. `jsr d(a5)` with d = $22 + 8*index lands on the jmp.
; The leading `bra.s *` word is the Mac segment-loader placeholder.
jtentry macro target
	dc.w	$60FE
	jmp	(target).l
	endm
"""
RAM = """\
; RAM / A5-world symbols. Globals are addressed as negative offsets from A5,
; e.g. `move.w #2,-$38A6(a5)`. Name them here as they are identified:
;   g_example = -$38A6	; word: what it is (evidence: sub_XXXXXX)
"""


def label_name(a: int, kind: str) -> str:
    return f"{'sub' if kind == 'sub' else 'loc'}_{a:06X}"


def printable(bs: bytes) -> bool:
    return all(0x20 <= b < 0x7F and b != 0x22 for b in bs)


def dcb(bs: bytes) -> str:
    if printable(bs):
        return f'dc.b\t"{bs.decode()}"'
    return "dc.b\t" + ",".join(f"${b:02X}" for b in bs)


def header_asm(rom: bytes, labels: dict[int, str]) -> str:
    def ref(v: int) -> str:
        if v == m68k.JT_START:
            return "JumpTable"
        return labels.get(v, f"${v:08X}")

    out = ["; Vector table", "Vectors:"]
    names = {0: "initial SSP", 1: "reset", 2: "bus error", 3: "address error", 4: "illegal",
             24: "spurious", 28: "IRQ4 / H-int", 30: "IRQ6 / V-int"}
    for v in range(64):
        val = m68k.u32(rom, v * 4)
        out.append(f"\tdc.l\t{ref(val) if v else f'${val:08X}'}\t; {v:2d} {names.get(v, '')}".rstrip())
    out += ["", "; ROM header", "Header:"]
    fields = [(0x100, 16, "system type"), (0x110, 16, "copyright"), (0x120, 48, "domestic name"),
              (0x150, 48, "overseas name"), (0x180, 14, "serial / version")]
    for off, n, what in fields:
        out.append(f"\t{dcb(rom[off:off + n])}\t; {what}")
    out.append(f"\tdc.w\t${m68k.u16(rom, 0x18E):04X}\t; checksum")
    out.append(f"\t{dcb(rom[0x190:0x1A0])}\t; I/O support")
    out.append("\tdc.l\t" + ",".join(f"${m68k.u32(rom, a):08X}" for a in (0x1A0, 0x1A4)) + "\t; ROM start/end")
    out.append("\tdc.l\t" + ",".join(f"${m68k.u32(rom, a):08X}" for a in (0x1A8, 0x1AC)) + "\t; RAM start/end")
    for off, n, what in [(0x1B0, 12, "SRAM info"), (0x1BC, 12, "modem info"), (0x1C8, 40, "notes"), (0x1F0, 16, "regions")]:
        out.append(f"\t{dcb(rom[off:off + n])}\t; {what}")
    out += ["", "; $200: A5-world application parameters; $210-$21C are the interrupt hook",
            "; pointers read by the vector stubs (`movea.l $214.w,a0 / jsr (a0)`).", "A5Params:"]
    for a in range(0x200, 0x220, 4):
        out.append(f"\tdc.l\t{ref(m68k.u32(rom, a))}\t; ${a:03X}")
    return "\n".join(out) + "\n"


def jumptable_asm(rom: bytes, labels: dict[int, str]) -> str:
    out = ["; A5 jump table: `jsr $XX(a5)` calls entry ($XX-$22)/8. Entries whose target",
           "; is not (yet) known code are numeric; many point at data, not functions.", "JumpTable:"]
    for i in range(m68k.JT_COUNT):
        t = m68k.jt_target(rom, i)
        out.append(f"\tjtentry\t{labels.get(t, f'${t:06X}')}\t; [{i}] jsr ${0x22 + 8 * i:X}(a5)")
    return "\n".join(out) + "\n"


def emit_function(rom: bytes, fs: int, fe: int, labels: dict[int, str], bad: set[int],
                  reasons: dict[int, str]) -> str:
    """AS source for the instructions in [fs, fe)."""
    body = [f"; {'-' * 75}", f"; {labels.get(fs, label_name(fs, 'sub'))}"
            + (f"\t[{reasons[fs]}]" if fs in reasons else ""), f"; {'-' * 75}"]
    a = fs
    while a < fe:
        ins = m68k.decode(rom, a)
        if a in labels:
            body.append(f"{labels[a]}:")
        if a in bad:
            body.append("\t" + m68k.dcw_line(rom, a, ins.size, f"{ins.mnemonic} {ins.op_str}"))
        else:
            line = m68k.format_ins(ins, labels)
            d = m68k.a5_disp(ins)
            tgt = m68k.a5_jsr_target(rom, d) if d is not None and m68k.base_mnemonic(ins) in ("jsr", "jmp") else None
            if tgt is not None:
                line += f"\t; -> {labels.get(tgt, f'${tgt:06X}')}"
            body.append("\t" + line)
        a += ins.size
    return "\n".join(body) + "\n"


def validate(rom: bytes, addrs: list[int]) -> set[int]:
    """Assemble each instruction at its own org; return addresses AS can't reproduce."""
    lines = [PREAMBLE.split("\tinclude")[0]]
    lines.append("\tinclude \"src/macros.asm\"\n")
    for a in addrs:
        ins = m68k.decode(rom, a)
        lines.append(f"\torg ${a:X}\n\t{m68k.format_ins(ins, {})}\n")
    (ROOT / "build" / "validate.asm").write_text("".join(lines))
    ok, msg = build.assemble("build/validate.asm")
    rows = {a: d for a, d, _s in build.parse_listing(ROOT / "build" / "validate.lst")}
    bad = set()
    for a in addrs:
        ins = m68k.decode(rom, a)
        if rows.get(a) != rom[a:a + ins.size]:
            bad.add(a)
    if not ok:
        # Syntax errors: AS reports the line; rows for those instructions are missing -> already bad.
        print(f"validate: assembler reported errors (expected for unformattable lines); {len(bad)} bad")
    return bad


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--force", action="store_true", help="overwrite existing src/ and xmen2.asm")
    args = ap.parse_args()
    if (ROOT / "xmen2.asm").exists() and not args.force:
        print("xmen2.asm exists; refusing to overwrite hand edits (use --force for a fresh split)")
        return 1

    rom = m68k.load_rom()
    ex = json.loads((ROOT / "build" / "explore.json").read_text())
    kinds = {int(a, 16): k for a, k in ex["labels"].items()}
    reasons = {int(a, 16): w for a, w in ex["seed_reasons"].items()}
    ranges = [(int(s, 16), int(e, 16)) for s, e in ex["ranges"]]

    addrs = []
    for s, e in ranges:
        a = s
        while a < e:
            addrs.append(a)
            a += m68k.decode(rom, a).size

    (ROOT / "src").mkdir(exist_ok=True)
    (ROOT / "src" / "macros.asm").write_text(MACROS)
    bad = validate(rom, addrs)
    print(f"pass 1: {len(addrs)} instructions, {len(bad)} need dc.w fallback")

    labels = {a: label_name(a, k) for a, k in kinds.items()}
    fdir = ROOT / "src" / "f"
    if fdir.exists():
        shutil.rmtree(fdir)
    fdir.mkdir(parents=True)
    (ROOT / "src" / "header.asm").write_text(header_asm(rom, labels))
    (ROOT / "src" / "jumptable.asm").write_text(jumptable_asm(rom, labels))
    if not (ROOT / "src" / "ram.asm").exists():
        (ROOT / "src" / "ram.asm").write_text(RAM)

    main_lines = [PREAMBLE, '\tinclude "src/header.asm"\n', '\tinclude "src/jumptable.asm"\n']
    cursor = m68k.JT_END

    def gap(upto: int):
        nonlocal cursor
        if upto > cursor:
            main_lines.append(f"\tincrom\t${cursor:06X},${upto - cursor:X}\n")
        cursor = upto

    for s, e in ranges:
        gap(s)
        # split the range into one file per function entry
        starts = [a for a in addrs if s <= a < e and kinds.get(a) == "sub"]
        if not starts or starts[0] != s:
            starts.insert(0, s)
        bounds = starts + [e]
        for fs, fe in zip(bounds, bounds[1:]):
            (fdir / f"{fs:06X}.asm").write_text(emit_function(rom, fs, fe, labels, bad, reasons))
            main_lines.append(f'\tinclude "src/f/{fs:06X}.asm"\n')
        cursor = e
    gap(len(rom))
    (ROOT / "xmen2.asm").write_text("".join(main_lines))
    print(f"pass 2: wrote {len(list(fdir.glob('*.asm')))} function files")
    sys.argv = [sys.argv[0]]
    return build.main()


if __name__ == "__main__":
    raise SystemExit(main())
