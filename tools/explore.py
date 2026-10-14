"""Recursive-descent code discovery.

Seeds: reset/interrupt vectors, the interrupt hook pointers at $210-$21C,
every A5 jump-table target, entries listed in config/seeds.txt, and
(optionally) LINK A6 prologues that directly follow an RTS.

Follows bra/bcc/dbcc/bsr/jsr/jmp with static targets and resolves
`jsr d(a5)` through the jump table. Indirect calls (`jsr (a1)`) are recorded
for review. Writes build/explore.json.

    uv run tools/explore.py [--no-link-heuristic]
"""
from __future__ import annotations

import argparse
import json
from pathlib import Path

import m68k

ROOT = m68k.ROOT


def read_seeds(path: Path) -> list[int]:
    out = []
    if path.exists():
        for line in path.read_text().splitlines():
            tok = line.split(";")[0].split("#")[0].strip()
            if tok:
                out.append(int(tok.lstrip("$"), 16))
    return out


def read_ranges(path: Path) -> list[tuple[int, int]]:
    """config/data.txt: `START END ; note` per line (END exclusive)."""
    out = []
    if path.exists():
        for line in path.read_text().splitlines():
            tok = line.split(";")[0].split("#")[0].split()
            if len(tok) >= 2:
                out.append((int(tok[0].lstrip("$"), 16), int(tok[1].lstrip("$"), 16)))
    return out


def trace(rom: bytes, seed: int, code: dict[int, int], labels: dict[int, str], is_data):
    """Explore from seed into scratch sets, stopping at already-known code.

    Returns (new_code, new_labels, new_indirect), or a failure dict if any path
    hits an undecodable word, the jump table, known data, or leaves the ROM.
    """
    in_rom = lambda a: 0 <= a < len(rom) and a % 2 == 0  # noqa: E731
    new_code: dict[int, int] = {}
    new_labels: dict[int, str] = {seed: "sub"}
    new_ind: list[dict] = []
    work = [seed]
    while work:
        a = work.pop()
        while True:
            if a in code or a in new_code:
                break
            if not in_rom(a) or m68k.JT_START <= a < m68k.JT_END or is_data(a):
                return {"addr": f"{a:06X}", "why": "flow leaves ROM code area / known data"}
            ins = m68k.decode(rom, a)
            if ins is None:
                return {"addr": f"{a:06X}", "why": "undecodable"}
            new_code[a] = ins.size
            base = m68k.base_mnemonic(ins)
            tgt = m68k.direct_target(ins)
            is_a5 = False
            if base in ("jsr", "jmp") and tgt is None:
                d = m68k.a5_disp(ins)
                if d is not None:
                    tgt = m68k.a5_jsr_target(rom, d)
                    is_a5 = tgt is not None
                    if tgt is None:
                        new_ind.append({"addr": f"{a:06X}", "ins": f"{ins.mnemonic} {ins.op_str}", "why": "a5 non-jt"})
                else:
                    new_ind.append({"addr": f"{a:06X}", "ins": f"{ins.mnemonic} {ins.op_str}"})
            if tgt is not None:
                kind = "sub" if base in ("bsr", "jsr") or is_a5 else "loc"
                if new_labels.get(tgt) != "sub" and labels.get(tgt) != "sub":
                    new_labels[tgt] = kind
                work.append(tgt)
            if base in m68k.STOP:
                break
            a += ins.size
    return new_code, new_labels, new_ind


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--no-link-heuristic", dest="link_heuristic", action="store_false",
                    help="don't seed LINK A6 prologues that directly follow an RTS (on by default: "
                         "C-compiled methods reached only through vtables are found this way)")
    args = ap.parse_args()

    rom = m68k.load_rom()
    size = len(rom)
    in_rom = lambda a: 0 <= a < size and a % 2 == 0  # noqa: E731

    data_ranges = read_ranges(ROOT / "config" / "data.txt")
    is_data = lambda a: any(s <= a < e for s, e in data_ranges)  # noqa: E731

    # Ordered seed classes. A seed is accepted only if everything reachable from
    # it decodes cleanly (transactional), so data can never pollute verified code.
    seeds: list[tuple[int, str]] = []
    for v in range(1, 64):
        a = m68k.u32(rom, v * 4)
        if in_rom(a) and a >= m68k.JT_END:  # unused vectors point at JumpTable entry 0
            seeds.append((a, f"vector {v}"))
    for p in (0x210, 0x214, 0x218, 0x21C):
        a = m68k.u32(rom, p)
        if in_rom(a) and a >= m68k.JT_END:
            seeds.append((a, f"irq hook ${p:X}"))
    jt_unverified = []
    for i in range(m68k.JT_COUNT):
        t = m68k.jt_target(rom, i)
        if in_rom(t) and rom[t:t + 2] == b"\x4e\x56":
            seeds.append((t, f"jt {i}"))
        else:
            jt_unverified.append(i)
    for a in read_seeds(ROOT / "config" / "seeds.txt"):
        seeds.append((a, "config/seeds.txt"))
    if args.link_heuristic:
        for a in range(m68k.JT_END, size - 4, 2):
            if rom[a:a + 2] == b"\x4e\x56" and rom[a - 2:a] == b"\x4e\x75":
                seeds.append((a, "link-after-rts"))

    code: dict[int, int] = {}          # addr -> instruction size
    labels: dict[int, str] = {}        # addr -> "sub" | "loc"
    indirect: list[dict] = []
    rejected: list[dict] = []
    reasons: dict[int, str] = {}

    for seed, why in seeds:
        if seed in code:
            labels[seed] = "sub"
            reasons.setdefault(seed, why)
            continue
        res = trace(rom, seed, code, labels, is_data)
        if isinstance(res, dict):
            rejected.append({"seed": f"{seed:06X}", "reason": why, **res})
            continue
        nc, nl, ni = res
        code.update(nc)
        for t, k in nl.items():
            if labels.get(t) != "sub":
                labels[t] = k
        indirect.extend(ni)
        reasons[seed] = why

    # contiguous instruction ranges
    ranges = []
    for a in sorted(code):
        end = a + code[a]
        if ranges and ranges[-1][1] == a:
            ranges[-1][1] = end
        else:
            ranges.append([a, end])

    code_bytes = sum(code.values())
    out = {
        "rom_size": size,
        "instructions": len(code),
        "code_bytes": code_bytes,
        "functions": sorted(f"{a:06X}" for a, k in labels.items() if k == "sub" and a in code),
        "labels": {f"{a:06X}": k for a, k in sorted(labels.items()) if a in code},
        "ranges": [[f"{s:06X}", f"{e:06X}"] for s, e in ranges],
        "seed_reasons": {f"{a:06X}": w for a, w in sorted(reasons.items())},
        "indirect": indirect,
        "rejected_seeds": rejected,
        "jt_unverified": [{"index": i, "target": f"{m68k.jt_target(rom, i):06X}"} for i in jt_unverified],
    }
    (ROOT / "build").mkdir(exist_ok=True)
    (ROOT / "build" / "explore.json").write_text(json.dumps(out, indent=1), newline="\n")
    print(f"instructions {len(code)}, code bytes {code_bytes} ({100 * code_bytes / size:.1f}% of ROM), "
          f"functions {len(out['functions'])}, ranges {len(ranges)}, indirect {len(indirect)}, "
          f"rejected seeds {len(rejected)}, unverified jt entries {len(jt_unverified)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
