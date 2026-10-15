"""Label runtime-read data items from evidence (S2/S4), via label_data.py --batch.

    uv run tools/dataitems.py                      # refresh build/dataitems.json first
    uv run tools/autolabel.py --dry-run [--show 60]
    uv run tools/autolabel.py [--limit N]

Each item from tools/dataitems.py that the corpus read or DMA'd gets a name
`<Prefix>_<Context><Role>` and a comment stating its format and the evidence:
  kind     from its readers (see RULES; formats in docs/NOTES.md "Data formats") and, for
           sprite definitions, the type byte at +0
  context  the class/module prefix of the functions using its jump-table slot or referencing
           it, else of the function just before it in ROM
  comment  format; bytes read; top readers; VDP DMA destination; jt slot users
Only items with a recognised kind are labelled; the rest are printed for a human.
"""
from __future__ import annotations

import argparse
import json
import re
import subprocess
import sys
from collections import Counter

import build

ROOT = build.ROOT
GENERIC = {"sub", "loc", "unk", "Actor", "Obj", "Spr", "Nem", "Eni", "Level", "Mem", "VDP", "Anim", "Pal",
           "Seg", "Math", "List", "Timer", "DrawList", "Snd", "Z80", "Pad", "Irq", "Scene", "Spawn", "Cam",
           "Scroll", "Game"}
SPRITE_READERS = ("Spr_UploadFrame", "Spr_Emit", "Spr_PreloadTiles", "Obj_UpdateBoxes", "Spr_Render",
                  "Spr_SetFrame", "Spr_Draw", "Obj_FindHitPoint")
SPR_TYPES = {0x18: "type $18, raw 4bpp tiles", 0x19: "type $19, Nemesis-compressed tiles",
             0x14: "type $14, raw tiles in 4-byte pieces", 0x20: "type $20 (RAM copy layout)"}


def readers_of(it: dict) -> list[tuple[str, str, int]]:
    """Readers with at least 10% of the top reader's share (reader logs are per span, so a
    long neighbouring span's readers leak in with small shares)."""
    out = []
    for r in it["readers"]:
        k, name, n = r.split(":")
        out.append((k, name, int(n)))
    top = out[0][2] if out else 0
    return [r for r in out if r[2] * 10 >= top]


def verb(name: str) -> str:
    """Reader name without its module prefix: AvalonB1_PalFadeStep -> PalFadeStep."""
    return re.sub(r"\W", "", name.split("_", 1)[1]) if "_" in name else ""


def context(it: dict) -> str:
    pool = [u for u in it["jt_users"] + it["refs"]]
    pre = Counter(u.split("_")[0] for u in pool if "_" in u and u.split("_")[0] not in GENERIC)
    if pre:
        return pre.most_common(1)[0][0]
    for nb in it["near"]:
        p = nb.split("_")[0] if "_" in nb else ""
        if p and p not in GENERIC:
            return p
    return ""


def kind(it: dict, head0: int) -> tuple[str, str, str] | None:
    """(prefix, role, format) or None."""
    rs = readers_of(it)
    names = [n for _k, n, _b in rs]
    top = names[0] if names else ""
    has = lambda *ps: any(n.startswith(p) for n in names for p in ps)  # noqa: E731
    dma = it["dma"] > 0
    if has(*SPRITE_READERS) or (top == "VDP_FlushDmaQueue" and head0 in SPR_TYPES):
        t = SPR_TYPES.get(head0, f"type ${head0:02X}")
        return "Art", "Spr", f"sprite definition ({t}): $24-byte header, $14-byte frame records, pieces, tiles"
    if top == "VDP_FlushDmaQueue":
        return "Art", "Tiles", "uncompressed 4bpp tiles DMA'd to VRAM"
    if top.startswith("Nem_"):
        if has("Level_"):
            return "Lvl", "Tiles", "level tileset/map blob with Nemesis-compressed tiles (NOTES: Level map / tileset blobs)"
        return "Art", "Nem", "Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller)"
    if top.startswith("Eni_"):
        if has("Level_"):
            return "Lvl", "Map", "level map blob, Enigma-compressed layout (NOTES: Level map / tileset blobs)"
        return "Map", "Eni", "Enigma-compressed tilemap (Eni_Decode)"
    if top.startswith("Seg_"):
        return "Lvl", "Segs", "floor-segment list (Seg_LoadList: 12/10-byte records until a 0 byte)"
    if top.startswith("Level_"):
        return "Lvl", "Data", f"level data read by {top}"
    if top.startswith("Anim_"):
        return "Tbl", "Anim", "animation script (byte flags, byte steps, ..., 2-byte steps from +6)"
    if top.startswith("Pal_"):
        return "Pal", "Cycle" if "Cycle" in top else "", f"palette data read by {top}"
    if top == "Cerebro_PrintText":
        return "Str", "Text", "Cerebro briefing text (Cerebro_PrintText)"
    if top == "VDP_WriteWords":
        return "Tbl", "Vdp", "words copied to the VDP data port by VDP_WriteWords"
    if top and not top.startswith(("sub_", "loc_", "unk_", "?")):
        return "Tbl", verb(top), f"table read by {top}"
    return None


