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
- An unmatched function counts as verified only when shadow tests have run **every**
  instruction of it (`uncovered` 0). For paths the corpus never takes, write synthetic cases:
  `XMen2Recomp/game/verify/<ADDR>.syn` (format in `game/runtime/verify.cpp` load_synth):
  ```
  # why these cases: which branch each one reaches
  case hflip
  b arg0+$2E = $10          # byte at (first argument, a pointer) + $2E
  w [arg0+$76]+6 = 0        # [X] = the long at X: here the length of the object's segment
  w $FFFA5A = $0003         # a global
  reg d1 = 5                # (asm register conventions)
  hw $0002 $0000            # hardware read values, in order (default 0)
  ```
  Each case mutates the state at the function's first corpus call (`at any` on a line of its
  own: at the first call of any function, for functions the corpus never runs), then runs
  both versions and compares. Keep the mutated state plausible (a case that couldn't happen
  in the game proves little).

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
- Argument pops: a function with any loop (even an empty `do { } while (0);`) keeps its last
  pop before `unlk`; a goto label right after a call keeps that call's pop without a loop's
  register effects; `if (0) {}` / `return;` don't flush. `switch (x) { }` = a lone dead read.
  `if (c) return 1; return 0;` returning short = `sCC/neg/sne/andi.w #1`. `>> n` (n >= 16) =
  `swap / ext.l / asr.w #n-16`. On PC, a value from `PTR(PTR(Actor))` goes through
  `(Actor *)` before a subclass cast.
- Keep original bugs; where C++ disagrees (shift by 32, ...) use `#ifdef XMEN2_MPW` with the
  PC branch computing what the 68000 did.
