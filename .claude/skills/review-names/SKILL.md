---
name: review-names
description: Independently audit function and global names in the X-Men 2 disassembly against evidence (definition-of-done criterion N4). Samples random named functions the reviewer did not write, checks each name against code, callers, Ghidra pseudo-C and runtime behaviour, fixes or disputes wrong ones, and records the result in docs/reviews/. Use when asked to review names or when N4 is the failing criterion.
---

# Review names (N4)

You are the skeptic. A wrong name spreads into every caller's name, and the
byte-identical gate can't catch it. Only review names you did not create (check
`git log -S "<Name>:" -- src/f`).

## 1. Sample

`uv run tools/xref.py --sample 60 --seed <new seed>` gives a uniform random sample of
human-named functions. Review at least 50 per file, skipping any already covered in
`docs/reviews/`. Record the seed.

## 2. Judge each name

For each: read the asm, `uv run tools/xref.py NAME` (callers, runtime frames,
screenshot), and `uv run tools/decomp.py decomp NAME`. Then decide:
- **agree**: the name and header are supported by the evidence shown.
- **fix**: clearly wrong or misleading, and you can show the right name. Rename it
  (`rename.py`), correct the header, and note it.
- **dispute**: doubtful, and you can't settle it. Leave the name and open a dispute
  in the review file with the specific counter-evidence. Disputes are resolved by
  another agent or session (rename, or a closing note with evidence), then marked closed.

## 3. Record: `docs/reviews/review-NNN.md`

```
# Review NNN (date, reviewer session, sample seed)
reviewed: 50
agree: 46
open disputes: 1
## Fixed
- sub_xxx Old_Name -> New_Name: reason
## Disputes
- [open] Name: counter-evidence ...
```
progress.py sums `reviewed`, `agree` and `open disputes` across all review files
(N4: reviewed ≥ 10% of functions, agree ≥ 90%, open disputes 0). Fixes count as
not-agree. When you close a dispute, decrement `open disputes` in its file.

Build byte-identical, commit, push.
