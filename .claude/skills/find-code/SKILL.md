---
name: find-code
description: Close code-coverage gaps in the X-Men 2 disassembly - convert runtime-proven code from emulator traces, resolve jump-table entries and numeric ROM operands, find vtable methods and switch targets, and label code pointers in data. Use for definition-of-done criteria R2, R3, S2, S3 or any "find missing code" task in xmen2disasm.
---

# Find more code

Code we miss stays `incrom` and the recompiler won't see it. Data we wrongly call
code corrupts it. The bar: **evidence first, then convert.**

## 1. Runtime-proven code (strongest; do this first)

```
uv run emu/corpus.py                 # make sure every corpus run exists
uv run tools/coverage.py --list 20   # missed_code / mid_insn / code_as_data
uv run tools/coverage.py --convert   # convert every executed-but-missing instruction
```
Execution in the emulator is proof. `--convert` batch-converts with evidence
`runtime: executed in ...`. Anything it still refuses (the trace from that address
reaches data or straddles a labelled span) needs a look with `peek.py`.
- `mid_insn` > 0 means an existing disassembled instruction is wrong at that spot:
  investigate with `peek.py` before touching anything, and record the finding in NOTES.
- New paths: add a scenario (see CLAUDE.md "Emulator"), re-run the corpus, convert.

## 2. Static evidence (for code the corpus never reaches)

1. **Calls/jumps from verified code** to raw targets, or `pea Func(pc)` /
   `lea Func(pc),aN` handed to registration routines (S3 lists numeric operands).
2. **Vtables**: `lea Tbl(pc),a0 / move.l a0,(aN)` or `move.l #Tbl,(aN)`; a run of
   longs pointing into ROM code. Each slot used by `movea.l $XX(a0),a1 / jsr (a1)`
   is a method. Label the table `Tbl_<Class>_vtable` (`label_data.py`); it becomes
   a recomp seed list.
3. **Switch tables**: `jmp $XX(pc,dN.w)` / `move.w Tbl(pc,dN.w),dN` plus word offsets.
4. **Unverified jump-table entries** (S2): `uv run tools/candidates.py`, then
   inspect each (`peek.py`). Code → `convert.py`. Data → `label_data.py` with a real
   name; that also resolves the `jtentry`.

```
uv run tools/peek.py 0x0DD0A0 --count 20 --hex 32
uv run tools/convert.py 0x0DD0A0 --dry-run
uv run tools/convert.py 0x0DD0A0 --evidence "vtable Tbl_Wolverine_vtable slot $52"
```
Clean decoding alone is never evidence: data often decodes as plausible 68000 code
(watch for runs of `ori.b #$xx`, i.e. `$00xx` words). A refusal is information.

## Commit
Small batches, byte-identical build (the hook checks), commit the new
`emu/coverage/*.gz` if you added scenarios, push after each batch.
