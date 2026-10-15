# xmen2disasm

A byte-matching disassembly of **X-Men 2: Clone Wars** (Sega Genesis / Mega Drive,
1995, USA/Europe), built to be worked on mostly by AI coding agents under a strict
"rebuild must be byte-identical" gate, with an instrumented emulator as runtime
ground truth.

**Bring your own ROM.** This repository contains no game data. Place your dump at
`xmen2.bin` (SHA-1 `61409e6cf6065ab67d8952b891d8edcf47777193`, No-Intro
"X-Men 2 - Clone Wars (USA, Europe)").

## Setup

Windows with Visual Studio 2022 (C++ workload), [uv](https://docs.astral.sh/uv/),
and for the decompiler view Ghidra 12 + JDK 21 (`GHIDRA_INSTALL_DIR`).

```
uv run tools/setup.py      # ROM check, emulator cores, build, TAS replay, Ghidra project
uv run tools/progress.py   # where the project stands against docs/DONE.md
```

## What's here

- **Disassembly** (`xmen2.asm`, `src/`): AS syntax, one file per function, raw ROM
  bytes as `incrom` spans until understood. `tools/build.py` is the only build path
  and verifies the SHA-1.
- **Emulator harness** (`emu/`): BizHawk 2.4's Genesis Plus GX fork built as a
  native DLL. The [TASVideos movie 4473M](https://tasvideos.org/4473M) recorded on it
  syncs through the final boss. A headless Python host replays it at ~1,200 fps,
  logging every executed instruction, ROM data read and DMA source, plus per-frame
  RAM and framebuffer CRCs, screenshots and RAM snapshots. A standard corpus (TAS,
  idle, 62 seeded fuzz sessions from points along the TAS, hand-written scenarios)
  is the coverage ground truth.
- **Runtime/static cross-check** (`tools/coverage.py`): executed code missing from
  the disassembly, instructions contradicted at runtime, code bytes read as data,
  and data the game reads that isn't labelled yet.
- **Decompiler view** (`tools/decomp.py`): Ghidra pseudo-C seeded only with our
  verified functions and labels, A5 = $200 so globals resolve to RAM.
- **Agent harness**: `CLAUDE.md` (rules, facts, autonomous and parallel protocols),
  skills (`/disasm-function`, `/find-code`, `/review-names`), and a `PreToolUse` hook
  that blocks ROM/hash edits, direct assembler use and re-splits, and refuses any
  `git commit` whose tree isn't byte-identical.

## Definition of done

[docs/DONE.md](docs/DONE.md) lists 16 measurable criteria: runtime coverage, static
completeness, naming and documentation, independent review, and recomp handoff.
`tools/progress.py` checks them and writes [docs/PROGRESS.md](docs/PROGRESS.md).
Findings shared between agents live in [docs/NOTES.md](docs/NOTES.md).

To run it autonomously, open Claude Code here and say *"work in autonomous mode until
progress.py passes"*. For parallel workers, see "Parallel mode" in `CLAUDE.md`.

## Roadmap

1. **Disassembly + naming** (now), until `progress.py` passes.
2. **Static recompilation** on [segagenesisrecomp](https://github.com/mstan/segagenesisrecomp),
   from `build/recomp/` and the emulator reference traces
   ([docs/RECOMP_HANDOFF.md](docs/RECOMP_HANDOFF.md)), with frame-by-frame RAM
   comparison against the emulator on the TAS inputs.
3. **C matching decomp** (optional): the game is C/C++ from a classic Mac compiler
   (MPW/Symantec era; [ksherlock/mpw](https://github.com/ksherlock/mpw) runs MPW tools).

## Credits

The Macro Assembler AS (GPL, `build_tools/AS.txt`); Genesis Plus GX (Eke-Eke) and
BizHawk's fork (TASEmulators); TAS by Truncated & Sonikkustar; capstone; Ghidra.
