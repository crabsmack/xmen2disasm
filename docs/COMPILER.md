# Compiler identification (phase 3)

Criteria: [phases/P3-compiler.md](phases/P3-compiler.md). Machine-readable state:
`config/compiler/` (`candidates.toml`, `verdict.toml`, `match/*.c`). Check: `uv run tools/phase.py 3`.

## Verdict (2026-10-15)

**Apple MPW C 3.3 for the 68000, flags `-mbg off -b`, linked with Apple MPW libraries of
1993-94.** Proven by 24 functions (`config/compiler/match/`) that compile to the ROM's exact
bytes, references included: `uv run tools/cc.py --match-all`.

- MPW C 3.3.2 (E.T.O. #13, Dec 1993), 3.3.3 (E.T.O. #14/#15, 1994) and 3.4d1 (prerelease, 1994)
  generate identical code for all 24 functions and for ~100 constructs in three stress files;
  `verdict.toml` names 3.3.3, the released version current when the game was written, and
  lists the other two as `equivalent`. Nothing in the ROM can tell them apart.
- Ruled out by a function that no source can match:
  - MPW C 3.2.4 (1993): `Player1_StartLife` (`$006242`) has `ext.w d0` after the `% 6`
    runtime call; only 3.3.2+ emit it.
  - MPW C 3.2 (1991): conditional expressions. The ROM materializes the condition and tests
    it (`scc d3 / neg.b d3 / beq`, 872 times); 3.2 branches on the compare, so
    `Spr_EndFrame`, `Debris_SetBounceLimit`, `Barbarian_TargetClose` don't match.
  - MPW C 3.1 (1990): a different code generator (sp-relative arguments).
  - Symantec SC 6.0.1 / 7.0.3 / 8.0.1 / 8.8.4 (the "Symantec C++ for MPW" compilers, and the
    code generator of THINK C / Symantec C++): `short` arguments in 2-byte slots and
    `movem.l (a7)+` restores. The ROM (like MPW C) widens arguments to 4-byte slots
    (`cmp.w $A(a6)` reads the first one) and restores through the frame (`movem.l -$10(a6)`).
- Flags: `-mbg off`: no MacsBug names after game functions (the two MPW library modules keep
  theirs, they were built with names on). `-b`: function addresses PC-relative (`lea f(pc)`)
  and string literals in the code; the linker turns inter-segment ones into jump-table
  accesses. No optimizer flags: `-opt nopeep` etc. change code the ROM has.

## Evidence

### Library fingerprint (C2, `uv run tools/cc_libmatch.py`)

The ROM contains exactly six MPW library modules, byte-identical with relocations masked
(`uv run tools/cc_libmatch.py --scan mpw-c-3.3.3`):

| ROM | Module (library) | Entry points used by game code |
|---|---|---|
| `$15C1F4` | `ULMULTS` (Runtime.o) | `ULMULT` = `Math_LMul` `$15C1FC` |
| `$15C21A` | `LDIVTS` (Runtime.o) | `LDIVT` = `Math_LDivS` `$15C222` |
| `$15C23E` | `LMODTS` (Runtime.o) | `LMODT` = `Math_LModS` `$15C246`, `_LMODT` = `Math_DivModS` `$15C25C` |
| `$15C28E` | `ULMODTS` (Runtime.o) | `_ULMODT` = `Math_DivModU` `$15C2AC` (`ULMODT` `$15C296` unused) |
| `$1F48AA` | `memcpy` (StdCLib.o) | `Mem_Copy` |
| `$1F4900` | `memset` (StdCLib.o) | `Mem_Set` |

Each Runtime.o module starts with an 8-byte stack-argument stub (`move.l 4(a7),d0 / move.l
8(a7),d1`) before the register entry the compiler calls, which is why the `Math_*` routines
start 8 bytes into each module. No MPW startup code (`%__MAIN`, `_DataInit`, `_RTInit`) is
linked: the game boots with its own code and only pulls in these six modules. These modules are
identical in the MPW libraries of E.T.O. #13 (Dec 1993) through July 1994; MPW 3.2 (1991) and
3.1 differ, and so do the 1995 (SC 8) and 1999 (MPW 3.5) math modules. THINK C 5, Symantec C++ 7
and CodeWarrior 7 don't have them (CodeWarrior 7's hits are only in its "MPW ANSI" libraries,
which are repackaged Apple code).

### How the original C was written (what the match files taught)

Rules that reproduce the ROM, useful for any phase-4 matching:

