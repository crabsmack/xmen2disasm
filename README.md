# xmen2disasm

A byte-matching disassembly of **X-Men 2: Clone Wars** (Sega Genesis / Mega Drive, 1995,
USA/Europe), and the hub of a project that took it from a ROM to a native PC port with
widescreen, high frame rates and rollback netplay for up to four players:
**[xmen2-pc](https://github.com/crabsmack/xmen2-pc)**.

Almost all of it was written by AI coding agents (Claude Code), in nine days
(2026-10-14 to 10-23), mostly unattended, under one hard rule: **the tree always rebuilds
byte-identical to the cartridge**. Every phase has a measured definition of done and a
checker. The agents queued the decisions that needed a human, and a human played each
milestone before it counted.

**Bring your own ROM.** This repository contains no game data. Place your dump at
`xmen2.bin` (SHA-1 `61409e6cf6065ab67d8952b891d8edcf47777193`, No-Intro
"X-Men 2 - Clone Wars (USA, Europe)"). See [NOTICE.md](NOTICE.md).

## The phases

| | Phase | Result |
|---|---|---|
| 1 | Disassembly | Every function (3,621) found, named and documented. Rebuilds byte-identical, cross-checked against an instrumented emulator replaying a TAS and a test corpus |
| 2 | Static recompilation | The game recompiled to C on [segagenesisrecomp](https://github.com/mstan/segagenesisrecomp), frame-identical to the reference emulator on every TAS and corpus frame |
| 3 | The compiler | Identified as Apple MPW C 3.3 (`-mbg off -b`), so C can be proven byte-identical to the ROM ([docs/COMPILER.md](docs/COMPILER.md)) |
| 4 | Decompilation | Hand-written, readable C for all 3,621 functions, each one verified (MPW byte match or differential test); the game links no generated code and equals the reference on the whole corpus |
| 5 | PC port | No 68000 left: native memory layout, host byte order, still equal to the reference on every TAS framebuffer. ROM-free Windows and Linux packages |
| 6 | Enhancements | Two players at the full 60 fps (the original halves it), interpolated high frame rates, 16:9 widescreen, each an option off by default |
| 7 | Multiplayer | Savestates, rollback netplay (LAN, relay, NAT traversal), three and four players with a second sound machine for their music parts (being finished) |

`uv run tools/phase.py status` shows each phase. The criteria, rulings and evidence are in
[docs/ROADMAP.md](docs/ROADMAP.md) and [docs/phases/](docs/phases/).

## How it was built

- **The gate.** `tools/build.py` is the only build path and exits 0 only on a SHA-1 match.
  A `PreToolUse` hook blocks ROM and hash edits, direct assembler use and re-splits, and
  refuses any `git commit` whose tree isn't byte-identical.
- **Runtime truth.** An instrumented emulator (below) logs every executed instruction, every
  ROM byte read as data and every DMA source, so a name or a code/data split is backed by
  what the game does, not by a guess.
- **Measured criteria.** Each phase has its own definition of done and a checker. A criterion
  changes only with the user's approval, recorded in the phase doc. Criteria that need a
  person (playing a build, approving a ruling) are written only on the user's word.
- **Agent instructions.** [CLAUDE.md](CLAUDE.md) holds the rules, facts and the autonomous and
  parallel protocols. `.claude/skills/` holds one skill per kind of work (naming a function,
  writing one as C, porting a batch, debugging a first divergence).
  [docs/QUESTIONS.md](docs/QUESTIONS.md) is the queue of questions the agents left for the
  user, with the answers. [docs/LESSONS.md](docs/LESSONS.md) is the measured retrospective.

## Setup

Windows with Visual Studio 2022 (C++ workload) and [uv](https://docs.astral.sh/uv/); for
the decompiler view, Ghidra 12 + JDK 21 (`GHIDRA_INSTALL_DIR`).

```
uv run tools/setup.py      # ROM check, emulator cores, build, TAS replay, Ghidra project
uv run tools/build.py      # rebuild and verify the SHA-1
uv run tools/progress.py   # phase 1's criteria (docs/DONE.md)
```

## What's here

- **Disassembly** (`xmen2.asm`, `src/`): AS syntax, one file per function named by start
  address, data the game reads labelled by kind (`Str_`, `Tbl_`, `Art_`, `Pal_`...), raw
  ROM bytes as `incrom` spans read from your ROM at build time.
- **Emulator harness** (`emu/`): BizHawk 2.4's Genesis Plus GX core built as a native DLL.
  The [TASVideos movie 4473M](https://tasvideos.org/4473M) recorded on it syncs through the
  final boss. A headless Python host replays it at ~1,200 fps, logging every executed
  instruction, ROM data read and DMA source, plus per-frame RAM and framebuffer CRCs,
  screenshots and RAM snapshots. A standard corpus (the TAS, 62 seeded fuzz sessions,
  hand-written scenarios for every character, two players, menus and game over) is the
  coverage ground truth.
- **Runtime/static cross-check** (`tools/coverage.py`): executed code missing from the
  disassembly, instructions contradicted at runtime, code bytes read as data, and data the
  game reads that isn't labelled yet.
- **Decompiler view** (`tools/decomp.py`): Ghidra pseudo-C seeded only with verified
  functions and labels, A5 = `$200` so globals resolve to RAM.
- **Compiler match** (`tools/cc.py`): compiles C with MPW C 3.3 under an MPW emulator and
  compares it with the ROM function, byte for byte.

The C, the recompilation and the PC port live in
[xmen2-pc](https://github.com/crabsmack/xmen2-pc), which has this repo as a submodule.

## Credits

The Macro Assembler AS (Alfred Arnold et al.); Genesis Plus GX (Eke-Eke) and BizHawk's fork
(TASEmulators); TAS 4473M by Truncated & Sonikkustar; segagenesisrecomp (Matthew Stan);
capstone; Ghidra; mps (Elliot Nunn). Licenses: [NOTICE.md](NOTICE.md).

## License

MIT ([LICENSE](LICENSE)) for the original work here. No rights in the original game are
claimed or granted ([NOTICE.md](NOTICE.md)).