STATIC_KINDS = [  # callee prefix the item's jt slot is handed to -> (prefix, role, format)
    (("Spr_Init", "Spr_Set", "Obj_SetSprite", "Spr_Preload"), ("Art", "Spr", "sprite definition (NOTES: Sprite definitions)")),
    (("Obj_SetAnim", "Obj_ChangeAnim", "Anim_"), ("Tbl", "Anim", "animation script (NOTES: Animation scripts)")),
    (("Level_Load",), ("Lvl", "Data", "level map/tileset blob (NOTES: Level map / tileset blobs)")),
    (("Seg_",), ("Lvl", "Segs", "floor-segment list (Seg_LoadList)")),
    (("Pal_",), ("Pal", "", "palette data")),
    (("Nem_",), ("Art", "Nem", "Nemesis-style compressed tiles")),
    (("Eni_",), ("Map", "Eni", "Enigma-compressed tilemap")),
    (("Cerebro_PrintText",), ("Str", "Text", "Cerebro briefing text")),
    (("Snd_", "Music_"), ("Snd", "", "sound data")),
]


def slot_callees() -> dict[int, list[tuple[str, str]]]:
    """jt slot -> [(user function, callee it hands the slot's data to)], from the source: the
    first `jsr` within 10 lines after a `$d(a5)` / `$d+2(a5)` reference (d = $22 + 8 * slot)."""
    out: dict[int, list[tuple[str, str]]] = {}
    a5 = re.compile(r"(?<![-\w])\$([0-9A-F]+)\(a5\)")
    for f in (ROOT / "src" / "f").glob("*.asm"):
        lines = f.read_text().splitlines()
        fn = next((ln[:-1] for ln in lines if re.match(r"^[A-Za-z_]\w*:$", ln)), f.stem)
        for i, ln in enumerate(lines):
            body = ln.split(";")[0]
            if "jsr" in body:
                continue
            for m in a5.finditer(body):
                d = int(m.group(1), 16)
                slot = next(((dd - 0x22) // 8 for dd in (d, d - 2) if dd >= 0x22 and (dd - 0x22) % 8 == 0), None)
                if slot is None:
                    continue
                callee = ""
                for nxt in lines[i + 1:i + 11]:
                    if "\tjsr\t" in nxt:
                        mm = re.search(r"; -> (\w+)", nxt) or re.search(r"jsr\t(\w+)\(pc\)", nxt)
                        callee = mm.group(1) if mm else ""
                        break
                out.setdefault(slot, []).append((fn, callee))
    return out


def static_items(items: list[dict], rom: bytes, used: set[str]) -> list[str]:
    """Never-read items: kind from what the code hands their jt slot to; else a context name."""
    callees = slot_callees()
    out = []
    for it in items:
        if it["read"] or it["dma"]:
            continue
        s, ln = int(it["start"], 16), it["len"]
        blob = rom[s:s + ln]
        uses = [u for i in it["jt"] for u in callees.get(i, [])]
        k = None
        for pre, kd in STATIC_KINDS:
            if any(c.startswith(pre) for _u, c in uses):
                k = kd
                break
        ctx = context(it)
        if k is None and not it["jt"] and not it["refs"]:
            if set(blob) <= {0} or set(blob) <= {0xFF}:
                k = ("Pad", "", f"${blob[0]:02X} fill")
            else:
                continue  # unreferenced, unread: left for NOTES "Unknown"
        if k is None:
            named = [c for _u, c in uses if c and not c.startswith(("sub_", "loc_", "Mem_"))]
            if named:
                c = named[0]
                role = c.split("_")[0] if c.split("_")[0] not in GENERIC else verb(c)
                k = ("Tbl", role, f"data handed to {c} (format not established)")
            elif uses and not uses[0][0].startswith(("sub_", "loc_")):
                k = ("Tbl", verb(uses[0][0]), "format not established")
            else:
                k = ("Tbl", "", "format not established")
        prefix, role, fmt = k
        base = re.sub(r"\W", "", f"{prefix}_{ctx}{role}") + ("" if ctx else f"_{s:06X}")
        name, n = base, 2
        while name in used:
            name, n = f"{base}{n}", n + 1
        used.add(name)
        bits = [fmt, "never read in the corpus"]
        if uses:
            bits.append("jt[" + ",".join(map(str, it["jt"])) + "] used by " + ", ".join(
                dict.fromkeys(f"{u}" + (f" -> {c}" if c else "") for u, c in uses[:3])))
        elif it["jt"]:
            bits.append(f"jt[{','.join(map(str, it['jt']))}] (no code reference found)")
        elif it["refs"]:
            bits.append("referenced by " + ", ".join(it["refs"][:3]))
        else:
            bits.append(f"between {it['near'][0]} and {it['near'][1]}")
        out.append(f"{it['start']} {ln:X} {name} {'; '.join(bits)}")
    return out


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    ap.add_argument("--static", action="store_true", help="label never-read items from static use instead")
    ap.add_argument("--show", type=int, default=40)
    ap.add_argument("--limit", type=int, default=0)
    a = ap.parse_args()
    rom = build.ROM.read_bytes()
    items = json.loads((ROOT / "build" / "dataitems.json").read_text())
    used = {ln.split("=")[0] for ln in (ROOT / "build" / "symbols.txt").read_text().splitlines()}
    used |= set(re.findall(r"^([A-Za-z_]\w*)\s*=", (ROOT / "src" / "ram.asm").read_text(), re.M))
    out, skipped = [], []
    if a.static:
        out = static_items(items, rom, used)
        items = []
    for it in items:
        if not (it["read"] or it["dma"]):
            continue
        s = int(it["start"], 16)
        k = kind(it, rom[s])
        if not k:
            skipped.append(it)
            continue
        prefix, role, fmt = k
        ctx = context(it)
        base = re.sub(r"\W", "", f"{prefix}_{ctx}{role}") or f"{prefix}_Data"
        if base.endswith("_"):
            base += "Data"
        if not ctx:  # no module context: the address is the honest identity
            base += f"_{s:06X}"
        name, n = base, 2
        while name in used:
            name, n = f"{base}{n}", n + 1
        used.add(name)
        rd = readers_of(it)
        bits = [fmt, f"{it['read'] + it['dma'] and max(it['read'], it['dma']):X} of {it['len']:X} bytes used at runtime"]
        if rd:
            bits.append("read by " + ", ".join(dict.fromkeys(n for _k, n, _b in rd[:3])))
        if it["dmadest"]:
            bits.append("DMA to " + ", ".join(f"{t} ${v}" for t, v in it["dmadest"].items()))
        if it["jt"]:
            bits.append(f"jt[{','.join(map(str, it['jt']))}]" + (" used by " + ", ".join(it["jt_users"][:3]) if it["jt_users"] else ""))
        elif it["refs"]:
            bits.append("referenced by " + ", ".join(it["refs"][:3]))
        out.append(f"{it['start']} {it['len']:X} {name} {'; '.join(bits)}")
    if a.limit:
        out = out[:a.limit]
    for line in out[:a.show]:
        print(line[:220])
    print(f"{len(out)} item(s) to label; {len(skipped)} read item(s) without a rule:")
    for it in skipped[:25]:
        print(f"  {it['start']} {it['len']:X} readers {' '.join(it['readers'][:3])} jt {it['jt'][:2]} near {'/'.join(it['near'])}")
    if a.dry_run or not out:
        return 0
    batch = ROOT / "build" / "autolabel_batch.txt"
    batch.write_text("\n".join(out) + "\n", encoding="utf-8", newline="\n")
    return subprocess.run([sys.executable, str(ROOT / "tools" / "label_data.py"), "--batch", str(batch)],
                          cwd=ROOT).returncode


if __name__ == "__main__":
    raise SystemExit(main())
