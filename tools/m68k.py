"""Shared 68000 helpers: ROM access, capstone decoding, AS-syntax formatting.

Formatting is best-effort; every generated line is verified by assembling it
(see split.py / convert.py). Lines AS cannot reproduce byte-for-byte fall back
to dc.w with the capstone text as a comment, so a mismatch never ships.
"""
from __future__ import annotations

import re
import struct
from pathlib import Path

import capstone

ROOT = Path(__file__).resolve().parent.parent
ROM_PATH = ROOT / "xmen2.bin"
ROM_SHA1 = "61409e6cf6065ab67d8952b891d8edcf47777193"

# Mac-style A5 jump table: 2631 eight-byte entries of `bra.s * ; jmp (target).l`.
JT_START = 0x220
JT_COUNT = 2631
JT_END = JT_START + JT_COUNT * 8

_md = capstone.Cs(capstone.CS_ARCH_M68K, capstone.CS_MODE_BIG_ENDIAN | capstone.CS_MODE_M68K_000)


def load_rom() -> bytes:
    return ROM_PATH.read_bytes()


def u16(rom: bytes, a: int) -> int:
    return struct.unpack_from(">H", rom, a)[0]


def u32(rom: bytes, a: int) -> int:
    return struct.unpack_from(">I", rom, a)[0]


def decode(rom: bytes, addr: int):
    """Return the capstone instruction at addr, or None if it does not decode."""
    for ins in _md.disasm(rom[addr:addr + 10], addr):
        return ins
    return None


def jt_target(rom: bytes, index: int) -> int:
    return u32(rom, JT_START + index * 8 + 4)


def a5_jsr_target(rom: bytes, disp: int) -> int | None:
    """`jsr disp(a5)` lands on the jmp of jump-table entry (disp-0x22)/8."""
    if disp < 0x22 or (disp - 0x22) % 8:
        return None
    index = (disp - 0x22) // 8
    if index >= JT_COUNT:
        return None
    return jt_target(rom, index)


# ---------------------------------------------------------------------------
# Control flow classification
# ---------------------------------------------------------------------------
STOP = {"rts", "rte", "rtr", "jmp", "bra", "illegal", "stop"}
COND_BRANCH = re.compile(r"^(b(hi|ls|cc|cs|ne|eq|vc|vs|pl|mi|ge|lt|gt|le|hs|lo)|db\w+)$")
HEX = re.compile(r"\$([0-9a-fA-F]+)")


def base_mnemonic(ins) -> str:
    return ins.mnemonic.split(".")[0]


def direct_target(ins) -> int | None:
    """Absolute target of a branch/jsr/jmp with a statically known destination."""
    m = base_mnemonic(ins)
    ops = ins.op_str.replace(" ", "")
    if m in ("bra", "bsr") or COND_BRANCH.match(m):
        last = ops.split(",")[-1]
        if re.fullmatch(r"\$[0-9a-fA-F]+", last):
            return int(last[1:], 16)
        return None
    if m in ("jsr", "jmp"):
        if re.fullmatch(r"\$[0-9a-fA-F]+\.[lw]", ops):
            return int(ops[1:-2], 16)
        if re.fullmatch(r"\$[0-9a-fA-F]+\(pc\)", ops):
            return int(ops[1:-4], 16)
    return None


def a5_disp(ins) -> int | None:
    ops = ins.op_str.replace(" ", "")
    m = re.fullmatch(r"(-?)\$([0-9a-fA-F]+)\(a5\)", ops)
    if not m:
        return None
    v = int(m.group(2), 16)
    return -v if m.group(1) else v


# ---------------------------------------------------------------------------
# AS formatting
# ---------------------------------------------------------------------------
def split_operands(op_str: str) -> list[str]:
    out, depth, cur = [], 0, ""
    for ch in op_str:
        if ch == "(":
            depth += 1
        elif ch == ")":
            depth -= 1
        if ch == "," and depth == 0:
            out.append(cur.strip())
            cur = ""
        else:
            cur += ch
    if cur.strip():
        out.append(cur.strip())
    return out


def _upper_hex(s: str) -> str:
    return HEX.sub(lambda m: "$" + m.group(1).upper(), s)


def format_operand(op: str, labels: dict[int, str], is_target: bool) -> str:
    op = op.replace(" ", "")
    # bare branch target
    if is_target and re.fullmatch(r"\$[0-9a-fA-F]+", op):
        a = int(op[1:], 16)
        return labels.get(a, f"${a:X}")
    # absolute short / long: $1234.w -> ($1234).w
    m = re.fullmatch(r"\$([0-9a-fA-F]+)\.([lw])", op)
    if m:
        a = int(m.group(1), 16)
        if m.group(2) == "w" and 0x8000 <= a <= 0xFFFF:
            a |= 0xFFFF0000  # absolute short is sign-extended ($FFFF.w = $FFFFFFFF)
        name = labels.get(a) if m.group(2) == "l" else None
        return f"({name or '$%X' % a}).{m.group(2)}"
    # pc-relative: capstone prints the absolute target
    m = re.fullmatch(r"\$([0-9a-fA-F]+)\(pc(,.*)?\)", op)
    if m:
        a = int(m.group(1), 16)
        return f"{labels.get(a, '$%X' % a)}(pc{m.group(2) or ''})"
    return _upper_hex(op)


def format_ins(ins, labels: dict[int, str]) -> str:
    mnem = ins.mnemonic
    base = mnem.split(".")[0]
    ops = split_operands(ins.op_str)
    branchy = base in ("bra", "bsr", "jmp", "jsr") or COND_BRANCH.match(base)
    if branchy and base[0] == "b" and mnem.endswith(".b"):
        mnem = base + ".s"
    if base in ("btst", "bchg", "bclr", "bset"):
        mnem = base
    if base == "move" and any(o.strip() == "usp" for o in ops):
        mnem = "move.l"
    out = [format_operand(o, labels, bool(branchy) and i == len(ops) - 1) for i, o in enumerate(ops)]
    if base == "moveq":
        m = re.fullmatch(r"#\$([0-9A-F]+)", out[0])
        if m and int(m.group(1), 16) >= 0x80:
            out[0] = f"#-${0x100 - int(m.group(1), 16):X}"
    return f"{mnem}\t{','.join(out)}" if out else mnem


def dcw_line(rom: bytes, addr: int, size: int, comment: str) -> str:
    words = ",".join(f"${u16(rom, a):04X}" for a in range(addr, addr + size, 2))
    return f"dc.w\t{words}\t; {comment}"
