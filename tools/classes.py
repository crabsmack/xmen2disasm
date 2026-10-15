"""List the game's C++ actor classes (descriptor = vtable) and which function fills each slot.

    uv run tools/classes.py                 # every class: descriptor address, name, parent
    uv run tools/classes.py DROPBOMB        # one class: all slots, overrides marked with *
    uv run tools/classes.py --func 0x082340 # which class(es)/slot(s) point at this function

Descriptor layout (docs/NOTES.md "Actor classes"): word name_offset; long parent
descriptor; long method[] from +6 up to name_offset; then the C-string class name.
The root class is ACTOR at $1F49A6. An object's long at +0 points at its descriptor,
so `movea.l (a4),a0 / movea.l $XX(a0),a1 / jsr (a1)` calls slot $XX.
"""
from __future__ import annotations

import argparse
import re
import struct

import m68k

ROOT_DESC = 0x1F49A6
SLOT_NAMES = {  # ACTOR's slots, from its own methods (see NOTES)
    0x06: "GetSize", 0x0A: "InitSpawnRec", 0x0E: "New", 0x12: "Init", 0x16: "ContainsPoint",
    0x1A: "Draw", 0x22: "Attack", 0x26: "TakeDamage",
    0x2A: "SpawnRecInView", 0x2E: "SpawnFromRec", 0x32: "SpawnRecOutOfView", 0x36: "Despawn",
    0x3A: "InActivateWindow", 0x3E: "Activate", 0x42: "OutsideActiveWindow", 0x46: "Deactivate",
    0x4A: "Update", 0x4E: "Move", 0x52: "Kill", 0x56: "SetFrame", 0x5E: "ClassInit",
}


def find_classes(rom: bytes) -> dict[int, tuple[str, int]]:
    L = lambda a: struct.unpack(">I", rom[a:a + 4])[0]
    W = lambda a: struct.unpack(">H", rom[a:a + 2])[0]

    def name_at(a):
        m = re.match(rb"[A-Za-z0-9_ ]{2,40}\x00", rom[a:a + 42])
        return m.group()[:-1].decode() if m else None

    known = {ROOT_DESC: (name_at(ROOT_DESC + W(ROOT_DESC)), 0)}
    # other roots (e.g. CAMERA $1F4960): parent 0, all slots even ROM code pointers, a name
    for a in range(0, len(rom) - 8, 2):
        n = W(a)
        if L(a + 2) != 0 or not (14 <= n <= 0x200 and n % 2 == 0):
            continue
        ptrs = [L(a + o) for o in range(6, n, 4)]
        if all(0x200 <= p < len(rom) and p % 2 == 0 for p in ptrs) and name_at(a + n):
            nm = name_at(a + n)
            if nm.isupper():
                known.setdefault(a, (nm, 0))
    changed = True
    while changed:
        changed = False
        for a in range(0, len(rom) - 8, 2):
            if a in known or L(a + 2) not in known:
                continue
            n = W(a)
            nm = 6 <= n <= 0x800 and n % 2 == 0 and name_at(a + n)
            if nm:
                known[a] = (nm, L(a + 2))
                changed = True
    return known


def methods(rom: bytes, desc: int) -> dict[int, int]:
    n = struct.unpack(">H", rom[desc:desc + 2])[0]
    return {o: struct.unpack(">I", rom[desc + o:desc + o + 4])[0] for o in range(6, n, 4)}


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?")
    ap.add_argument("--func", type=lambda s: int(s, 0))
    args = ap.parse_args()
    rom = m68k.load_rom()
    classes = find_classes(rom)

    def slot_name(d, o):  # ACTOR slot names only apply to ACTOR's descendants
        while classes[d][1]:
            d = classes[d][1]
        return SLOT_NAMES.get(o, "") if d == ROOT_DESC else ""

    if args.func is not None:
        for d, (nm, p) in sorted(classes.items()):
            for o, m in methods(rom, d).items():
                if m == args.func:
                    own = p == 0 or methods(rom, p).get(o) != m
                    print(f"{nm} (${d:06X}) slot +${o:X} {slot_name(d, o)}"
                          + ("" if own else " (inherited)"))
        return 0
    if args.name:
        hit = [d for d, (nm, _) in classes.items() if nm == args.name.upper()]
        if not hit:
            print("unknown class")
            return 1
        d = hit[0]
        nm, p = classes[d]
        print(f"{nm} at ${d:06X}, parent {classes[p][0] if p else '-'}")
        pm = methods(rom, p) if p else {}
        for o, m in methods(rom, d).items():
            print(f"  +${o:02X} {'*' if pm.get(o) != m else ' '} ${m:06X}  {slot_name(d, o)}")
        return 0
    for d, (nm, p) in sorted(classes.items()):
        print(f"${d:06X} {nm:20} < {classes[p][0] if p else '-'}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
