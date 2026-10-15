"""Who uses each unlabelled data span: the evidence for naming data (S2/S3/S4/S5).

    uv run tools/datamap.py                    # write build/datamap.json + summary by reader
    uv run tools/datamap.py --spans 40         # also print the first N spans
    uv run tools/datamap.py --reader Mem_Copy  # spans read by one function
    uv run tools/datamap.py --at 0x006D22      # everything known about the span holding ADDR

For every runtime-read (or DMA'd) span of unlabelled raw ROM bytes (build/coverage_report.json,
so run tools/coverage.py first) it lists:
  readers  functions whose instructions first read its bytes, from the emulator reader logs
           (emu/coverage/*.readers.txt.gz; R = 68000 read, D = DMA source; function names are
           today's labels, so re-run after renames)
  refs     jump-table entries and numeric code operands pointing into it
  head     the first bytes
Also lists numeric references into never-read raw bytes (static-only data) with --static.
"""
from __future__ import annotations

import argparse
import bisect
import gzip
import json
import re
from collections import defaultdict
from pathlib import Path

import build

ROOT = build.ROOT
COV = ROOT / "emu" / "coverage"


def symbols() -> dict[int, str]:
    out: dict[int, str] = {}
    for line in (ROOT / "build" / "symbols.txt").read_text().splitlines():
        name, _, a = line.partition("=$")
        if a:
            out.setdefault(int(a, 16), name)
    return out


def func_names() -> tuple[list[int], list[str]]:
    starts = sorted(int(p.stem, 16) for p in (ROOT / "src" / "f").glob("*.asm"))
    syms = symbols()
    return starts, [syms.get(a, f"sub_{a:06X}") for a in starts]


def load_readers() -> list[tuple[int, int, list[tuple[str, int, int, int]]]]:
    rows = []
    for p in sorted(COV.glob("*.readers.txt.gz")):
        with gzip.open(p, "rt") as g:
            for line in g:
                s, n, *who = line.split()
                rows.append((int(s, 16), int(n, 16),
                             [(k, int(fn, 16), int(pc, 16), int(b, 16))
                              for k, fn, pc, b in (w.split(":") for w in who)]))
    rows.sort()
    return rows


def code_refs() -> list[tuple[int, str, str]]:
    """(target, function, operand text) for numeric ROM operands and numeric jt entries."""
    out = []
    pat = re.compile(r"\$([0-9A-F]+)\(pc|\(\$([0-9A-F]+)\)\.l|#\$([0-9A-F]{5,6})\b")
    for f in (ROOT / "src" / "f").glob("*.asm"):
        text = f.read_text()
        m = re.search(r"^([A-Za-z_]\w*):", text, re.M)
        fn = m.group(1) if m else f.stem
        for line in text.splitlines():
            body = line.split(";")[0]
            for mm in pat.finditer(body):
                v = int(next(g for g in mm.groups() if g), 16)
                if v < 0x200000:
                    out.append((v, fn, body.strip()))
    for line in (ROOT / "src" / "jumptable.asm").read_text().splitlines():
        m = re.match(r"\tjtentry\t\$([0-9A-F]{6})\t; \[(\d+)\]", line)
        if m:
            out.append((int(m.group(1), 16), f"jt[{m.group(2)}]", line.strip()))
    out.sort()
    return out


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--spans", type=int, default=0)
    ap.add_argument("--reader")
    ap.add_argument("--at", type=lambda s: int(s, 0))
    args = ap.parse_args()
    rep = json.loads((ROOT / "build" / "coverage_report.json").read_text())
    rom = build.ROM.read_bytes()
    starts, names = func_names()

    def fname(fn: int) -> str:
        i = bisect.bisect_right(starts, fn) - 1
        return names[i] if i >= 0 and starts[i] == fn else (f"?{fn:06X}" if fn else "(none)")

    spans = sorted({(int(s["start"], 16), int(s["end"], 16), "R") for s in rep["raw_data_read_spans"]} |
                   {(int(s["start"], 16), int(s["end"], 16), "D") for s in rep["raw_dma_spans"]})
    readers = load_readers()
    rstarts = [r[0] for r in readers]
    maxlen = max((r[1] for r in readers), default=0)
    refs = code_refs()
    ref_addrs = [r[0] for r in refs]
    out = []
    for s, e, kind in spans:
        who: dict[tuple[str, str], int] = defaultdict(int)
        i = bisect.bisect_left(rstarts, s - maxlen)
        while i < len(readers) and readers[i][0] < e:
            rs, rn, rw = readers[i]
            if rs + rn > s:
                for k, fn, _pc, b in rw:
                    who[(k, fname(fn))] += b
            i += 1
        j = bisect.bisect_left(ref_addrs, s)
        rf = []
        while j < len(refs) and refs[j][0] < e:
            rf.append(f"{refs[j][1]}@{refs[j][0]:06X}")
            j += 1
        out.append({"start": f"{s:06X}", "end": f"{e:06X}", "len": e - s, "kind": kind,
                    "readers": [f"{k}:{n}:{b}" for (k, n), b in sorted(who.items(), key=lambda kv: -kv[1])],
                    "refs": rf, "head": rom[s:s + 16].hex()})
    (ROOT / "build" / "datamap.json").write_text(json.dumps(out, indent=0), newline="\n")

    def show(o: dict) -> None:
        print(f"{o['start']}-{o['end']} {o['len']:6X} {o['kind']}  readers: {' '.join(o['readers'][:4])}"
              f"  refs: {' '.join(o['refs'][:4])}  head: {o['head'][:24]}")

    if args.at is not None:
        for o in out:
            if int(o["start"], 16) <= args.at < int(o["end"], 16):
                show(o)
                print("  all readers:", " ".join(o["readers"]))
                print("  all refs:", " ".join(o["refs"]))
        return 0
    if args.reader:
        for o in out:
            if any(r.split(":")[1] == args.reader for r in o["readers"]):
                show(o)
        return 0
    by: dict[str, list[int]] = defaultdict(lambda: [0, 0])
    for o in out:
        top = o["readers"][0].split(":")[1] if o["readers"] else "(no reader log)"
        by[top][0] += 1
        by[top][1] += o["len"]
    print(f"{len(out)} unlabelled read spans, {sum(o['len'] for o in out)} bytes; by main reader:")
    for name, (n, b) in sorted(by.items(), key=lambda kv: -kv[1][1])[:40]:
        print(f"  {name:28} {n:5d} spans {b:8d} bytes")
    for o in out[:args.spans]:
        show(o)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
