---
name: disasm-function
description: Understand and name functions in the X-Men 2 disassembly - pick from the work queue, gather static (asm, Ghidra pseudo-C, callers) and runtime (emulator frames, screenshots, RAM) evidence, rename with evidence, keep the build byte-identical. Use for any "name/document/understand function X" or "work the naming queue" task in xmen2disasm, and for definition-of-done criteria N1/N2/N3.
---

# Name a function (the main disassembly loop)

Goal per iteration: one function goes from `sub_XXXXXX` to a correct name with a
header a newcomer can trust, and the tree still builds byte-identical.

## 1. Pick

- Given a function: use it. Otherwise `uv run tools/xref.py --todo 25` and take
  the top entry (parallel mode: `--todo 25 --range LO HI` for your claimed range). The queue puts leaves and
  the most-called helpers first because their names make every caller easier.
- Read `docs/NOTES.md` "Subsystems" first. Someone may already know the module.

## 2. Gather evidence (read, don't guess)

```
uv run tools/xref.py sub_XXXXXX          # callers, callees, jt slot, globals, data, RUNTIME + screenshot
uv run tools/decomp.py decomp sub_XXXXXX # Ghidra pseudo-C (globals as RAM addresses, jt calls named)
```
Then read `src/f/XXXXXX.asm` and at least two callers.

Runtime evidence is the strongest kind:
- `xref.py` prints the TAS frame where the function first ran, how many frames it
  was active, and the nearest screenshot. **Look at the PNG** (Read tool).
  "Runs only on frame 7" = init; "every frame from 600 to 57k" = per-frame update;
  "only while the boss is on screen" = boss AI.
- For values: `uv run emu/xmen2emu.py shot --from-frame N` (screen + registers), and
  RAM snapshots `emu/runs/tas/ram/fNNNNNN.bin` (every 60 frames, 68000 byte
  order; global at `-$XXXX(a5)` = file offset `($200-$XXXX) & $FFFF`).
  Watching a global change across snapshots tells you what it counts.

Static tells:
- Hardware ports: `$C00004` VDP control (`$8Rvv` = register R := vv), `$C00000` VDP
  data, `$A11100` Z80 bus, `$A10003/5` joypad.
- `link.w a6,#-N`: N bytes of locals. Byte/word args are still pushed as longs.
- `movea.l (aN),a0 / movea.l $XX(a0),a1 / jsr (a1)`: virtual call at slot `$XX`.
- Inline strings next to functions often name the subsystem outright.

## 3. Name

```
uv run tools/rename.py sub_XXXXXX Module_Verb loc_YYYYYY Module_Verb_loop
uv run tools/rename.py --global -0x3B70 g_ResSiberia "byte: resource id for SiberiaB1 Blizzard (Title_LoadResources)"
uv run tools/decomp.py sync      # optional: refresh names in Ghidra
```
- Name the globals it owns too (N3 counts numeric globals shared by 2+ functions).
- Can't explain it from evidence after a real attempt? `unk_<Module>_XXXXXX` with a
  header saying what IS known (≤5% of functions). Never a confident-sounding guess.

## 4. Document (N2 checks the first line's format)

Use `tools/header.py` (no hand edits needed; batch many with a JSONL file):
```
uv run tools/header.py Module_Verb "one-line purpose" --in "8(a6) = ..." --out "d0 = ..." --evidence "..."
uv run tools/header.py --batch headers.jsonl   # {"name","purpose","in","out","evidence"} per line
```
It replaces the generated header in `src/f/XXXXXX.asm` with:
```
; ---------------------------------------------------------------------------
; Module_Verb - one-line purpose
; In:  8(a6) = long: what      $C(a6) = word: what
; Out: d0 = what (or "none")
; Evidence: called from X when Y; TAS frames 600-57000 every frame; writes VDP reg $81
; ---------------------------------------------------------------------------
```

## 5. Share, verify, commit

- Learned something about a subsystem, data format or global that others need?
  Append it to `docs/NOTES.md` in the same commit.
- `uv run tools/build.py` must print `OK: byte-identical`. Commit batches of ~5
  functions (the hook rebuilds first), then push.

## Don'ts
- Don't change instructions to read better. Only labels, operands that become
  symbols, and comments. Every byte stays identical.
- Don't touch `dc.w ...; insn:` lines except their comments. Don't run `split.py`.
