# xmen2disasm

A byte-matching disassembly of **X-Men 2: Clone Wars** (Sega Genesis / Mega Drive,
1995, USA/Europe), built to be worked on mostly by AI coding agents under a strict
"rebuild must be byte-identical" gate.

**Bring your own ROM.** This repository contains no game data. Place your dump at
`xmen2.bin` (SHA-1 `61409e6cf6065ab67d8952b891d8edcf47777193`, No-Intro
"X-Men 2 - Clone Wars (USA, Europe)").

## Build

Requirements: Windows (Linux/macOS work with the Sonic Retro AS binaries for your
platform in `build_tools/`), [uv](https://docs.astral.sh/uv/).

```
uv run tools/build.py
```
```
OK: byte-identical, SHA-1 61409e6cf6065ab67d8952b891d8edcf47777193
   code_addrs: 136674 instruction starts -> build/xmen2.code_addrs.txt
   functions 3287 (named 1, 0.0%) | instructions 136674 | unexplored raw ROM 1655838 bytes (79.0%)
```

## How it was made

1. **Fingerprinting.** ~3,000 `LINK A6` / `UNLK A6` pairs, A5-relative globals
   and an A5 jump table mean the game was written in C/C++ with a classic
   Macintosh compiler (MPW/Symantec era), not hand-written assembly like most
   Genesis games.
2. **Discovery** (`tools/explore.py`): conservative recursive descent from the
   vectors, the 2,631-entry jump table at `$220` (only targets that start with
   `LINK A6`; ~1,000 entries point at data) and `LINK A6` prologues that follow an
   `RTS`. Each seed is transactional: if anything reachable from it fails to
   decode, the whole seed is rejected. False positives would poison the later
   recompilation; misses can always be added back with evidence.
3. **Split** (`tools/split.py`): every instruction is formatted as AS syntax and
   verified by assembling it before it's written; the 25 that AS can't reproduce
   stay as `dc.w`. Undiscovered bytes are `incrom` spans copied from the ROM.
4. **Agent harness**: `CLAUDE.md`, skills in `.claude/skills/`, and a
   `PreToolUse` hook (`.claude/hooks/guard.py`) that blocks ROM/hash edits and
   direct assembler use, and refuses `git commit` unless the tree builds
   byte-identical. The mutating tools (`convert`, `rename`, `label_data`) rebuild
   and roll back on any mismatch.

This follows what works in the 2026 AI-assisted decomp projects (Snowboard Kids,
Melee, Klonoa): a single enforced build-and-verify path, hooks against
workarounds, a work queue ordered so names compound (`tools/xref.py --todo`), and
git worktrees for parallel agents.

## Working on it with Claude Code

Open Claude Code in this directory and ask, for example:

- "Work the naming queue: name the next 5 functions" (uses `/disasm-function`)
- "Find more code: go through the candidates and convert the real ones" (`/find-code`)
- "Identify the data around `$5C38` and label it"

For parallel runs, give each agent its own worktree and a disjoint address range
(for example one 64 KB bank each). The tools copy the ROM into new worktrees
automatically.

## Roadmap

1. **Disassembly** (now): name functions and globals, find remaining code
   (vtable methods, switch tables), identify data formats. Graphics compression
   is Burt Sloane's nibble Huffman, which
   [sega2asm](https://github.com/hansbonini/sega2asm) can decode (`huffsloane`).
2. **Static recompilation** on
   [segagenesisrecomp](https://github.com/mstan/segagenesisrecomp): a game repo
   that pins this disassembly, with `build/xmen2.code_addrs.txt` as its
   `code_addrs_file` oracle and the jump table plus `config/seeds.txt` as
   discovery seeds. That project learned from Rocket Knight Adventures that
   bringing up a game with no disassembly stalls because nothing is ground truth.
   This repo is that ground truth.
3. **C matching decomp** (optional): identify the exact compiler (MPW C / MPW
   C++ / Symantec C++; [ksherlock/mpw](https://github.com/ksherlock/mpw) runs MPW
   tools on modern hosts) and match functions against compiled output, using a
   per-function byte diff in place of objdiff (which has no 68000 support).

## Credits

The Macro Assembler AS (GPL, see `build_tools/AS.txt`), Flamewing/Clownacy builds
via Sonic Retro. Disassembly by capstone.
