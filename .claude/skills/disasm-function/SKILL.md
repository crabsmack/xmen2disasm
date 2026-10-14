---
name: disasm-function
description: Understand and name functions in the X-Men 2 disassembly - pick from the work queue, read code and callers, rename with evidence, keep the build byte-identical. Use for any "name/document/understand function X" or "work the naming queue" task in xmen2disasm.
---

# Name a function (the main disassembly loop)

Goal per iteration: one function goes from `sub_XXXXXX` to a correct name, with a
header comment a newcomer can trust, and the tree still builds byte-identical.

## 1. Pick

- Given a function: use it.
- Otherwise: `uv run tools/xref.py --todo 25` and take the top entry nobody else
  is working on (in parallel runs, stay inside your claimed address range).
  The queue puts leaves/most-called helpers first because their names make
  every caller easier.

## 2. Gather context (read, don't guess)

```
uv run tools/xref.py sub_XXXXXX        # callers, callees, jump-table slot, globals, data
```
Read `src/f/XXXXXX.asm`, then at least two callers to see what they pass in and
do with the result. Useful tells:
- Hardware ports: `$C00004` VDP control, `$C00000` VDP data, `$A11100` Z80 bus,
  `$A10003/5` joypad data. VDP register writes are `$8Rvv` words to `$C00004`.
- `link.w a6,#-N`: N bytes of locals. Args at `8(a6)`, `$C(a6)`...; byte/word
  args are still pushed as longs (`ext.l` before `move.l dN,-(a7)`).
- `jsr d(a5)` comments name the real target; `pea d(a5)` passes a function pointer.
- `movea.l (aN),a0 / movea.l $XX(a0),a1 / jsr (a1)`: virtual call, slot `$XX`.
- Inline strings next to functions often name the subsystem outright.
- A loop of `move.l (a0)+,(a1)+` with `dbra` = copy; `cmp`/`bcc` on a value
  read from `$A10003` = input handling; writes to `-$XXXX(a5)` that many
  functions read = state globals worth naming.

## 3. Name

```
uv run tools/rename.py sub_XXXXXX Module_Verb loc_YYYYYY Module_Verb_loop
uv run tools/rename.py --global -0x3B70 g_ResSiberia "byte: resource id for SiberiaB1 Blizzard (Title_LoadResources)"
```
- Name locals (`loc_`) only when it helps (loop heads, error paths).
- If you can't explain the behavior from evidence, don't rename. Leave a comment
  with what you learned instead; the next pass will have more named neighbours.

## 4. Document

Replace the generated header in `src/f/XXXXXX.asm` with:
```
; ---------------------------------------------------------------------------
; Module_Verb - one-line purpose
; In:  8(a6) = long: what      $C(a6) = word: what
; Out: d0 = what (or "none")
; Evidence: called from X when Y; writes VDP reg $81; reads g_Foo
; [confidence: low]   <- only if it is a guess
; ---------------------------------------------------------------------------
```
Comments never affect bytes, but run the build anyway.

## 5. Verify and commit

`uv run tools/build.py` must print `OK: byte-identical`. Commit in small batches
(~5 functions) with a message listing the new names; the pre-commit hook rebuilds
first. Push after each batch.

## Don'ts
- Don't hand-edit instructions to make them read better; only labels, operands
  that become symbols, and comments. Every byte must stay identical.
- Don't touch `dc.w` fallback lines except to add comments.
- Don't run `split.py`: it overwrites all hand work.
