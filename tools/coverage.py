"""Compare runtime traces (emu/coverage/*.gz, union of all runs) with the disassembly.

    uv run tools/coverage.py            # summary + build/coverage_report.json
    uv run tools/coverage.py --list 30  # also print the first N items of each problem list

Checks (the runtime half of the definition of done, see docs/DONE.md):
  missed_code    executed instruction starts that are NOT disassembled code. Each is
                 runtime proof of code -> convert.py (evidence: "runtime: <run>").
  mid_insn       executed addresses that land INSIDE a disassembled instruction:
                 the disassembly decoded those bytes wrongly.
  code_as_data   bytes inside disassembled instructions that the CPU read as DATA
                 (excluding the A5 jump table): data mis-disassembled as code, or an
                 inline table inside a function. Each must be explained or fixed.
Also reports how much static code ran, and data/DMA-source spans still inside raw
incrom (hints for data identification: DMA sources are graphics/tilemaps).
"""
from __future__ import annotations

import argparse
import gzip
import json
import sys
from pathlib import Path

import numpy as np

import build
import convert

ROOT = build.ROOT
COV = ROOT / "emu" / "coverage"
JT = (0x220, 0x220 + 2631 * 8)


def union(kind: str, nbytes: int) -> tuple[np.ndarray, list[str]]:
    acc = np.zeros(nbytes, dtype=np.uint8)
    runs = []
    for p in sorted(COV.glob(f"*.{kind}.bin.gz")):
        arr = np.frombuffer(gzip.decompress(p.read_bytes()), dtype=np.uint8)
        acc |= arr[:nbytes]
        runs.append(p.name.split(".")[0])
    return acc, runs


def first_run(kind: str, addr: int, word: bool) -> str:
    bit = addr >> 1 if word else addr
    for p in sorted(COV.glob(f"*.{kind}.bin.gz")):
        arr = np.frombuffer(gzip.decompress(p.read_bytes()), dtype=np.uint8)
        if arr[bit >> 3] >> (bit & 7) & 1:
            return p.name.split(".")[0]
    return "?"


