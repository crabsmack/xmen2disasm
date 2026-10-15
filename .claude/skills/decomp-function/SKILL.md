---
name: decomp-function
description: Write one X-Men 2 function as hand-written, readable C in XMen2Recomp and prove it equal to the original - pick from the phase-4 queue, draft from Ghidra and the disassembly, write against the shared headers, verify by MPW byte match or shadow differential test, lint, record. Use for phase 4 criterion D4 (and D3/D5 field naming) or any "decompile function X to C" task.
---

# Decompile a function (the phase-4 loop)

Goal per function: `../XMen2Recomp/game/c/<ADDR>.c` that a newcomer can read and that
is **verified** equal to the original. Criteria: `docs/phases/P4-decomp.md`. Design and
conventions: `XMen2Recomp/docs/NOTES.md` "Phase 4". Never edit generated C.

## 1. Pick

`uv run tools/decomp_queue.py -n 10` (or `--module Barbarian`). Coverage decides the proof:
- `never`: the corpus never runs it: it **must byte-match** MPW C 3.3.
- `partial` / `full`: a byte match, or the shadow test (`verify`). Try to match first: it is
  the strongest proof and usually close; fall back to verify for executed functions.
- **Fragments** (`xmen2_funcs.h` tag `fragment`: switch cases / blocks split off a C
  function): do not give them files. Write the parent with that code inline and put the
  fragment's name in a comment where its code is (`/* AvalonA4_ClearCameraZone_case3 */`).
  How fragments count in the ledger is an open question for the user.
- **asm** (tag `asm`, no MPW frame): can never match; executed ones go through verify.

## 2. Understand

```
uv run tools/xref.py NAME               # callers, callees, globals, runtime info
uv run tools/decomp.py decomp NAME      # Ghidra pseudo-C
uv run tools/peek.py ADDR               # raw disassembly
```
Read `src/f/<ADDR>.asm` (its header is the spec; "Out: d0 = ..." can be a side effect of the
last instruction, not a return value: `List_Unlink`) and NOTES for the subsystem.

## 3. Write

```c
/* Name - one line: what it does.
 *
 * arg:  meaning (from the asm header, corrected if you learned better).
 * What it returns, and anything surprising (bugs are kept). */
#include "xmen2.h"

short Name(Actor *self, short n)
{
	...
}
```
- One function per file, the disassembly's name, C89 (`/* */`, declarations first).
- Fix the function's prototype line in `game/include/xmen2_funcs.h` (keep the
  `/* $ADDR */` comment). Its parameter and return types are what the bridge uses.
- **Types for game memory** (`xmen2_mem.h`): `s8 u8 s16 u16 s32 u32` for anything stored in
  RAM/ROM (fields, globals, pointees); `PTR(T)` for a pointer stored in memory; `FNTYPE(Name,
  ret)` for a stored function pointer (old-style, any args); plain `short`/`long` for locals
  and value parameters. Pointers to game memory are plain `T *` (e.g. `s16 *p`).
- Fields by name: add/rename them in `xmen2_types.h` (class FIELDS macros: keep the `+$XX`
  comment, keep sizes; split an `unk_XX[n]` array around the field you name). Globals: retype
  in `xmen2_globals.h` (both the MPW `extern` and the PC `XM_G`/`XM_GA` line).
- ROM data: names from `xmen2_data.h` (code-named, `CODEPTR(x)` / `CLASS(x)` when the original
  went through the jump table). Strings: `STR(Str_X, "text")`. Hardware: `VDP_CTRL`,
  `VDP_DATA`, `IO_DATA1`... (`HW8/16/32(addr)` only inside xmen2_mem.h).
- Idioms (`xmen2_macros.h`): `IS_ALIVE(o)`, `ABS(v)`, `SET_STATE`, `GOTO_STATE`. Add a macro
  only when the original clearly used one (identical code at many sites).
- Keep the original behaviour exactly, bugs included, and read hardware in the original order.
- Never: `g_cpu`, registers, raw addresses, `(char *)p + N` offsets (lint fails them).

## 4. Verify

```
uv run tools/cc.py --match ../XMen2Recomp/game/c/<ADDR>.c     # byte match (this repo)
cd ../XMen2Recomp && uv run tools/pccheck.py game/c/<ADDR>.c  # compiles as C++ (PC)
```
Both are safe to run beside other work. **Do not** run `xmen2check.py build/trace/verify` when
other agents are working (one runner at a time; the orchestrator runs them per batch).

MPW C 3.3 matching, what reproduces the ROM (also COMPILER.md):
- **`register`** decides register choice: when the ROM's a3/a4 (d7/d6...) assignment is
  swapped, declare the variable the ROM keeps in the first register `register`.
