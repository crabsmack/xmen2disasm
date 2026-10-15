# Recompilation handoff (phase 2)

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