- **Types**: `int` is 32-bit; `short` and `char` arguments are widened and passed in 4-byte
  slots (first argument at `8(a6)`, a short one read at `$A(a6)`). `short` arithmetic is done in
  32 bits (`ext.l`, `add.l`) and truncated.
- **Registers**: locals and parameters used most get registers, d7/d6/... and a4/a3/...;
  ties go to the **later** declaration. Locals that get no register are laid out on the stack
  in declaration order, the first at the lowest address. `d3` is the compiler's scratch for
  materialized conditions (`!x`, `a && b`, `?:`), saved like a register variable.
- **Evaluation order shows**: `y < top + 128` and `top + 128 > y` compile differently (left
  operand first); `x--` as a statement loads the old value into d0, `--x` doesn't; `i++` in a
  `for` increment does (`move.w d7,d0 / addq.w #1,d7`).
- **Pointer arithmetic** `*(p + i)` compiles to `ext.l / add.l d0,d0 / add.l p,d0`, while
  `p[i]` uses an indexed mode: the source used both.
- **Deferred argument pops**: MPW C drops the final `addq.w #n,a7` before `unlk` unless a
  label follows the call. About half of the ROM's tail calls keep it, because the state change
  is a `do { ... } while (0)` macro (see below).
- **Function returns**: many state functions end with `return self->flags & 8;` (`moveq #8,d0 /
  and.w $4(a4),d0`), often on one path only (MPW C accepts the missing return).
- **Copies of stack variables** (probes on Tile_RunHooksAtPoints, 2026-10-16): a stack variable
  read in two consecutive statements gets a compiler temp (none for two reads in one comma
  expression). A variable keeps its temp for the rest of the function, and the temp has one
  place: a register, or the stack if any use is under register pressure. An if's then-arm hands
  its temps to the else-arm (even for another variable), but not to later statements. A temp in
  an extra `{ }` block goes to the stack when the enclosing block has a stack temp, in a new
  slot below the parent's. Tile_RunHooksAtPoints is the one function in the ROM where one stack
  temp holds copies of two variables (px in the h-flip arms, py in the v-flip arm). It matched
  on 2026-10-24: a dead `if (0) (void)(x1 + y1 + y2);` at the end of the v-flip arm keeps x1's
  register busy there, so that arm's copy of py has no free register and takes the existing
  stack temp; the other arm still gets d7.