- **a2 is never a variable register**: pointers get a4 then a3 only. A pointer parameter
  read from the stack each time while a3/a4 hold others is still a pointer (a `long` would
  have taken a free data register): use the register pattern to recover types.
- d3 is the compiler's scratch (conditions, hoisted loop bounds `moveq #30,d3`).
- No `return` where the original falls off the end (d0 then holds whatever the last
  instruction left; callers that read it rely on MPW's side effect, keep it implicit).
- `short` flags `& 0xC000 == 0x8000` compiles to the ROM's `ext.l / and.w / zero-extend /
  cmpi.l` exactly; `x & 8` on a short tests the word directly.
- A `do { } while (0)` macro around a state change explains a branch to the next statement.
- Stop after ~6 honest attempts on one function: if it is executed, keep the readable
  version for verify; if never executed, note what differs and move on.

### Learned in round 1 (BigBio, SavageBio, Brood, SmallBrood: 145 functions, all matched)

- Macros in `xmen2_macros.h`: `AI_NEXT_STEP` / `AI_FIRST_STEP` (AI script steps; read their
  comments: where a loop sits decides where MPW flushes argument pops), `SET_STATE_WAIT`,
  `STOP_MOVING(o)` (one `clr.l` for both speeds), `NO_RETURN_VALUE` / `RETURN_NO_VALUE` (a
  `short` state function that falls off the end on some paths). `FN_AT(type, p)` (mem.h) turns
  a ROM code address with no C function (an AI-script `jmp` thunk) into a stored pointer.
  A `void` function stored as a state: `SET_STATE(self, (StateFn)Fn)`.
- AI-script thunk tables (`<Class>_Script`, `_ScrStep*`, tagged fragment) are ROM data, not
  C: no file; name them in a comment of the C that uses them.
- MPW: a declaration initializer converts to the declared type (`.l` work, `move.l`), an
  assignment narrows (`.w` work, `?:` of constants typed by their range): pick the form the
  ROM shows. Variables whose lifetimes don't overlap share a register (block-locals and
  `register` order decide which). `if (!--x)` = `subq / bne` (no `tst`). Operand order shows:
  `self->x + (dx << 8)` vs `(dx << 8) + self->x`, `x < c` vs `c > x`, `field <= e` vs
  `e >= field`. `t = f(); g(t);` with `register t` = the ROM's "saved, unused register" (the
  nested `g(f())` pops first). `x + -0x700` = `add.l #-$700`. `(short)` constants in `?:` =
  `move.w` + `ext.l`. Two adjacent word clears merge into one `clr.l`.
- (round 2) A call followed only by `unlk` keeps its argument pop when the statement is in a
  `do { } while (0)` or a label follows (half the ClassInits). `if (t) { }` = a bare test.
  Prototyped arguments are not narrowed: `ext.l` at a push means the variable itself is short;
  a `long` passed to a `short` parameter is pushed as is. `pa->x + pb->y` (two memory words)
  loads the right operand first; `-` keeps source order. `x = y = F` stores the right-hand
  field first. Two pointer fields set to 0 = `moveq #0,d0` + two `move.l d0`.
- `if (c) return 1; return 0;` at a function's end = the ROM's `sCC/neg/subq/subx/addq/move.b`
  (`return c`, `!!c` don't match). Switch cases are emitted in source order; `lea x(a7)` right
  after a jump table means `default: break;` came first. `x & 0x8000` is unsigned short
  (constants are typed by range). A dead `tst.l reg` = an empty `if (x) { }`. An `s32 = 0`
  is `moveq/move.l`; `clr.l` means two adjacent word fields.
- `(x & 1) == 0` (and.w, zero-extend, tst.l) vs `!(x & 1)` (word test). In `cmp src,dst` the
  C left operand is the source. `register long dx, dy;` = dy d7, dx d6. A value computed and
  dropped = `(void)(expr);`. Dead locals kept spilled: mention them in a trailing `if (0) {}`.
  `for (i = 2; i >= 0; i--)` = `dbra`. `moveq #0; move.w` reads mean a u16 field.
- Keep original bugs; where C++ disagrees (shift by 32, ...) use `#ifdef XMEN2_MPW` with the
  PC branch computing what the 68000 did.
- Passing `&local` to a function that is still generated works (the bridge copies the local
  to the 68000 stack and back) for game-memory types only (`SprInst tmp;`, `s16 v;`), not
  host scalars.

## 5. Report

At the end of a batch list per function: matched / needs verify / not done (why), the fields
and globals you named, and any convention you had to invent. The orchestrator builds, runs
`verify` and D2, records findings in `XMen2Recomp/docs/NOTES.md` and commits.
