# CLAUDE.md — xmen2disasm

Byte-matching disassembly of **X-Men 2: Clone Wars** (Sega Genesis, USA/Europe,
SHA-1 `61409e6cf6065ab67d8952b891d8edcf47777193`), built with The Macro Assembler
AS (Sonic Retro's toolchain). This repo is the hub of a five-phase project toward a PC
port: [docs/ROADMAP.md](docs/ROADMAP.md) has the phases, their order, where each one's
work lives, and the decisions on record. Every phase has a measured definition of done
and a checker: phase 1 `uv run tools/progress.py` ([docs/DONE.md](docs/DONE.md)),
phases 2-5 `uv run tools/phase.py N` ([docs/phases/](docs/phases/)).

**Status (2026-10-15): phase 1 complete, 16/16 criteria pass. Phase 3 complete (5/5): the
compiler is Apple MPW C 3.3, `-mbg off -b` ([docs/COMPILER.md](docs/COMPILER.md);
`uv run tools/cc.py --match FILE.c` checks C against the ROM).** Phase 2 complete (10/10):
the recomp in `..\XMen2Recomp` equals the reference on every TAS and corpus frame and the
user verified the Release build (2026-10-15). Phase 4 (2026-10-17): 8/9, every one of the 3,621
functions is hand-written C and verified (D4), the game links no generated code and equals it
on the whole corpus (D6); only D8 is left, the user playing the hand-C build
([docs/phases/P4-decomp.md](docs/phases/P4-decomp.md), decisions 1-13). 5 is a draft.
`uv run tools/phase.py status` shows every phase.

**Start of every session:** `uv run tools/setup.py` (idempotent: ROM, emulator,
build, runs, Ghidra), then read `docs/ROADMAP.md`, the current phase's criteria doc and
progress (`docs/PROGRESS.md` / `docs/progress/PN.md`), and the relevant parts of
`docs/NOTES.md`. **At a phase kickoff (P0) or before a parallel round, also read
[docs/LESSONS.md](docs/LESSONS.md)**: the measured retrospective of phases 0-4 and the
kickoff checklist (harness speed gates, day-one debug features, criteria and worker setup).

## The one rule

**The tree must always rebuild byte-identical.** `uv run tools/build.py` is the
ONLY build path; exit 0 means SHA-1 match. Never run `asw`/`p2bin` directly,
never edit `xmen2.bin`, never change the expected hash. A change that doesn't
build byte-identical is not done: fix it or revert it. Hooks enforce this,
including a build gate on `git commit`.

The ROM is copyrighted: `xmen2.bin` is gitignored and must never be committed,
pasted, or uploaded. The user supplies their own dump.

## Layout

| Path | What |
|---|---|
| `xmen2.asm` | Main file: preamble, then address-ordered `include`s and `incrom` spans |
| `src/header.asm` / `src/jumptable.asm` | Vectors + ROM header + `$200` params / the 2,631-entry A5 jump table |
| `src/f/XXXXXX.asm` | One file per function, named by START ADDRESS (stable across renames) |
| `src/ram.asm` | A5-world global names (`g_Name = -$XXXX ; $FFxxxx: what`) |
| `config/seeds.txt` | Extra verified code entry points + evidence |
| `emu/` | Emulator harness: cores, `xmen2emu.py`, `corpus.py`, TAS + scenarios, committed coverage |
| `docs/` | DONE (criteria), PROGRESS (generated), NOTES (shared findings), reviews/, RECOMP_HANDOFF |

`incrom $START,$LEN` = bytes copied straight from the original ROM, the honest
marker for "not yet understood". A `Name:` line right before an `incrom` makes it
labelled data.

## Tools (all `uv run tools/<x>.py`)

| Command | Use |
|---|---|
| `build.py` | Build + verify + progress summary |
| `progress.py` | Every definition-of-done criterion, PASS/FAIL; writes docs/PROGRESS.md |
| `xref.py NAME` / `xref.py --todo` | Callers, callees, globals, data, **runtime info + screenshot**; naming queue |
| `decomp.py decomp NAME...` | Ghidra pseudo-C (A5 globals resolved to RAM, jump-table calls named). `decomp.py sync` after renames |
| `peek.py ADDR` | Raw capstone disassembly at any address + which file holds it |
| `rename.py OLD NEW ...` / `rename.py --global -0x38A6 g_Name "comment"` | Rename labels / name an A5 global everywhere |
| `header.py Name "purpose" --in .. --out .. --evidence ..` / `--batch f.jsonl` | Write the documented function header (N2) |
| `label_data.py START LEN Name "format + evidence"` / `--batch FILE` | Name a raw data span; numeric refs become the label |
| `datamap.py [--at ADDR \| --reader Func]` | Who reads each unlabelled data span at runtime (reader logs), plus jt/code refs |
| `label_strings.py --refs [--read]` | Label C strings (`Str_`) at referenced / runtime-read raw addresses |
| `switches.py [--convert-cases]` | MPW switch tables -> symbolic `Sw_` `dc.w` tables; converts unreached case code |
| `symbolize.py` | Numeric operands into code or labelled data -> labels (S3; also repairs merges) |
| `dataitems.py [--at ADDR]` | Unlabelled raw ROM split into data items (at jt/operand targets) with readers, DMA destinations, jt users |
| `autolabel.py [--static] [--dry-run]` | Label data items from that evidence (read items; `--static`: never-read items from how code uses their jt slot) |
| `sublabel.py ADDR Name "comment"` | Label a piece inside an already-labelled blob (code then refers to it by name, not Parent+$off) |
| `extend_thunks.py [--labelled]` | Append the still-raw `jmp d(a5)` steps of AI scripts (count word + thunk table) |
| `unknowns.py` | Regenerate the NOTES "Unknown (S5)" list from the coverage report |
| `fix_stale.py` | Replace sub_/loc_ names that no longer exist (after rebasing over others' renames) |
| `coverage.py [--list N] [--convert]` | Runtime truth vs. disassembly; `--convert` turns runtime-proven code into source |
| `convert.py ADDR... --evidence "..."` | Raw bytes -> verified code from evidence (also batch: `--entries-file`) |
| `candidates.py` | Unverified jump-table entries that trace cleanly as code |
| `handoff.py` | Export build/recomp/ for phase 2 |
| `decomp_queue.py [-n N] [--module M] [--stats]` | Phase 4: next functions to write as C (leaves first), how each must be verified, progress per module |
| `cc.py FILE.c` / `cc.py --match config/compiler/match/ADDR.c` | Compile C with MPW C 3.3 (headless, under mps) / prove it byte-identical to the ROM function |
| `cc_libmatch.py [--scan ID]` / `mpwobj.py FILE.o` | Library fingerprint per candidate toolchain / dump an MPW object file |
| `explore.py` / `split.py --force` | Initial discovery/split. **Never re-split** a tree with hand edits (hook-blocked) |

Mutating tools rebuild and roll back on failure. A refusal or rollback means the
hypothesis was wrong, not that the tool is broken.

## Emulator (runtime evidence)

`emu/xmen2emu.py` runs BizHawk 2.4's Genesis Plus GX (the core the TASVideos movie
was recorded on, so the TAS syncs to the final boss) headless at ~1,200 fps, logging
every executed instruction, every ROM byte read as data, and DMA sources.

```
uv run emu/xmen2emu.py shot --from-frame 12000 --out x.png     # what's on screen at a frame (+ registers)
uv run emu/xmen2emu.py script emu/corpus/scenarios/foo.txt --name scenario-foo
uv run emu/corpus.py                                            # (re)run the standard corpus
```
- Screenshots are evidence: `xref.py` shows the TAS frame where a function first runs
  and the nearest PNG. Read it to see what the game is doing then.
- RAM snapshots every 60 TAS frames: `emu/runs/tas/ram/` (68000 byte order).
- New input paths (menus, a character, 2-player, game over) = a scenario file in
  `emu/corpus/scenarios/` (format in `emu/corpus.py`; a first line `@tas N` starts from
  TAS frame N), then `uv run emu/corpus.py` and `uv run tools/coverage.py --convert`.
  Commit the scenario and the new `emu/coverage/*.gz`.
- Every run also writes `emu/coverage/<run>.readers.txt.gz`: for each ROM data span read
  (or DMA'd), the functions/PCs that read it first. `tools/datamap.py` turns these into
  per-span evidence for naming data. Needs a core built after this change
  (`uv run emu/build_core.py biz`); older cores just skip the file.

## What we know about the binary

Full, current list: `docs/NOTES.md`. The essentials:
- **C/C++ from a classic Macintosh compiler.** `link.w a6,#N ... unlk a6 / rts` frames,
  args at `8(a6)`, `$C(a6)`... (pushed right-to-left, caller pops), result in d0,
  d3-d7/a2-a4 callee-saved.
- **A5 = $000200, constant.** `-d(a5)` is a RAM global at `($200-d) & $FFFFFF`
  (`-$38A6(a5)` = `$FFC95A`). `+d(a5)` with `d = $22+8i` is jump-table entry i;
  `jsr d(a5)` comments show the target, and `pea d(a5)` passes a function pointer.
- ~1,000 jump-table entries point at DATA (or `jmp` thunk tables). Never assume a
  jt target is a function.
- Virtual calls: `movea.l (a4),a0 / movea.l $72(a0),a1 / jsr (a1)` (vtable at object offset 0).
- 25 instructions are `dc.w ... ; insn: <text>` because AS can't encode them identically.
  They count as code. Leave them.

Hardware: VDP data/control `$C00000/$C00004`, Z80 bus `$A11100`, reset `$A11200`,
I/O `$A10000-$A1001F`, TMSS `$A14000`, work RAM `$FF0000-$FFFFFF`.

## Naming conventions

- Functions `Module_Verb` (`Title_Init`, `VDP_SetReg`); globals `g_Name`; data
  `Str_`/`Tbl_`/`Art_`/`Pal_`/`Map_`/`Snd_`/`Lvl_` prefixes; vtables `Tbl_<Class>_vtable`.
- Header for every function: `; Name - one-line purpose`, then In/Out/Evidence lines.
- Unsure after real effort: `unk_<Module>_XXXXXX` plus a header saying what is
  known (≤5% allowed). Never a confident-sounding guess: wrong names spread.

## Autonomous mode ("work through phase N until it's done")

**Phases 2-5**: loop until `uv run tools/phase.py N` exits 0, as in
[docs/ROADMAP.md](docs/ROADMAP.md) "Working a phase autonomously": first failing criterion
in table order, batches of ~5 items, notes + `phase.py N` + commit + push (every repo
touched) after each green batch. The phase's doc under `docs/phases/` says where its work
and notes live and what to do first; skill `/first-divergence` for trace mismatches
(K5/K6/K8, D1/D2/D6, P2); phase 4's per-function loop is `/decomp-function` with
`uv run tools/decomp_queue.py` as the queue. Criteria that need the user (K10, C4's `user_ack`, D0/P0 approvals,
P6, D8): never write those lines yourself, and **never stop to ask either**. The user starts
these runs and leaves, so queue the question in [docs/QUESTIONS.md](docs/QUESTIONS.md) with the
default you are taking, and keep working (ROADMAP.md step 4). Read QUESTIONS.md at session start. Never weaken a check in
`tools/phase.py` or a contract tool it calls; changing a criterion needs the user's
approval, recorded in the phase doc.

**Phase 1** (complete; for reference). Loop until `uv run tools/progress.py` exits 0:
1. `uv run tools/progress.py` and take the **first failing criterion**, in table
   order. Work it in batches of ~5 items (functions, spans, scenarios).
2. Use the matching skill: R2/S2/S3 → `/find-code`; N1/N2/N3 → `/disasm-function`;
   S4/S5 → `label_data.py` with the coverage report's spans; R4 → write scenario
   files (screenshots tell you if the inputs did what you meant); R5 → explain in
   NOTES; N4 → `/review-names`.
3. After each green batch: append findings to `docs/NOTES.md`, run `progress.py`
   (refreshes PROGRESS.md), commit, push. Done means pushed.
4. Stuck on an item after a real attempt: record what was tried in NOTES "Open
   questions", move to the next item, come back with more context later.
5. When progress.py is all PASS, run one more full review sample (`/review-names`)
   and stop. Report phase 1 complete and that phase 2 can start.

Never weaken a check in `progress.py`/`coverage.py`/`build.py` to make it pass.
Changing a criterion needs the user's approval.

## Parallel mode (orchestrator + workers)

- Up to 3-4 workers, each in its own git worktree (`uv run tools/setup.py` there),
  each owning a disjoint **address range** (e.g. 512 KB quarter of the ROM) for
  naming/labelling. One worker can own a criterion instead (e.g. R4 scenarios).
- Workers rebase on `origin/main` before every commit, push after each batch, and
  keep **global renames in their own small commits** (they touch callers in other
  ranges). If a rebase conflicts in a file outside your range, take theirs, re-run
  your tool command, and rebuild.
- Shared files (`xmen2.asm`, `src/jumptable.asm`, `src/ram.asm`, `docs/NOTES.md`)
  change line-by-line through the tools. Keep edits to them minimal and rebase often.
- Every worker appends to `docs/NOTES.md`. That's how they share understanding.
- The orchestrator runs `progress.py` between rounds, reassigns ranges and
  criteria, and launches the review agent (N4), which must not review its own names.

What phase 1 learned running ~16 agents this way (2026-10-14):
- **Rebuild after every rebase, before pushing.** A textually clean rebase can still leave
  stale `sub_/loc_` names that another worker renamed meanwhile (main was broken twice
  this way). `uv run tools/fix_stale.py` repairs them in code, comments and NOTES.
- Gate pushes on `grep -q "^OK: byte-identical"`, not on "OK or FAIL appears".
- The scratchpad directory is shared by all agents: prefix every temp file per worker.
- `docs/PROGRESS.md` is rewritten by every `progress.py` run: discard it before rebasing
  unless you mean to commit it. In a worktree without `emu/runs/tas` H2 fails locally;
  don't commit that table.
- Useful split: range workers for N1/N2 (about 2k tokens per function), then a dedicated
  globals worker (N3), data-label and header-audit workers once ranges finish, and
  reviewers last. Mass-generated headers (class-slot templates) and auto data labels were
  the weak spots reviews found; audit them by rule (empty overrides, sprite type byte,
  animation step counts) before reviewing.