def spans(addrs: list[int], gap: int) -> list[list[int]]:
    out: list[list[int]] = []
    for a in addrs:
        if out and a - out[-1][1] <= gap:
            out[-1][1] = a + (2 if gap == 2 else 1)
        else:
            out.append([a, a + (2 if gap == 2 else 1)])
    return out


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--list", type=int, default=0)
    ap.add_argument("--convert", action="store_true",
                    help="convert every runtime-proven missed instruction (convert.py batch mode)")
    args = ap.parse_args()
    rom_size = build.ROM.stat().st_size

    exe, runs = union("exec", 0x400000 // 16)
    if not runs:
        print("no runtime coverage yet: run `uv run emu/xmen2emu.py movie --name tas` first")
        return 1
    data, _ = union("data", 0x400000 // 8)
    dma, _ = union("dma", 0x400000 // 8)
    exec_addrs = (np.nonzero(np.unpackbits(exe, bitorder="little"))[0] * 2).astype(np.int64)
    exec_addrs = exec_addrs[exec_addrs < rom_size]

    # instruction starts and the bytes they cover, from the last build's listing
    starts, covered = set(), np.zeros(rom_size, dtype=bool)
    for addr, blob, src in build.parse_listing(ROOT / "build" / "xmen2.lst"):
        if addr < rom_size and build.is_code_row(src):
            starts.add(addr)
            covered[addr:addr + len(blob)] = True
    main_lines = (ROOT / "xmen2.asm").read_text().splitlines()
    raw = convert.incrom_spans(main_lines)
    in_raw = np.zeros(rom_size, dtype=bool)      # any incrom (labelled or not)
    unlabelled = np.zeros(rom_size, dtype=bool)  # incrom with no `Name:` line right before it
    for i, s, e in raw:
        in_raw[s:e] = True
        prev = main_lines[i - 1].strip() if i else ""
        if not (prev.split(";")[0].strip().endswith(":")):
            unlabelled[s:e] = True

    missed = [int(a) for a in exec_addrs if a not in starts and not covered[a]]
    mid = [int(a) for a in exec_addrs if a not in starts and covered[a]]
    data_bits = np.unpackbits(data, bitorder="little")[:rom_size].astype(bool)
    dma_bits = np.unpackbits(dma, bitorder="little")[:rom_size].astype(bool)
    cad = np.nonzero(data_bits & covered)[0]
    cad = [int(a) for a in cad if not (JT[0] <= a < JT[1])]
    ran = sum(1 for a in exec_addrs if int(a) in starts)

    missed_spans = spans(missed, 2)
    report = {
        "runs": runs,
        "executed_instruction_starts": int(len(exec_addrs)),
        "static_instruction_starts": len(starts),
        "static_code_that_ran": ran,
        "missed_code": [{"start": f"{s:06X}", "end": f"{e:06X}", "run": first_run("exec", s, True),
                         "in_raw": bool(in_raw[s])} for s, e in missed_spans],
        "mid_insn": [f"{a:06X}" for a in mid],
        "code_as_data": [{"start": f"{s:06X}", "end": f"{e:06X}"} for s, e in spans(cad, 1)],
        "raw_data_read_spans": [{"start": f"{s:06X}", "end": f"{e:06X}"}
                                for s, e in spans([int(a) for a in np.nonzero(data_bits & unlabelled)[0]], 1)],
        "raw_dma_spans": [{"start": f"{s:06X}", "end": f"{e:06X}"}
                          for s, e in spans([int(a) for a in np.nonzero(dma_bits & unlabelled)[0]], 1)],
        "unlabelled_read_bytes": int((unlabelled & (data_bits | dma_bits)).sum()),
        "unlabelled_unread_bytes": int((unlabelled & ~(data_bits | dma_bits)).sum()),
        "unlabelled_unread_spans": [{"start": f"{s:06X}", "end": f"{e:06X}"} for s, e in spans(
            [int(a) for a in np.nonzero(unlabelled & ~(data_bits | dma_bits))[0]], 1)],
        "rom_size": rom_size,
    }
    (ROOT / "build").mkdir(exist_ok=True)
    (ROOT / "build" / "coverage_report.json").write_text(json.dumps(report, indent=1), newline="\n")
    print(f"runs: {', '.join(runs)}")
    print(f"executed instruction starts: {len(exec_addrs)}; static code that ran: {ran}/{len(starts)} "
          f"({100 * ran / max(1, len(starts)):.1f}%)")
    print(f"missed_code: {len(missed)} instruction starts in {len(missed_spans)} span(s)  [must be 0]")
    print(f"mid_insn: {len(mid)}  [must be 0]")
    print(f"code_as_data: {len(cad)} bytes in {len(report['code_as_data'])} span(s)  [each explained or fixed]")
    print(f"unlabelled raw spans read as data: {len(report['raw_data_read_spans'])}, used as DMA source: "
          f"{len(report['raw_dma_spans'])} ({report['unlabelled_read_bytes']} bytes; label them)")
    print(f"unlabelled raw bytes never read: {report['unlabelled_unread_bytes']} "
          f"({100 * report['unlabelled_unread_bytes'] / rom_size:.1f}% of ROM)")
    if args.list:
        for key in ("missed_code", "mid_insn", "code_as_data"):
            print(f"\n{key}:")
            for item in report[key][:args.list]:
                print("  ", item)
    if args.convert and missed:
        return convert_missed(missed, runs)
    return 0


def convert_missed(missed: list[int], runs: list[str]) -> int:
    """Runtime execution is proof of code: convert every missed instruction start.

    Span starts with a function prologue (LINK / MOVEM push) become sub_ entries,
    everything else loc_. Entries that still can't be converted are listed for review.
    """
    import subprocess

    import m68k
    rom = m68k.load_rom()
    subs, locs = [], []
    for s, _e in spans(missed, 2):
        ins = m68k.decode(rom, s)
        prologue = ins is not None and (ins.mnemonic.startswith("link") or
                                        (ins.mnemonic == "movem.l" and ins.op_str.endswith("-(a7)")))
        (subs if prologue else locs).append(s)
    locs += [a for a in missed if a not in set(subs) | set(locs)]
    evidence = f"runtime: executed in the corpus (union of {len(runs)} runs; coverage.py)"
    rc = 0
    for kind, entries in (("sub", subs), ("loc", sorted(locs))):
        if not entries:
            continue
        f = ROOT / "build" / f"runtime_{kind}_entries.txt"
        f.write_text("".join(f"{a:06X}\n" for a in entries), newline="\n")
        r = subprocess.run([sys.executable, str(ROOT / "tools" / "convert.py"), "--entries-file", str(f),
                            "--skip-refused", "--entry-kind", kind, "--evidence", evidence], cwd=ROOT)
        rc |= r.returncode
    return rc


if __name__ == "__main__":
    raise SystemExit(main())