- Passing `&local` to a function that is still generated works (the bridge copies the local
  to the 68000 stack and back) for game-memory types (`SprInst tmp;`) and plain scalars
  (`char`/`short`/`long`, converted to the 68000's byte order), not through a `void *`
  parameter (size unknown). `Mem_Set`/`Mem_Copy`
  are C, so `Mem_Set(&local, 0, sizeof local)` is fine.

### Learned in round 3 (Tusk, EvilMaker, XClone: 147 functions, 146 matched)

- **Two register operands**: `A op B` is `cmp A,B` (computes B-A) with the condition
  flipped, so `cmp.w dX,dY` means dX was the C left operand (branches, `s<cc>`, the last term
  of an `||` chain). `a + b` with simple operands loads b and adds a; a complex right operand
  (`?:`, call) is evaluated first and a is added from memory. At `&` / `==` the left operand
  is evaluated first (`1L << bit & dist`, `myType == f(x)`).
- **Labels stop register sharing**: a loop written with a label/goto gives variables with
  disjoint lifetimes their own registers; a do/while lets them share. A label also ends a
  basic block (flushes pending argument pops).
- Dead code: a statement right after `return` is dropped; one after an if/else whose arms
  both return is still emitted.
- `if (x & 1) return 0; return 1;` = `seq d0 / andi.w #1,d0` (`return !(x & 1)` uses d3).
  `short n = c ? 2 : 1;` as an initializer has no `ext.w`; as an assignment it does.
- Scene variables (`g_SceneVarXXXX` reused per level): a file-local `#define` alias to a
  **typed** extern reloads like the ROM; `*(PTR(T) *)&g_SceneVar` gets cached in a3.
- A `long` passed to a `short` parameter: no `ext.l`. `x << 1` = `lsl.l #1`, `x * 2` = `add.l`.
  `return v;` adds no move when d0 already holds v. A char and a short sharing one register
  are two variables. `register` on a parameter or a pointer local fixes a3/a4 swaps
  (`register Tusk *p = self;`). Pointer locals that don't fit a3/a4 live on the stack, never
  a2. Two adjacent byte clears merge into `clr.w`. MPW does CSE and constant folding: write
  the plain expression, not the folded one.
- `MAX(a,b)` / `MIN(a,b)` (`a > b ? a : b`) are in `xmen2_macros.h`: the ROM's compare
  order shows the original used them.
- Where MPW leaves a value in a shared register that the C doesn't state (d0 by accident),
  the PC branch gets an `#ifndef XMEN2_MPW` line that computes it, with a comment.
- (Hologram) `if (1) { ... }` puts a label at its end: MPW pops pending call arguments there
  (`do { } while (0)` flushes at head and end, and weights register choice as a loop).
  Only `register` variables get first pick of registers; plain locals compete by use count.
  `long * 12` is a `mulu` sequence; the ROM's `(t<<3)+(t<<2)` comes from
  `(t = x, (t << 3) + (t << 2))`. Stack temporaries: sibling blocks overlay their slots, a
  nested block's locals sit below the enclosing ones, first-declared at the lowest address.
  `a + b | 0x800` stays `.l`; `(short)(a + b) | 0x800` gives `add.w`. An explicit `(short)` on
  an assignment to a short compiles the same as the implicit narrowing (silences MSVC C4244).
  `register short x = expr;` in a block = `.l` work then `ext.l` at the push. A caller testing
  the result with `tst.b d0` means the callee returns `char`. `FN_DATA(f)` passes a function's
  address as a `void *` argument.
- (MagnetoBoss, 56/56) Two calls in one expression (`Rand_Next() - Rand_Next()`): MPW
  evaluates left to right, C++ leaves it open: the PC branch (`#ifndef XMEN2_MPW`) calls them
  in separate statements in MPW's order. `field + field` on one struct was seen loading the
  left into d0, the right into d1, then `add.l d0,d1` (round 2 saw the right loaded first
  elsewhere): check the ROM, try both. `fx + (expr)` with a stack local = `add.l fx(a6),d0`;
  `(expr) + fx` = `move.l fx,d1 / add.l d0,d1`. A u8 compared with `-1` = `moveq #0 / move.b /
  cmpi.w #$FFFF` (`0xFFFF` gives `cmpi.l`). Block-local declarations per switch case
  (`case 2: { long t; ... }`) reproduce the ROM's register sharing between cases. A local
  stored but never read vanishes (store and slot); `if (0) p = pool;` brings both back. When
  the ROM doesn't pop before a state store, write `self->state = F; F(self);` instead of
  GOTO_STATE. An unread value the ROM keeps in a register = an unread short local. Adding or
  removing `register` on single variables fixes allocation far more often than reordering
  declarations.

### Learned in round 5 (BroodBoss, Apocalypse, XPlayer, Magneto: 254 functions, 252 matched)

- **Prologue order shows register params vs locals**: register parameters are loaded first
  (data before address registers), then register locals initialised in declaration order.
  A char parameter copied d7 -> d0 = a local `register char d = dir;`. `moveq #0 / move.b` on
  a char parameter = `unsigned char` (Mac Boolean).
- **Pops**: an assignment inside a condition (`if ((x = f()) != y)`) flushes the pending pop
  before the branch; `x = f(); if (x != y)` keeps it pending. When the ROM pops once at the
  end with no flush before a state change, write `if (1) { self->state = f; f(self); }` (a
  label only at its end) or start the do/while before the first call. A label after the last
  call (`end: ;`) keeps all pops in one final `lea`.
- `if (c) ; else { ... }` makes MPW reload a stack-held `self` at the start of the else.
- `(short)x` when passing a `register short x` copies it (`move.w d7,d1 / ext.l d1`); without
  the cast it is extended in place.
- Memory compares: the C left operand is loaded into d0, the right is the `cmp` source.
  Constants vs memory: MPW reverses the compare itself (`angle < 100` = `moveq / cmp.w /
  ble`): write it naturally.
- `short v = a - b` as an initializer is 32-bit (`ext.l / sub.l`); as an assignment 16-bit.
- `x &= ~m` on a global = `and.w d0,mem`; the ROM's load/and/store is `x = x & ~m`.
  `v <<= 8` = `lsl.w`; `v = v << 8` = `ext.l / lsl.l`. `g++` as a statement loads the old
  value; `++g` doesn't. `s * 224` is a `mulu` sequence: write the ROM's shifts.
- Locals on the stack: laid out from the frame top in reverse declaration order, chars packed
  bytewise; `if (0) unused = 0;` right after declarations both reserves a register and makes
  MPW forget register contents.
- A result tested with `tst.b` needs `(char)` on a method or `long` call. A state stored with
  another return type: `self->state = (StateFn)Fn; Fn(self);`. Subclass `self` to a parent's
  function: `(XPlayer *)self` (MPW Error 229 otherwise).
- Switch: comparisons sorted by value, bodies in source order; when the last case tested is
  the first body, the final compare is inverted to `bne default`.
- (round 6: BabyBio, FlyBrood, Beast, Wolverine, Gambit, Exodus, Nightcrawler, Cyclops) A loop
  testing at the top (`L: test; bcc out; body; bra L`) is `for (;;) { if (!(c)) break; ... }`;
  `while (c)` tests at the bottom. `x -= c` on a register short = `subi.w`, `x = x - c` goes
  through d0. `x = e; y = x - c;` reuses d0; `y = e - c` reloads e. `f &= ~1` on a long field
  = `bclr #0` on its low byte. A table switch starting at 0 whose entry 0 goes to the end:
  `default: case 0: break;`. A class calling its own method through its descriptor:
  `(*CLASS(Tbl_X_vtable)->method[n])(self)`. Callbacks passed as data (ObjList_ForEachAtPoint,
  `PTR(void)` hooks): `FN_DATA(f)`. To load a later parameter first in the prologue, make only
  it `register` and copy the earlier one into a register local.
- (round 7: Deathbird, Hornet, Seg, Cam) Declaring every data variable the ROM keeps in a
  register `register` fixes allocation where reordering doesn't; among `register` variables the
  ranking follows use count. MPW splits a variable's live range per branch (stack in one arm,
  register in the other). `*` loads its right operand first (`move.w slope,d0 / muls.w vx,d0`).
  A `long` function returning a `short` local = `move.w x,d5 / ext.l d5 / move.l d5,d0`.
  `g_A = (g_B = n) - 1;` vs two statements differ by a register copy. 8 case labels over a
  32-value range = compare chain, 13 = jump table: list the do-nothing labels the ROM's table
  implies. A parameter kept on the stack while registers are free had its address taken:
  `if (0) (void)&kind;`. A short-returning callee compared with `cmp.l` and no `ext.l` was
  called undeclared: `((long (*)())F)(args)` under XMEN2_MPW. `move.l X+2(a5)` = a code symbol
  declared as extern data (jump-table entry + 2; cc.py accepts it). Two `v >>= shift` in a row
  share one converted count: `ax >>= (long)shift; ay >>= shift;`. A file-local typed alias of
  a global (`#define g_Shake (*(PTR(s8) *)&g_CamShake)`) compiles to direct operations on it.
