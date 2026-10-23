# Notice

## The game

*X-Men 2: Clone Wars* and its characters are the property of their respective rights holders.
This project is not affiliated with or endorsed by Marvel, Sega or anyone else connected with
the original game.

This repository contains **no game data**. Every byte of the cartridge that the disassembly
does not express as code is pulled in at build time (`incrom`) from a ROM file you supply
yourself, which the build checks by SHA-1 and git ignores. The 68000 instructions, labels and
comments are a description of the program, written to study it and to build a PC port that
also runs only on your own copy. Before release, the full git history was scanned for ROM
content (every blob, binary and hex text, 32-byte windows): none was found.

The MIT license in [LICENSE](LICENSE) covers the original work here. It does not, and cannot,
grant any rights in the original game.

## Third-party components

| Component | Where | License |
|---|---|---|
| The Macro Assembler AS (Alfred Arnold et al.) | `build_tools/` (Windows binaries; source at <http://john.ccac.rwth-aachen.de:8000/as/>) | GPL v2, see `build_tools/AS.txt`. Only used to assemble; its output is not covered by the GPL. |
| Genesis Plus GX (Eke-Eke and contributors) | `emu/gpgx` (submodule of libretro/Genesis-Plus-GX) | Its own non-commercial license, in the submodule |
| BizHawk's Genesis Plus GX fork (TASEmulators) | built by `emu/build_core.py` from upstream source | MIT (BizHawk) / Genesis Plus GX license |
| TASVideos movie [4473M](https://tasvideos.org/4473M) by Truncated & Sonikkustar | `emu/corpus/tas/` | Published by TASVideos; included as the test corpus's reference input, with credit |
| capstone, Ghidra, mps (Elliot Nunn), MPW (Apple) | downloaded or installed by `tools/setup.py` and docs/COMPILER.md, not redistributed here | their own licenses |
