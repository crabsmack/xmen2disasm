---
name: first-divergence
description: Debug the first frame where the recompiled (or hand-C / native) X-Men 2 differs from the reference emulator - find what wrote the differing bytes, why, and fix the cause in the recompiler, game spec or hand-written C. Use for phase 2 criteria K5/K6/K8, phase 4 D1/D2/D6 (sync points) and phase 5 P2, or any "trace diverges at frame N" task.
---

# First divergence

The game is deterministic and both sides get the same inputs, so the **first** differing
frame holds the cause; later differences are mostly consequences. Fix one first
divergence, re-run, repeat. (Engine PRINCIPLES #3-#8: state over theory, trace the writer,
fix the source, minimal fixes.)

## 1. Locate

```
uv run tools/phase.py 2            # detail says "first divergence frame N: <columns>"
```
Its traces are in `build/phase_traces/<run>-<mode>/frames.csv` (game side) and
`emu/runs/<run>/frames.csv` (reference; worktrees use the main checkout's).
- Which column? `ram_crc32` = 68000 work RAM; `vram/cram/vsram_crc32` = VDP memories
  (DMA, tile/palette uploads, scroll). VRAM-only differences usually mean a DMA source,
  length or timing problem, not game logic.
- Divergence at a reset or right after `@tas N` → suspect the input export, not the game.
- **Phase 4 (stepped/handc)** compares at sync points, not frames: `build/phase_traces/<run>-
  <mode>-replay-<ref>/sync.csv` vs the D1 reference `<run>-recomp-sync/sync.csv`. Its `frame`
  column says which reference frame a sync point fell in. Diff state at the first differing
  sync point and the one before. A divergence that only the stepped runner shows (no hand C
  involved) is a harness problem: interrupt or hardware-read replay, DMA, or VDP stepping.

## 2. Diff the state at frame N (and N-1)

- Reference RAM at any frame: `make_emu("biz")`, `play_movie(...)` to frame N, `emu.ram()`
  (`emu/xmen2emu.py`); snapshots every 60 frames in `emu/runs/tas/ram/fNNNNNN.bin`
  (68000 byte order). Game side: `DUMP_RAM`/`DUMP_VRAM` in an `.input` script, or the
  runner's TCP `read_ram` (engine `DEBUG.md`).
- Name the differing bytes: `build/recomp/ram_globals.csv` (A5 globals), object layouts in
  `docs/NOTES.md` (actor at +$2E sprite, +$68 health...), `uv run tools/xref.py g_Name`
  for who reads and writes a global.

## 3. Find the writer

- Reference side: which instruction last wrote the address before frame N. The `emu/`
  harness logs which functions ran on which frames (`func_frames.json`) and every executed
  PC (`exec.bin`), but has no write watch yet: add one to the core/harness when first
  needed (build a tool, don't guess; PRINCIPLES #10).
- Game side: the frame-record ring and the generated function for that PC.
  `uv run tools/xref.py FuncName` gives the disassembly function, its header and evidence.
- Compare the two paths through that function: a different branch taken means an input
  to it already differed (go back one step); same path but different value means the
  translation of an instruction is wrong.

## 4. Fix the cause, at the right layer

- Wrong instruction semantics or a missed computed target → recompiler (engine fork) or
  `game.toml`; **never edit generated C** (PRINCIPLES #19).
- Hardware behaviour (VDP, DMA, interrupt timing) → engine runtime, in the fork.
- Hand-written C (phase 4/5) → the C function; add the failing state as a regression case
  for its differential test.
- Timing-only differences (a lag frame, an interrupt landing one instruction later) are
  not fixed by changing the comparison: alignment rules need the user's approval.

## 5. Record

One line per root cause in `XMen2Recomp/docs/NOTES.md` (frame, symptom, cause, fix), so a
later agent recognises the pattern. Re-run `uv run tools/phase.py 2` (the cache makes the
already-passing runs free) and commit with the boot-smoke baseline if it changed (#23).

Kill a stuck runner by **PID**, never by image name (user rule).