- **Register allocation, measured** (Cerebro_PlayIntro, 2026-10-17; 7 probe files, a model that
  predicted the final compile): a local's priority is its reference count, a reference inside a
  loop counting 8 (assigning a constant doesn't count; a `for` counter gets a small extra, ~3-14).
  Every `register` local is placed before any plain local, whatever its count; plain locals still
  get a register when one is free. Ties go to the later declaration. Two variables share a
  register when their first-to-last-use spans don't overlap, and the register chosen is the free
  one whose previous occupant ended most recently and whose next starts soonest (not simply the
  first free). d3 holds no variable there: it is for `?:` conditions and loop bounds hoisted out
  of a loop, which MPW does only for `for` loops whose body makes no call (the ROM compares with
  the constant inside: write those as `while` / `do`).
- **Index copies** (AvalonB1_InitCamera, 2026-10-17): a bare short register index `a[i]` is copied
  with `move.l d7,d0` (11 ROM functions); `a[i + k]` with a constant k, even `a[0 * 16 + i]`, with
  `move.w`. The one `move.w` instance in the ROM indexes palette line 0 as `line * 16 + i`.
- **Adjacent clears merge** (AvalonB1_RunScene): consecutive `x[n] = 0; x[n + 1] = 0;` of short
  array elements become one `clr.l`, through volatile, separate blocks, comma expressions, chained
  assignments and casts. Only a basic-block boundary that emits no code stops it: `if (1) x = 0;`
  (the file's CLEAR_COUNTER macro), a `goto` to the next label, `for (;;) { ...; break; }`. The
  original probably cleared six separate globals; the ROM's ram_globals names only the array.
- **The last 13 C functions** (2026-10-24, XMen2Recomp: every function the original wrote in C
  now matches, 3,047 of 3,164 game/c files; the other 117 are hand-written 68000):
  - Tests and masks: `while ((x & 8) != 0)` / `== 0` on a word gives `moveq #0,d1 / move.w
    d0,d1 / tst.l d1`, a bare `while (x & 8)` doesn't (VDP_WaitVBlank). `const & expr` loads the
    expression first and emits `and.<sz> #imm,d0` (the `C03C` encodings); `expr & const` on a
    memory operand gives `moveq #c,d0 / and mem,d0` (Spr_SetFromDef). `(signed char)b & k` on a
    u8 field gives `moveq #k / and.b mem` (SiberiaB1_DebrisUpdate). Both `?:` constants need
    `(short)` for `move.w #imm`.
  - Returns: a char function ending `if (c) return 0; return 1;` gives `sCC d3 / neg / seq d0 /
    neg`; `return !c` adds `move.b d3,d0` (BigAcolyte_OutsideActiveWindow).
  - Globals: an array defined in the compile unit (an `#ifdef XMEN2_MPW` definition, as
    g_Timers) is kept in an address register and indexed `.w`; through a pointer local it is
    `.l` (Scene_Register). `*(T *)byte_array_global` keeps the loaded pointer in a3/a4 across
    stores to locals; a scalar global read as `*(T *)&long_global` is reloaded into a0 after
    each store, as the ROM does (SavageA4_CamUpdate; g_SceneVar3B20 is now `long`).
  - Comma expressions: `t = v, a = y - t, y = t;` stops copy propagation and the extra copy temp
    (Cam_ClampLookToPlayers); several reads of a global pointer in one comma expression keep it
    in a0, as separate statements it is promoted to a4 (SiberiaB1_StepWind).
  - Registers: drop `register` from competing variables and register parameters and let use
    counts decide (SavageA2_SetBlockTiles, ApocBomb_Draw). Register reuse follows the plain
    variables' timeline too, so a variable that must reuse a plain variable's register is plain
    and declared so it is placed after it. One branch keeping its temporaries in registers
    where the other keeps them on the stack points to the original reusing variables or
    declaring block locals in that branch (Cam_SpringAxis).
  - Dead uses: `if (0) (void)v;` (the ROM has 101 compiled-out blocks) adds v's reference weight,
    8 per reference inside a loop, and stretches its live span: it reorders registers
    (PlayerSelect_Run) or keeps one busy through an arm (Tile_RunHooksAtPoints, above).
  - Labels: an empty `do { } while (0);` after a `register` or `long` assignment gives `tst.l dN`
    plus the deferred argument pop, with no branch (SiberiaB1_StepWind).

### The object system is the game's own, not a compiler's

MPW C is a C compiler (no C++), so the class descriptors (`tools/classes.py`: `{word name
offset; parent; methods from +6}`) are an in-house object system. The match files show how it was
used from C:

- Objects start with a descriptor pointer; a virtual call is `(*self->cls->method[n])(self,
  ...)` (`movea.l (a4),a0 / movea.l $52(a0),a1 / jsr (a1)`).
- **Descriptors live in code segments and C names them as code**: `extern void
  Tbl_Boulder_vtable();`. Taking such a name gives its jump-table entry (`lea $D22(a5),a0`,
  emitted as `lea x(pc)` and turned into a jump-table access by the linker); the real address is
  the `jmp` target at entry+2. A macro `CLASS(x) (*(Class **)((char *)(x) + 2))` reproduces
  every use: parent calls are `CLASS(Tbl_Boulder_vtable)->parent->method[16](self)`. ROM data
  tables passed to functions work the same way (`CODEPTR(Pal_CloneA1Cycle)`, `$077422`).
- State changes are macros wrapped in `do { } while (0)`:
  `do { (o)->state = (f); (*(f))(o); } while (0)` (`$1F0280`: the method is loaded twice, as
  macro arguments are) and `do { (o)->timer = 0; (o)->state = (f); } while (0)` (`$0BDF9C`,
  `$0ADE7A`: the loop label is where the pending argument pops get flushed).

## Phase 4 policy: `matching-for-unexecuted`

`verdict.toml`: `decomp_policy = "matching-for-unexecuted"`. Phase 4 replaces generated code
with hand-written C inside the recomp and verifies it by comparing frames with the emulator.
That only checks code the corpus runs. The ~22% of instructions it never executes
(`uv run tools/coverage.py`) can't be checked that way, but since the compiler is identified,
their hand-written C is verified by **compiling it with MPW C 3.3 and requiring the ROM's
exact bytes** (`tools/cc.py --match`). Executed functions only need frame-identical behaviour,
so they can be written for readability. `matching-all` would also work, but costs an exact
match for every function, including thousands the frame comparison already covers.
`functional` would leave unexecuted code unverified.

How phase 4 uses it: hand-written C for an unexecuted function goes, as one
self-contained function with the disassembly's names, into a file named after the function's
start address, and `uv run tools/cc.py --match FILE` (run in this repo; candidate and flags come
from `verdict.toml`) must exit 0. `--match` checks every byte and resolves every relocation to
the same name in the ROM (globals by A5 offset, calls and function addresses by target,
jump-table entries by target), so a match can't come from masking.

## Tools

- `tools/mpwobj.py FILE.o`: reads MPW object files (modules, entry points, references).
- `tools/cc_libmatch.py [--json] [--scan ID]`: C2 fingerprint, candidate x routine; `--scan`
  lists every library module of a candidate found in the ROM.
- `tools/cc.py FILE.c` (compile + list), `--match match/<ADDR>.c`, `--match-all`, `--selftest`;
  `--candidate ID --flags "..."` to try others. A match file may add per-file flags with
  `/* cc-flags: ... */` (none needs any). MPW library names (`memset`, `LDIVT`, ...) resolve to
  the disassembly's (`Mem_Set`, `Math_LDivS`, ...).

## Toolchain setup (outside the repo)

Everything lives in `$XMEN2_TOOLCHAINS` (default `xmen2-toolchains` next to the main checkout; its `SOURCES.md`
says where each folder came from). Never commit any of it. To rebuild it on a new machine:

1. `bin/mps.exe`: `go build` of https://github.com/elliotnunn/mps, Elliot Nunn's MPW emulator.
   It runs MPW tools headless on Windows/Linux/macOS. Then run `MPW=<tc>/mpw-gm/MPW mps
   -install` to fetch and install MPW 3.5 GM; candidate compilers run inside this environment,
   passed by path.
2. The verdict compiler, MPW C 3.3.3: archive.org item `E.T.O.10Feb93.toast`, file
   `E.T.O. #14 Apr 94.toast.sit`. Unpack it with `unar` (in WSL), read the HFS image with Python
   `machfs`, then unpack `/Tools - Objects/MPW/Latest MPW/MPW/Tools/C` into mps's File Exchange
   layout: `Tools/C` (data fork), `Tools/FINDER.DAT/C` (type+creator), `Tools/RESOURCE.FRK/C`
   (resource fork). Put its `Libraries/` (MacBinary) under `raw/Libraries/` for `cc_libmatch.py`.
3. The other candidates (only C1/C2 need them): see `candidates.toml` `source` and `SOURCES.md`.

## Match files

| File | Function | Shows |
|---|---|---|
| `006242.c` | Player1_StartLife | switch, `% 6` (3.3 vs 3.2.4), jt calls, `--g` |
| `022AF6.c` | AvalonA2_PlacePlayers | jt call with 4 args, deferred pop |
| `026F2E.c` / `094834.c` | RetractFloor_StateKill / EvilMaker_ActKill | virtual call, no final pop |
| `02D720.c` | Exodus_StateWaitBlastsGone | state change, return on one path |
| `035872.c` | AvalonA4_ClearCameraZone | switch, `!x` in d3, virtual call through a global |
| `039D24.c` | BanimazaDoor_PushCallback | 4-byte argument slots, register order |
| `03ABCE.c` | RollingDiscs_ReverseAtY | record walk, operand order |
| `05A8F8.c` | Seq_NextWrap | `*(p + i)` addressing |
| `05BB86.c` / `119E20.c` / `1B9FE8.c` | Boulder_Deactivate / SyncActor_MemberInWindow / Psylocke_AfterState | parent-class calls through `CLASS()` |
| `05C1B2.c` | Tusk_PlayerOnPlatform | `return a && b` as char |
| `05C204.c` | Tusk_UnlockArena | array global with offset (`g_SegTypeHooks+$50`) |
| `077422.c` | CloneA1_CyclePalettes | ROM data through `CODEPTR()` |
| `0ADE7A.c` / `0BDF9C.c` | TrapDoor_StateClosed / Barbarian_StateLeap | `SET_STATE` do/while macro |
| `0BD75C.c` / `13F498.c` / `1FA9D2.c` | Barbarian_TargetClose / Debris_SetBounceLimit / Spr_EndFrame | `?:` (3.2.4+ lowering) |
| `11F1A6.c` | BioBalls_AllocBallList | string literal in code, `memset`, `LDIVT`, loop |
| `13486A.c` | FlyBrood_MoveSine | stack locals, register ties, do/while loop |
| `136D86.c` | Hornet_StatePickPattern | switch with default first, function addresses |
| `1F0280.c` | XPlayer_AirSpecialUp | `GOTO_STATE` do/while macro |

## Open questions

- `XClone_ActWait30` (`$096718`): `self->state = <script step pointer>` builds its address in
  an address register (`movea.l $98(a4),a0 / addq.l #2,a0 / ... add.l a0,d0`). Three phrasings
  tried (struct index, `char *` math, `long *` index) leave the base in a data register; the
  exact pointer types are still unknown. Draft not committed.
