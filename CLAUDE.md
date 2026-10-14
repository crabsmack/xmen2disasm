# CLAUDE.md — xmen2disasm

Byte-matching disassembly of **X-Men 2: Clone Wars** (Sega Genesis, USA/Europe,
SHA-1 `61409e6cf6065ab67d8952b891d8edcf47777193`), built with The Macro Assembler
AS — the same toolchain as Sonic Retro's s1disasm/s2disasm. Phase 1 of a
two-phase plan: this disassembly is the ground truth for a later static
recompilation on [segagenesisrecomp](https://github.com/mstan/segagenesisrecomp)
(`build/xmen2.code_addrs.txt` is its `code_addrs_file` oracle), and for an
optional later C matching decomp.

## The one rule

**The tree must always rebuild byte-identical.** `uv run tools/build.py` is the
ONLY build path; exit 0 means SHA-1 match. Never run `asw`/`p2bin` directly,
never edit `xmen2.bin`, never change the expected hash. A change that doesn't
build byte-identical is not done — fix it or revert it. Hooks enforce this,
including a build gate on `git commit`.

The ROM is copyrighted: `xmen2.bin` is gitignored and must never be committed,
pasted, or uploaded. The user supplies their own dump.

## Layout

| Path | What |
|---|---|
| `xmen2.asm` | Main file: preamble, then address-ordered `include`s and `incrom` spans |
| `src/header.asm` | Vector table, ROM header, `$200` A5 params / IRQ hook pointers |
| `src/jumptable.asm` | 2,631-entry A5 jump table (`jtentry target`) |
| `src/f/XXXXXX.asm` | One file per function, named by START ADDRESS (stable across renames) |
| `src/ram.asm` | A5-world global names (`g_Name = -$XXXX`) |
| `src/macros.asm` | `incrom` (raw ROM bytes not yet understood), `jtentry` |
| `config/seeds.txt` | Extra verified code entry points + evidence (convert.py appends) |
| `tools/` | See below. Run everything with `uv run tools/<x>.py` |

`incrom $START,$LEN` = bytes copied straight from the original ROM: the honest
marker for "not yet understood". ~79% of the ROM is still incrom; most of that is
graphics, level and sound data, not code.

## Tools

| Command | Use |
|---|---|
| `uv run tools/build.py` | Build + verify + progress summary |
| `uv run tools/rename.py OLD NEW [OLD NEW...]` | Rename labels everywhere (rolls back on mismatch) |
| `uv run tools/rename.py --global -0x38A6 g_Name "comment"` | Name an A5 global; rewrites `-$38A6(a5)` operands |
| `uv run tools/label_data.py START LEN Name "comment"` | Name a raw data span; swaps numeric refs for the label |
| `uv run tools/candidates.py` | Unverified jump-table entries that trace cleanly as code |
| `uv run tools/convert.py ADDR... --evidence "..."` | Raw bytes -> verified code from evidence |
| `uv run tools/explore.py` / `split.py --force` | Initial discovery/split. **Never re-split** a tree with hand edits |

Every mutating tool runs the build and rolls back on failure, so a refused or
rolled-back command means your hypothesis was wrong, not that the tool is broken.

## What we know about the binary (verify, extend, correct)

- **Written in C/C++ with a classic Macintosh compiler** (MPW C/C++ or Symantec;
  exact compiler TBD). ~3,000 functions use `link.w a6,#N ... unlk a6 / rts`.
  Arguments at `8(a6)`, `$C(a6)`, ... (pushed right-to-left, caller pops with
  `addq`/`lea`). Return value in `d0`. Scratch: d0-d2/a0-a1; d3-d7/a2-a4 are
  callee-saved (`movem.l ...,-(a7)` / restored via `-N(a6)`).
- **A5 world** (Mac application model): A5 points into RAM.
  - Negative offsets `-$XXXX(a5)` = **globals** -> name them with `rename.py --global`.
  - Positive offsets `$22 + 8*i` = **jump table** entry i. `jsr d(a5)` calls
    entry `(d-$22)/8`; the generated comment shows `; -> target`.
    `pea d(a5)` with such an offset passes a **function pointer**.
  - The ROM copy of the table is at `$220` (`src/jumptable.asm`). ~1,000 entries
    point at DATA, not code — never assume a jt target is a function.
- **Objects with vtables**: `movea.l (a4),a0 / movea.l $72(a0),a1 / jsr (a1)` =
  virtual call, vtable pointer at object offset 0. Methods reached only this way
  were found by the LINK-after-RTS heuristic; more may exist in incrom spans.
- **String literals live inline after functions** (e.g. `Str_SiberiaB1Blizzard`),
  and `sub_1F9464(name, callback)` appears to register named resources/handlers.
- Boot code (`EntryPoint`, `$1F43AE`) is Sega's standard ICD_BLK4 init. IRQ
  vectors are stubs that call through the pointers at `$210/$214/$218`.
- 25 instructions are kept as `dc.w` because AS can't reproduce their encoding
  (e.g. `move.b #$FF` stored with a `$FFFF` immediate word). Leave them.

Hardware reference: VDP data/control `$C00000/$C00004`, Z80 bus `$A11100`,
reset `$A11200`, I/O `$A10000-$A1001F`, TMSS `$A14000`, work RAM `$FF0000-$FFFFFF`.

## Workflows (see .claude/skills/)

1. **Name a function** (`/disasm-function`): the main loop. Read the code and its
   callers, work out what it does, rename it plus its locals/globals, and write a
   header comment with the evidence. Prefer leaf functions and the most-called
   helpers first: names propagate understanding to every caller.
2. **Find more code** (`/find-code`): unverified jt entries, vtable slots and
   switch tables -> `convert.py` with evidence.
3. **Identify data**: strings, tables, graphics. Name them with `label_data.py`
   and record the format in the comment.

### Naming conventions
- Functions `Module_Verb` (`Title_Init`, `VDP_SetReg`); globals `g_Name`;
  data `Str_`/`Tbl_`/`Art_`/`Pal_`/`Map_` prefixes.
- Keep auto names (`sub_/loc_XXXXXX`) when unsure. A wrong name is worse than
  none. If a name is a guess, put `confidence: low` in the header comment.
- Every renamed function gets a header comment: what it does, args, return,
  evidence (callers, constants, hardware ports touched).

## Working style

- Small, verified steps; commit after each green batch (the hook runs the build
  first). Push after each batch so progress survives session limits.
- Parallel agents: one git worktree each, claim disjoint address ranges
  (e.g. by 64 KB bank), rebase before committing. Global renames touch many
  files: keep them in their own small commits.
- Don't re-litigate the toolchain: AS + per-function files is deliberate (it
  matches Sonic Retro's projects and feeds segagenesisrecomp's tooling).
