---
name: find-code
description: Discover code still hidden in raw incrom spans of the X-Men 2 disassembly (unverified jump-table entries, vtable methods, switch tables, indirect-call targets) and convert it with convert.py under evidence. Use when asked to increase code coverage or find missing functions in xmen2disasm.
---

# Find more code

About 1,000 jump-table entries point at data, and vtable methods/switch targets
are invisible to plain recursive descent. Code we miss stays as `incrom`, so the
recompiler won't see it later. The bar: **evidence first, then convert.** Data
that happens to decode cleanly as 68000 code is the classic false positive (it
silently breaks the recomp later), so clean decoding alone is never enough.

## Sources of evidence (strongest first)

1. **A call or jump from verified code** whose target is still raw: a
   `jsr ($XXXXXX).l`/`bsr`, or a `pea Func(pc)` / `lea Func(pc),aN` handed to a
   registration routine.
2. **Vtables**: an object's vtable pointer is stored with
   `lea Tbl(pc),a0 / move.l a0,(aN)` or `move.l #Tbl,(aN)`; the table is a run of
   longs pointing into ROM. Each slot used by `movea.l $XX(a0),a1 / jsr (a1)` is
   a method entry.
3. **Switch tables**: `jmp $XX(pc,dN.w)` / `move.w Tbl(pc,dN.w),dN` followed by
   word offsets. Targets are code inside the same function.
4. **Unverified jump-table entries**: `uv run tools/candidates.py` lists the ones
   that trace cleanly AND reach an `rts`. Still inspect each one: plausible
   prologue (`link`, `movem.l ...,-(a7)`, register/A5 setup), sensible
   instruction mix, no runs of `ori.b #$xx` (that's data, `$00xx` words).

## Convert

```
uv run tools/convert.py 0x0DD0A0 --dry-run          # see what would be pulled in
uv run tools/convert.py 0x0DD0A0 --evidence "vtable Tbl_Wolverine slot $52, called from sub_0DCFF0"
```
- Refused = the trace hit undecodable bytes, known data or existing code
  boundaries. Treat that as information, not an obstacle. Don't force it.
- On success the address is appended to `config/seeds.txt` with your evidence.
  Then name what you found (`/disasm-function`) or at least comment the header.

## Data you identify along the way

`uv run tools/label_data.py START LEN Name "format + evidence"`. Name vtables
(`Tbl_<Class>_vtable`), switch tables, strings and lookup tables, so references
become symbolic and the remaining raw spans shrink honestly.

## Commit

Small batches, build must be byte-identical (the hook checks), push after each.