- A function that differs only by an A5 reference cc.py reports as `A5 -0x... -> jt None` uses
  a global the disassembly hasn't named: report the offset and what it holds; the
  orchestrator names it (`rename.py --global`) and it will match.
- A loop that waits for a flag only an interrupt handler sets (`tst.b g_FrameTick(a5) / beq.s *`,
  Level_FrameLoop and PlayerSelect_Run) is `while (!g_FrameTick) IRQ_WAIT();`: MPW compiles
  nothing for `IRQ_WAIT()`, and on PC the frame-synchronous runner takes the V-int there
  instead of spinning for ever.
- **PC traps**: a discarded hardware read must be assigned (`r = IO_DATA(1);`): `(void)VDP_CTRL;`
  reads nothing on PC. A null pointer the 68000 dereferences (reading ROM at low addresses)
  crashes the host: add an `#ifndef XMEN2_MPW` branch reading what the 68000 read (e.g.
  `(SprDef *)Vectors` for a missing sprite definition).

### Learned in round 8 (module groups 1-9: about 800 functions, all but ~20 matched)

- **Bit tests**: `if (x & 1)` on a word, as the whole condition, = `move.w / btst #0`; inside
  `&&`, or as `!(x & 1)`, it is `moveq #1 / and.w`: nest the ifs to get `btst`.
  `(x & 0x9CC0) != 0` = zero-extend + `tst.l`. `(unsigned short)Rand_Next() & 1` =
  `moveq / move.w / tst.l / btst`.
- **Masks, constants**: `x & ~0x1FF` (a signed constant) = `and.w`; `x & 0xFE00` widens to
  long. `0xFF & (a)` = `and.l #imm,d0` in place; `(a) & 0xFF` = `move.l #imm,d1 / and.l d0,d1`.
  `mem | c` = `move.w #c,dN / or.w mem,dN`; `c | mem` = load, `ori.w`. Folding follows the
  source's grouping: `c - 0x20 + K` is one `sub.w`, `c + K - 0x20` two. Zero offsets written
  out (`tile + 0`, `sx - 0`) still copy through d0: the sign of a macro with per-piece offsets.
