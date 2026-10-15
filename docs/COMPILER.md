# Compiler identification (phase 3)

Criteria: [phases/P3-compiler.md](phases/P3-compiler.md). Machine-readable state:
`config/compiler/` (`candidates.toml`, `verdict.toml`, `match/*.c`). Check: `uv run tools/phase.py 3`.

## Result so far (2026-10-15)

**Apple MPW C, version 3.2 or later (3.2.4 / 3.3.x / 3.4d1), with MPW libraries of 1992-1994.**

- Library fingerprint (C2, `uv run tools/cc_libmatch.py`): the ROM contains exactly six MPW
  library modules, byte-identical with relocations masked (`cc_libmatch.py --scan mpw-c-3.3.3`):

  | ROM | Module (library) | Entry points used by game code |
  |---|---|---|
  | `$15C1F4` | `ULMULTS` (Runtime.o) | `ULMULT` = `Math_LMul` `$15C1FC` |
  | `$15C21A` | `LDIVTS` (Runtime.o) | `LDIVT` = `Math_LDivS` `$15C222` |
  | `$15C23E` | `LMODTS` (Runtime.o) | `LMODT` = `Math_LModS` `$15C246`, `_LMODT` = `Math_DivModS` `$15C25C` |
  | `$15C28E` | `ULMODTS` (Runtime.o) | `_ULMODT` = `Math_DivModU` `$15C2AC` (`ULMODT` `$15C296` unused) |
  | `$1F48AA` | `memcpy` (StdCLib.o) | `Mem_Copy` |
  | `$1F4900` | `memset` (StdCLib.o) | `Mem_Set` |

  Each Runtime.o module starts with an 8-byte stack-argument stub (`move.l 4(a7),d0 / move.l
  8(a7),d1`) before the register entry the C compiler calls; the stubs are why the `Math_*`
  routines start 8 bytes into each module. No MPW startup/runtime code (`%__MAIN`, `_DataInit`,
  `_RTInit`) is linked: the game boots with its own code and only pulls these six modules.
  Library versions: identical in MPW 3.2.3 (E.T.O. #13, 1993) through the July 1994 libraries;
  MPW 3.2 (1991) and 3.1 have different math/memcpy, 1995 (SC 8) and 1999 (MPW 3.5) libraries
  have different math. So the game was linked with MPW libraries of **1992-mid 1994**.
- THINK C 5, Symantec C++ 7 (THINK Project Manager) and CodeWarrior 7 libraries do not have
  these routines (CodeWarrior 7's hits are only in its "MPW ANSI" libraries: repackaged Apple
  MPW StdCLib/Runtime code, not Metrowerks').
- Code generation (C4): C for `BanimazaDoor_PushCallback` (`$039D24`) compiles to the ROM's
  exact 150 bytes with MPW C 3.2, 3.2.4, 3.3.2, 3.3.3 and 3.4d1 (`-mbg off`: no MacsBug names,
  which the game has none of). MPW C 3.1 (1990) and Symantec SC 6.0.1 / 7.0.3 / 8.0.1 / 8.8.4
  do not come close: SC passes `short` arguments in 2-byte slots and restores saved registers
  with `movem.l (a7)+`; the ROM (and MPW C) widen them to 4-byte slots (`cmp.w $A(a6)` for the
  first argument) and restore through the frame (`movem.l -$10(a6),...`).

## Tools

- `tools/mpwobj.py FILE.o`: reads MPW object files (modules, entry points, references).
- `tools/cc_libmatch.py [--json] [--scan ID]`: C2 fingerprint, candidate x routine.
- `tools/cc.py FILE.c` (compile + list), `--match match/<ADDR>.c`, `--match-all`, `--selftest`.
  Candidate and flags default to `verdict.toml`. Relocated bytes are checked by name, not
  masked: a reference to `g_Foo` must be `g_Foo`'s A5 offset in the ROM, a call to `Foo` must
  land on `Foo` (or on a jump-table entry for `Foo`, as the MPW linker rewrites inter-segment
  `jsr Foo(pc)` into `jsr d(a5)`). So match files use the disassembly's names.

## Toolchain setup (outside the repo)

Everything lives in `$XMEN2_TOOLCHAINS` (default `..\xmen2-toolchains`), with a
`SOURCES.md` saying where each folder came from. To rebuild it on a new machine:

1. `bin/mps.exe`: `go build` of https://github.com/elliotnunn/mps (an MPW emulator that runs
   MPW tools headless on Windows/Linux/macOS), then `MPW=<tc>/mpw-gm/MPW mps -install` (fetches
   and installs MPW 3.5 GM; the candidate compilers run inside this environment).
2. Candidate compilers: the E.T.O. CDs on archive.org (item `E.T.O.10Feb93.toast`; `.sit`
   unpacked with `unar`, the HFS image read with Python `machfs`), and discmaster.textfiles.com
   (DOOM II Mac source CD, ETO Development Tools 4). Each tool is unpacked into mps's File
   Exchange layout (`NAME`, `FINDER.DAT/NAME`, `RESOURCE.FRK/NAME`).

## Match files

`config/compiler/match/<ADDR>.c`: one function each, self-contained (structs declared with the
offsets the function uses). `uv run tools/cc.py --match-all`.

## Open questions

- Exact MPW C version among 3.2.4 / 3.3.2 / 3.3.3 / 3.4d1: needs a function the versions
  compile differently.
- The class descriptors (`tools/classes.py`): MPW C is a C compiler, so they are an in-house
  object system in C (or assembler), not a compiler object model; to confirm with a matched
  descriptor-using function.
