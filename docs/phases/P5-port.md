# Phase 5: PC port (definition of done, DRAFT)

**Status: draft.** P0 makes the agent revise these criteria with what phase 4 learned and
get the user's approval before any other criterion counts.

Goal: the game's C runs on **native memory and a platform layer**: game state in native
structs and pointers, no 68000 CPU, registers, generated code or emulated work RAM, and
hardware (video, sound, input, saves) behind a small API. Behaviour stays provably equal to
the original by exporting native state to the 68000 RAM image the reference compares.

Checked by `uv run tools/phase.py 5` (writes `docs/progress/P5.md`). Requires phase 4 complete.

Note for P0: native code has no instruction timing, so P2 below should compare at phase 4's
**sync points** with its replay log (P4-decomp.md "Definitions"), not at hardware frame ends.
`phase.py`'s phase 5 still calls the frame-based comparison; switch it when P0 revises this file.

## Criteria

| ID | Criterion | Check |
|---|---|---|
| P0 | Criteria approved | this file has a line `approved: YYYY-MM-DD` (user's word only) and the capitalised draft marker is gone from the title |
| P1 | Native state | `xmen2check.py lint --native --json`: 0 emulated-RAM accesses in `game/` (all state in native structs/globals) |
| P2 | Equivalence through export | P2's K6 + K8 traces with `--mode native`: the state exporter (native state → 68000 work-RAM/VRAM/CRAM/VSRAM image) equals the reference every frame |
| P3 | No 68000 left | `xmen2check.py build --native --json`: the native target links without the 68K core, interpreter or any generated C (symbols checked in the link map) |
| P4 | Platform layer | 0 hardware addresses (`$C000xx` VDP, `$A1xxxx` I/O/Z80 bus, `$A14000`) in `game/`; all hardware through `platform/` |
| P5 | Renderer | the platform renderer's frames equal the engine's VDP output on the TAS (framebuffer CRC per frame, same backend) |
| P6 | Release | packaged Windows build (no ROM-derived data shipped unless the user decides how assets are extracted at install time); `docs/USER_VERIFIED.md` has `port-verified: YYYY-MM-DD` on the user's word |

Sound: the Z80 sound driver and FM/PSG synthesis may stay emulated behind the platform
layer (the music is data for that driver). Widescreen/high-resolution are enhancements
after P6, not part of the definition.
