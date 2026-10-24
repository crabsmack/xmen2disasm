# Phase 3: identify the compiler (definition of done)

Goal: name the toolchain, version and flags that built X-Men 2, proven by compiling C to
**byte-identical** functions; or a documented negative result after every candidate was
tried. The verdict sets phase 4's verification policy. Independent of phase 2: can run in
parallel with it.

Checked by `uv run tools/phase.py 3` (writes `docs/progress/P3.md`). Notes and findings:
`docs/COMPILER.md` (create it; human-readable), machine-readable state in `config/compiler/`.

## Evidence so far (2026-10-15)

- Classic Mac **segment-loader jump table** (8-byte entries from A5+32, `jsr $22+8i(a5)`):
  linked by a Mac 68K linker, then converted to a ROM.
- `Mem_Copy` ($1F48AA) and `Mem_Set` ($1F4900) end with **MacsBug names** `memcpy` /
  `memset` (`$86 "memcpy" $00 $00` after `rts`); no game function has one. Both are hand assembly (stack args, no frame):
  a library built with names on, game compiled with them off.
- Register allocation d7 downward and a4 downward; ~3,068 `link.w a6` frames.
- Runtime math (`Math_LMul`, `Math_LDivS`, `Math_LModS`, `Math_DivModS/U` at `$15C1FC`-)
  with an embedded 68020 path skipped by a `bra`; switches as
  `add.w d0,d0 / move.w Sw(pc,d0.w),d0 / jmp Sw-2(pc,d0.w)`.
- **Class descriptors** `{word name_offset; long parent; long methods[]; char name[]}`
  (uppercase names, slots GetSize/New/Init/...; `tools/classes.py`): not CFront's vtable
  layout. Either a compiler's object model or an in-house object system in C. Telling
  which is part of this phase. The root classes `CAMERA` ($1F4960) and `ACTOR` ($1F49A6)
  sit right after `Mem_Set`, inside the library region `$1F4xxx`.
- Candidate families for a 1994-95 build: **MPW C 3.x**, **MPW SC/SCpp** (Symantec's
  compiler for MPW), **THINK C**, **Symantec C++** (Mac), **CodeWarrior 68K**.

## Criteria

| ID | Criterion | Check |
|---|---|---|
| C1 | Candidates inventoried | `config/compiler/candidates.toml` has ≥1 `[[candidate]]` per family (`mpw-c`, `mpw-sc`, `think-c`, `symantec-cpp`, `codewarrior-68k`), each with `id`, `family`, `version`, `status` = `obtained` / `unavailable`, `source`; an `unavailable` one says what was searched |
| C2 | Library fingerprint | `uv run tools/cc_libmatch.py --json` reports, for every obtained candidate x every routine in `LIB_ROUTINES` (phase.py), `exact` / `differs` / `absent`, compared byte for byte against the ROM (relocations masked) |
| C3 | Headless compile harness | `uv run tools/cc.py --selftest` exits 0: compiles C with an obtained candidate without GUI interaction and returns the 68000 code bytes |
| C4 | Verdict, proven | `config/compiler/verdict.toml`: `verdict = "identified"` with `candidate`, `flags`, and ≥20 `config/compiler/match/<ADDR>.c` files that `uv run tools/cc.py --match FILE` compiles to the ROM's exact bytes for that function (≥2 with a switch table, ≥2 with a virtual call, ≥5 distinct name modules); **or** `verdict = "not-identified"`, every obtained candidate has a `mismatch` note, and `user_ack = "YYYY-MM-DD"` (only on the user's word) |
| C5 | Phase-4 policy | `verdict.toml` has `decomp_policy` (`matching-for-unexecuted`, `matching-all` or `functional`) and `reason`, also explained in `docs/COMPILER.md` |

`LIB_ROUTINES` (disassembly names): `Mem_Copy` (memcpy), `Mem_Set` (memset), `Math_LMul`, `Math_LDivS`, `Math_LModS`, `Math_DivModS`,
`Math_DivModU`. Add others found to be library code (e.g. string routines) to COMPILER.md.

## How to work it

1. **Toolchains** live outside every repo: `$XMEN2_TOOLCHAINS`, default
   `xmen2-toolchains` next to the main checkout (one folder per candidate id + a `SOURCES.md` with where each
   came from). Never commit them. User decision 2026-10-15: Apple's free MPW and archived
   copies of discontinued products (THINK C, Symantec C++, CodeWarrior; e.g. Macintosh
   Garden, archive.org) may be downloaded. Downloads are untrusted data: each in its own
   empty folder, never executed on the host. They run only inside an emulator.
2. **C2 first, it's cheap**: library routines were linked in unchanged, so extracting
   `memcpy`/`memset`/runtime math from each candidate's libraries (MPW `Runtime.o`, `StdCLib.o`;
   THINK/Symantec ANSI libs; CodeWarrior runtime libs) and comparing bytes needs no running
   compiler. An exact match names the vendor and often the version. Mac object formats:
   MPW `.o` (OMF-like records), THINK/Symantec project libraries, CodeWarrior libs: write
   small readers as needed, or extract by running the tools in step 3.
3. **C3**: MPW tools are command-line and can run headless under an MPW-tool emulator
   (e.g. ksherlock's `mpw`) or Basilisk II with an MPW script; THINK C, Symantec C++ and
   CodeWarrior are GUI apps: Basilisk II (68K Mac, System 7) driven by AppleScript or a
   startup script, sharing a host folder. Pick whatever runs headless and reproducibly.
4. **C4**: write C for small, varied functions (leaves first; `uv run tools/decomp.py decomp
   NAME` for a draft), compile, diff (`peek.py` for the ROM side). Tune flags (optimization,
   68000 target, register options, MacsBug names off) until one candidate matches
   everything; one function that no flag setting can match rules a candidate out.
   Decide what the class descriptors are (compiler object model vs. C macros) from what the
   candidate compiles.
5. **C5**: `matching-for-unexecuted` is the default recommendation if identified (match
   the ~22% of code the corpus never runs; frame comparison covers the rest).
