# Recompilation handoff (phase 2)

Criteria: [phases/P2-recomp.md](phases/P2-recomp.md) (checked by `uv run tools/phase.py 2`).
Phase 2 is a static recompilation on [segagenesisrecomp](https://github.com/mstan/segagenesisrecomp),
as a new game repository (like SonicTheHedgehog2Recomp) that pins this disassembly.
Regenerate everything here with `uv run tools/build.py && uv run tools/handoff.py`.

## Discovery inputs: `build/recomp/`

| File | Use in segagenesisrecomp |
|---|---|
| `code_addrs.txt` | `code_addrs_file` in game.toml: the "is this address code?" oracle. Every instruction start, runtime-verified (no executed instruction is missing). |
| `seeds.toml` | `[functions] extra`: every function entry, so heuristic discovery isn't needed. |
| `jumptable.csv` | The A5 jump table. `jsr d(a5)` targets resolve statically: entry `(d-$22)/8`. Only `kind=code` rows are functions. |
| `functions.csv` | Names, ends and one-line purposes for logs and debugging. |
| `ram_globals.csv` | Named RAM globals (A5-relative offset → RAM address) for `[ram_layout]` and probes. |
| `identity.json` | ROM hash, vectors, A5 = $200, IRQ hook pointers ($210/$214/$218). |

Facts the recompiler must model: A5 is constant `$200`, so `-d(a5)` addresses wrap
into RAM. `jmp d(a5)` thunk tables are entered at computed offsets. Objects dispatch
virtual calls through vtables (`movea.l (a4),a0; movea.l $XX(a0),a1; jsr (a1)`). The
vtables labelled `Tbl_*_vtable` in the disassembly are complete lists of those targets.

## What phase 1 found that the recompiler must handle

Phase 1 finished 2026-10-14 (all 16 criteria). Code reached only through computed control
flow, which a static recompiler cannot discover by following branches:
- **AI scripts** (56): a `Tbl_<Script>Len` count word followed by a table of
  `jmp d(a5)` thunks; `AiScript_Set` installs a script and the runner jumps to entry k.
  Every thunk is disassembled (static steps included), so each table entry is a seed.
- **Switch tables** (93): `Sw_XXXXXX` tables of `dc.w loc_case-(Sw_XXXXXX-2)` after
  `move.w Sw(pc,dN),dN / jmp Sw-2(pc,dN)`. Case targets are symbolic; ~70 case bodies the
  corpus never takes were disassembled from the tables.
- **`Scaler_RowBlocks`** ($1FC8FE): 80 copies of an 18-byte unrolled block entered by a
  computed jump from the picture scaler's row loop.
- **`Nem_PutRowRam`** ($15F572): the Nemesis decoder's RAM-output row writer, selected
  through a register (mode 0); never used in the corpus.
- **Jump-table entry 2612 = `Jt_NullTarget` (0)**: linked to nothing; its only user is dead
  code in `Sys_InitHardware`. Don't treat it as a function.

Keep the original behaviour, including bugs: `AvalonA4_ClearCameraZone` clears every
camera-zone flag (`!mask` where `~mask` was meant) and `Tank_SetTrackLimits` builds its
right limit from the wrong word. The comparison against the emulator only stays clean if
these are reproduced.

Data the game streams at runtime: sprite definitions (`Art_*Spr`, NOTES "Sprite
definitions") upload frame tiles every frame via `Spr_UploadFrame` -> `VDP_FlushDmaQueue`
DMA. The emulator logs where every DMA'd ROM byte went
(`emu/coverage/*.dmadest.txt.gz`) and which routine read every data byte
(`*.readers.txt.gz`), useful when a divergence involves graphics or tables.

## Reference traces for frame-by-frame comparison

The phase-2 loop is: run the recompiled game and the reference emulator on the
**same input stream**, compare state every frame, and debug the **first divergence**
(segagenesisrecomp PRINCIPLES.md #3).

- Reference emulator: `emu/` (BizHawk 2.4 gpgx, deterministic, headless).
- Input stream: `emu/corpus/tas/tas-4473M.bk2` (or any corpus scenario).
- `emu/runs/tas/frames.csv`: `frame, ram_crc32, fb_crc32, p1, p2` for all 57,465 frames.
  RAM CRC is over the 64 KB work RAM in 68000 byte order; the framebuffer CRC is over
  the visible XRGB pixels (backend-specific, so compare RAM first).
- `emu/runs/tas/ram/fNNNNNN.bin`: full RAM every 60 frames, for diffing at divergence.
- To get RAM at any exact frame: `make_emu("biz")`, replay the movie to frame N
  (`play_movie`), then `emu.ram()` (see `emu/xmen2emu.py`).

Recommended first milestone: boot through frame 600 (first stage running) with
RAM CRCs equal every frame.
