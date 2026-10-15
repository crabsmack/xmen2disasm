"""Reader for MPW 68K object files (.o) and Mac file containers, for phase 3 (compiler).

MPW .o is a stream of records (byte type, byte flags, ...), as printed by MPW's DumpObj:

    0 Pad (1 byte)            1 First (4)           2 Last (2)          3 Comment (size word)
    4 Dictionary: size, first id, Pascal strings (names for ids)
    5 Module: id, segment id (code) or size (data)  -- flags bit0 data, bit3 extern
    6 EntryPoint: id, long offset into the current module
    7 Size: long module size
    8 Contents: size, [long offset if flags bit3], [word repeat if flags bit4], bytes
    9 Reference: size, id, offsets          -- flags bit0 from data, bit3 32-bit offsets,
   10 ComputedRef: size, id1, id2, offsets     bit4 16-bit patch (else 32), bit7 A5-relative
   11 Filename (8)              12+ symbolic records (size word)

Only what phase 3 needs: module bytes, entry points, and where references patch them (so
comparisons against the ROM can mask or resolve those bytes).

    uv run tools/mpwobj.py FILE.o          # list modules, entries, references
"""
from __future__ import annotations

import sys
from dataclasses import dataclass, field
from pathlib import Path


@dataclass
class Ref:
    name: str
    offsets: list[int]
    patch: int            # 2 or 4 bytes patched at each offset
    a5: bool              # A5-relative (global / jump-table entry)
    computed: bool = False
    name2: str = ""       # ComputedRef: name - name2


@dataclass
class Module:
    name: str
    data_module: bool
    extern: bool
    segment: str = ""
    size: int = 0
    data: bytearray = field(default_factory=bytearray)
    entries: dict[str, int] = field(default_factory=dict)
    refs: list[Ref] = field(default_factory=list)

    def code(self) -> bytes:
        n = max(self.size, len(self.data))
        return bytes(self.data) + bytes(n - len(self.data))

    def patched(self) -> dict[int, Ref]:
        """byte offset -> reference patching it."""
        out = {}
        for r in self.refs:
            for o in r.offsets:
                for k in range(r.patch):
                    out[o + k] = r
        return out


def macbinary(d: bytes) -> tuple[bytes, bytes, bytes] | None:
    """(data fork, resource fork, type+creator) if d is MacBinary, else None."""
    if len(d) < 128 or d[0] != 0 or not 1 <= d[1] <= 63 or d[74] != 0 or d[82] != 0:
        return None
    dl, rl = int.from_bytes(d[83:87], "big"), int.from_bytes(d[87:91], "big")
    if 128 + dl > len(d):
        return None
    roff = 128 + (dl + 127) // 128 * 128
    return d[128:128 + dl], d[roff:roff + rl], d[65:73]


def data_fork(path: Path) -> bytes:
    d = Path(path).read_bytes()
    mb = macbinary(d) if str(path).lower().endswith(".bin") else None
    return mb[0] if mb else d


def _w(d: bytes, i: int) -> int:
    return int.from_bytes(d[i:i + 2], "big")


def _l(d: bytes, i: int) -> int:
    return int.from_bytes(d[i:i + 4], "big")


def parse(d: bytes) -> list[Module]:
    names: dict[int, str] = {}
    mods: list[Module] = []
    cur: Module | None = None
    pending_refs: list[tuple[Module, list]] = []   # names may be defined after use
    i = 0
    while i < len(d):
        t, f = d[i], d[i + 1] if i + 1 < len(d) else 0
        if t == 0:
            n = 1
        elif t == 1:
            n = 4
        elif t == 2:
            break
        elif t == 5:
            n = 6
            cur = Module(name=str(_w(d, i + 2)), data_module=bool(f & 1), extern=bool(f & 8))
            if cur.data_module:
                cur.size = _w(d, i + 4)
            else:
                cur.segment = str(_w(d, i + 4))
            mods.append(cur)
        elif t == 6:
            n = 8
            if cur is not None:
                cur.entries[str(_w(d, i + 2))] = _l(d, i + 4)
        elif t == 7:
            n = 6
            if cur is not None:
                cur.size = _l(d, i + 2)
        elif t == 11:
            n = 8
        else:
            n = _w(d, i + 2)
            if n < 4:
                raise ValueError(f"bad record type {t} size {n} at {i:#x}")
            if t == 4:
                j, k = i + 6, _w(d, i + 4)
                while j < i + n:
                    ln = d[j]
                    names[k] = d[j + 1:j + 1 + ln].decode("mac_roman")
                    j += 1 + ln
                    k += 1
            elif t == 8 and cur is not None:
                j = i + 4
                off = len(cur.data)
                if f & 8:
                    off = _l(d, j)
                    j += 4
                rep = 1
                if f & 0x10:
                    rep = _w(d, j)
                    j += 2
                chunk = d[j:i + n] * rep
                if len(cur.data) < off + len(chunk):
                    cur.data.extend(bytes(off + len(chunk) - len(cur.data)))
                cur.data[off:off + len(chunk)] = chunk
            elif t in (9, 10) and cur is not None:
                j = i + 4
                id1 = _w(d, j)
                j += 2
                id2 = 0
                if t == 10:
                    id2 = _w(d, j)
                    j += 2
                step = 4 if f & 8 else 2
                offs = [int.from_bytes(d[k:k + step], "big") for k in range(j, i + n - step + 1, step)]
                ref = Ref(name=str(id1), offsets=offs, patch=2 if f & 0x10 else 4,
                          a5=bool(f & 0x80) and t == 9, computed=t == 10, name2=str(id2) if t == 10 else "")
                cur.refs.append(ref)
        i += n
    # resolve ids to names (dictionary records can come after first use)
    for m in mods:
        m.size = m.size or len(m.data)   # compiler output has no Size record
        m.name = names.get(int(m.name), m.name)
        if m.segment:
            m.segment = names.get(int(m.segment), m.segment)
        m.entries = {names.get(int(k), k): v for k, v in m.entries.items()}
        for r in m.refs:
            r.name = names.get(int(r.name), r.name)
            if r.name2:
                r.name2 = names.get(int(r.name2), r.name2)
    return mods


def parse_file(path: Path) -> list[Module]:
    return parse(data_fork(path))


def main() -> int:
    for m in parse_file(Path(sys.argv[1])):
        kind = "data" if m.data_module else "code"
        print(f"{m.name} ({kind}, {m.size:#x} bytes, seg {m.segment or '-'})")
        for e, o in m.entries.items():
            print(f"    entry {e} +{o:#x}")
        for r in m.refs:
            what = f"{r.name}-{r.name2}" if r.computed else r.name
            print(f"    ref {what} {'A5 ' if r.a5 else ''}{r.patch * 8}-bit at {', '.join(f'{o:#x}' for o in r.offsets)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