- **?: and initializers**: a `?:` of constants that fit u8/u16 (`0x8000 : 0`) is zero-extended
  as an assignment (`moveq #0 / move.b`; `tst.l` when used as a value), long work as an
  initializer (`move.l #K`); a nested block of initializers lets statements come first.
  `x = c ? 2 : 1` adds an `ext.w` the if/else form doesn't. `x == 0 ? 99 : x` = `tst.l / seq`.
- **Operand order** (beyond round 3): `*p++ + g` = `*p++` in d0, g in d1, `add.w d0,d1`;
  `g + *p++` adds g from memory. `mem + (expr)`: the complex operand first, memory added.
  `g + idx` loads g before idx's `ext.l`. `sine * r` vs `r * sine` decides d0/d1. `ext.l d7`
  then `cmp.l d7,d0` (d0 an expression) = `regvar > expr`; a sum in d0, a field in d1,
  `cmp.l d1,d0` = `field <= sum`. `focusX = x2 = x1 = v` stores x1 first.
- **Prologue, registers**: a parameter not declared `register` that still gets a register is
  loaded before the `register` ones: for data-then-address order declare all of them
  `register`. Several register parameters can load in reverse order. Dropping `register` from
  `self` lets a register local take a4/d7 first; making only the loop counter (and pointers)
  `register` gives it d7 while plain temporaries share the rest by use count. Declare pointer
  locals in the narrowest block (a long-lived one blocks a3/a4, the block's own spills).
  `long shift, x, y;` then assignments in the ROM's order fixes rotations initialisers get
  wrong. A block-local pointer shares a dead register parameter's register only if it is not
  `register`. `if (0) param = 0;` at the end keeps a register parameter from merging into a
  local copied from it.
- **Keeping things alive**: a register variable assigned and never read vanishes with its
  stores: `if (0) (void)v;` keeps them; `if (0) (void)&local;` keeps a stack slot (`link`
  size); `if (0) t = t;` keeps a stack local's store. `u1 = sx; u2 = sy; sx = u2; sy = u1;` in
  an `if (0)` reserves two registers (overlapping lifetimes; `u1 = u2 = 0` reserves none).
  Dead code at the end (`if (0) t = timer + x + y + x;`) keeps parameters live and shifts the
  ranking. `clr.w dN` then `move.b` into it = a dead `register short i = 0;` sharing with a char.
  `lea (a0),a3 / lea 2(a0),a3` = a dead first assignment `p = &s->f0; p = s->arr;`.
- **Pops and loops**: `for (;;) { ...; if (x == c) break; }` pops between test and branch;
  `do { } while (x != c)` pops before the test. The counter tested before the pop (`subq /
  tst / addq #8,a7 / bgt`) = a goto loop (`again: ...; n--; if (n > 0) goto again;`).
  `if (1) { call(); }` flushes right after the call, no head flush; `do { } while (0)` flushes
  at the head too (a call pair before `return 0` keeps its pop before the `moveq` only inside
  one). Top-tested: `for (;; i++, p++) { if (!c) break; ... }` (`continue` goes to the
  increment; move the increments into the body if the ROM pops after them). `short n = 16;
  while (n)` keeps the initial `bra` to the test, a `for` from a constant drops it;
  `i -= 1` with `i >= 0` avoids `dbra`, `i--`/`--i` give it. Goto loops also stop register
  sharing. `do { } while (0)` around part of a block removes a CSE temporary (also
  `t = x; t -= l;` instead of `t = x - l`).
- **Pointers, indexing**: `p < &arr[16]` = `lea $100(a0)`, `arr + 16` = `add.l`;
  `&self->arr[4]` one `lea`, `self->arr + 4` two. `p += 1` = `adda.w #n`, `p++` = `lea`;
  `*p = 0; p++;` = `clr.w (a4) / addq.w #2,a4`, `*p++ = 0` = `clr.w (a4)+`. `&p->f` = `pea`;
  `(T *)p + 1` = `move.l / addq.l`; data after a 14-byte header (`lea $E(aY)`) = `(T *)(hdr + 1)`.
  `p = &map[0]` = `lea (a3),a4`, `p = map` = `movea.l`. A known-size global array is indexed
  `.w`; `((s16 *)g_Arr)[(i << 1) + 1]` folds the +1 into the A5 displacement. `(s16)f->pieces`
  (a u16 used signed) = `adda.w`. `*((s16 *)p)++` (a cast lvalue, MPW only) = `move.w (a4)+`:
  PC needs a macro.
- **Widths, signedness**: an s8 compare = `moveq #c / cmp.b`, a u8 one = `moveq #0 / move.b /
  cmpi.w` (one field was read both ways). A u8 field vs an `unsigned char` parameter =
  `cmp.b`; a plain `char` parameter extends both. `u8 < 0` = `tst.l / bcc` (a lone dead
  `tst.l` mid-expression: `(void)(u8 < 0), expr`). A widened u16 stays unsigned:
  `(h << 3) - 0x1A << 8 > s32` compares unsigned (`bls`): write `(unsigned long)` so PC agrees.
  `move.b #$FFFF` (an AS `dc.w`) = -1 into a signed char. `s8 n++ & 3` = `moveq #3 / and.b mem
  / addq.b`. A long global narrowed to short reads `g+2(a5)`, `(u8)g_Short` reads `g+1` (cc.py
  accepts both). `(*(s32 *)&g_Ptr)++` = `addq.l #1,g(a5)`. A `move.l` zero over byte/byte/word
  fields = the original stored a long: `*(s32 *)&field = 0`. Three `clr.w` to adjacent words =
  three globals (an array merges into `clr.l`): report it.
- **Misc**: `'\n'` is $0D in MPW, `'\r'` $0A. String literals under `-b` follow the function in
  reverse order of use, unmerged. `t = f(); t += c;` = `addi.w`, `t = f() + c` = `add.w`. A
  switch after a leading `return;` loses its dispatch, keeps its case bodies
  (`link / bra exit / dead bytes / unlk`). `default:` before `case 0:` falling into it = a
  compare chain ending in `clr.w`. `return a && b && (char)f();` saves d3 around the call.
  `(void)o->cls->method[n];` = a lone `movea.l (a3),a0`. `register Timer *t; t =
  Timer_Create(...); Timer_Start(t);` = a RunScene's saved, unused a4. An extra argument the
  callee never reads compiles the same. An unused local struct vanishes from the frame.

### Learned in round 9 (module groups 10-16)

- **A new variable takes the register freed most recently.** When the ROM gives it another
  dead variable's register, the original kept the later-freed ones live: dead uses at the end
  (`if (0) { (void)col; (void)crack; }`) gave SiberiaB1_IceTileHit's object counter r's d7.
- `self` loaded last in the prologue, into a3 while a register parameter has a4 = a plain local
  copy: `F(ControlPanel *obj, ...) { ControlPanel *self = obj;`.
- `for (i = 0; i < 8; ...)` from a constant drops the first test and keeps the bound in d3
  (`moveq #8,d3 ... cmp.w d7,d3`); a comma start (`p = x, i = 0`) adds the initial `bra`;
  while/do-while keep no bound register. `for (n = 10; n; --n)` = `subq / tst / bne`.
- A `link` bigger than the locals = dead locals whose address an `if (0)` takes, declared after
  the used stack locals (`long unused1; ... if (0) (void)&unused1;`). A local array used twice
  gets its address cached in a3/a4; a local struct is re-`lea`'d at each use.
- Narrow reads: `short x0 = self->x;` (an s32 field) = `move.w x+2`; `u8f = pl->param[3]` reads
  the byte. `s8f & 0xF` = `moveq #$F / and.b mem`; a u8 field is zero-extended first. A u16
  `& 0x3FFF` tested `> 0` = `tst.l / bls` (unsigned).
- `(a + b) & 0x1FF` (long) loads the mask first (`move.l #$1FF,d0 / and.l d1,d0`); `0x1FF & (a +
  b)` = `and.l #$1FF,d1`. `&g_ptr[i]` = pointer in aN + `adda` of the scaled index; `g_ptr + i`
  = `add.l g_ptr,d0`.
- `if ((char)f(x)) return 1; return 0;` (short) saves d0 around the call (`move.l d0,-(a7) ...
  move.l (a7)+,d0 / tst.b d1 / sne`). An `end: ;` after the last call also flushes the pops
  before an earlier `if (!pl)` branch. Dead loads (`old = g_CameraX; old = g_CameraY;`) need a
  read (`if (0) g_CameraX = old;`) to stay.
- `case 3: default:` puts 3 in the jump table with the default body; the ROM's body order gives
  the case order (unsorted lists are fine).
- Never write a .c file with a UTF-8 BOM (PowerShell `Set-Content -Encoding utf8`): MPW aborts
  with Fatal Error 423 ("not of type TEXT").
- (groups 12-14) **Prologue order**: parameters not declared `register` that still get one load
  first, in reverse order, then the `register` ones (data before address). A data parameter
  loaded before the pointer: both `register`. A register local before the parameters: copy the
  parameters into register locals declared after it. Declaration order among `register`
  variables can beat use count (Ninja_ClipToSegs). A plain local can take the register of a
  `register` variable whose lifetime ended; two `register` pointer locals with disjoint
  lifetimes take a3 and a4 (pushing `self` to the stack), plain ones share a3. A goto to a
  later label keeps disjoint short locals apart where `register` alone doesn't.
- `(void)field;` drops the read; `switch (field) { }` keeps it. A long result into a short
  register variable goes through a scratch register and `move.w`: a direct `move.l`/`asr.l`
  into the variable's register means it is long. `sy + (step >> 1) + 0x80` into an s16 field is
  `.l`; `(short)(sy + (step >> 1)) + 0x80` gives `.w`.
- `(T *)&hdr[1]` = one `lea $C(aN),aM` (sometimes `(T *)(hdr + 1)`: try both). `&arr[i]` =
  `movea.l base / scale / adda.l`; `arr + i` = `scale / add.l base`. `lea (a3),a4` =
  `&slots[0]`. No strength reduction: `g_X[i]` is a real `muls`.
- Bit tests: `if (g & 1)` on a long global = `move.l / btst #0`; `(g & 1) != 0` = `moveq #1 /
  and.l`. `!(b & 0x10) ? a : c` = `and.b / seq`. `if (f & 4 ? 1 : 0)` = the ROM's
  `moveq #1 / moveq #0` test. A u8 field compared with `moveq #1 / cmp.b` was read signed:
  `(char)f == 1`.
- `x -= g_CameraX - 0;` = `move.w g,d0 / sub.w d0,dN` (plain `x -= g` subtracts from memory);
  `y -= g_CameraY - -0xC` = `sub.w #$FFF4`. `owner->x + (offX << 8)` = `add.l 8(a0),d0`.
  `self->state = self->defaultState = F;` = one `lea`, +$64 stored first.
  `if ((t = self->target = f()))` = `move.l d0,field / movea.l d0,a3 / move.l a3,d0 / beq`.
  `flags = c ? 0x8000 : 0;` = `moveq #0 / move.w`; the ROM's `move.l #$8000` = a block-local
  initializer. Callers passing more arguments than the callee reads: declare them as unused
  parameters. `return (char)(*method)(...)` adds no code.

## asm functions (tag `asm`: hand-written 68000, no MPW frame)

They can't match; their C is verified by shadow tests, so it must reproduce every RAM write,
hardware access (same order, same sizes), result register and SR change. Conventions go in
the prototype tag (`tools/bridge.py` reads them):
- MPW-style stack arguments (`4(a7)`, or `8(a6)` of a frame someone else built): no tag.
- `regs(d0,d1)->d0`: parameter i arrives in that register, the result goes to the register
  after `->`; `&d1`: a pointer parameter whose value is in d1 before and goes back to d1 after;
  `a0=$A00036`: an input that is always that value (the C uses a hardware name instead).
- `clobbers(d3,a2)`: callee-saved registers it leaves changed with no meaning.
- `conv`: stack/frame effects no tag can say: adapters in `game/runtime/asm_conv.cpp`.
- CPU-only operations: `CPU_GetSR()`, `CPU_SetSR(v)` (interrupt mask), `CPU_GetSP()`; a
  pointer's bus address for DMA/sound pointers: `ADDR68(p)`; byte-wide ports: `VDP_DATA_B`,
  `Z80_BUSREQ_B` (a `btst` reads a byte); `IO_DATA(n)`/`IO_CTRL(n)`. Delay loops (nop, dbra
  busy-waits) have no C: say so in the comment.

## 5. Report

At the end of a batch list per function: matched / needs verify / not done (why), the fields
and globals you named, and any convention you had to invent. The orchestrator builds, runs
`verify` and D2, records findings in `XMen2Recomp/docs/NOTES.md` and commits.
