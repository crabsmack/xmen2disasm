# Phase 7 kickoff measurements (2026-10-21)

Three read-only measurements made for phase 7's kickoff (M0), before the rulings were asked; the
criteria doc [P7-multiplayer.md](P7-multiplayer.md) summarises them in "What the earlier phases
leave". Kept as measured (by three agents, from the code, RAM snapshots, emulator runs and builds
in scratch directories); the helper scripts they mention were throwaway and are not kept. Later
findings go to XMen2Recomp `docs/NOTES.md` "Phase 7".

1. [Netplay and savestates](#1-netplay-and-savestates): the engine's libraries, XMen2Native's loop and state, builds, the criteria.
2. [Player art, palettes and sprites](#2-player-art-palettes-and-sprites)
3. [Stage music player parts](#3-stage-music-player-parts): GEMS 2.8, which songs, what `$A`/`$B`/`$C` do.

## 1. Netplay and savestates

Engine fork at 22ed7f6; recomp-net 2103d5e; rbengine 2a03e73. Paths are relative to ..\XMen2Recomp unless they say otherwise.

### 1. The engine's netplay

- **What the game supplies:** the `RNetRbHost` callback table (external/recomp-net/include/recomp_net/rb_driver.h:117-182):
  - snapshots, keyed by tick: snap_save/load/has/oldest/drop_after. The host owns the storage.
  - publish(rows) plus run_tick: INLINE replay, one tick on the published rows.
  - resim_begin/end, to mute presentation during a replay.
  - digest_master and digest_parts.
  - pads: decode_sample, sanitize_row, neutral_row.
  - request_return_to_lobby, log, now_ms.
  The Genesis binding is runner/netplay/genesis_netplay_rb.c. Its snapshots are rb_state blobs in rbengine's ring (:93-143), and its digest is genesis_rb_digest folded to 32 bits. On the wire that is 3 parts: ram, sound, vdp (:235-262).
- **One tick:** `genesis_sim_step` (runner/sim_step.c:44-82) runs pads, then machine_run_frame, then the audio drain, then the V-blank work. Netplay, replays and the probe all use this one function.
- **The snapshot** is one section table (runner/rb_state.c:155-166). The sections are exec, cpu, sched, ram (64 KB), machine (GenesisMachine with pointers scrubbed, plus a tail), fm (ymfm blob), psg, evq, input, and game (a GameSpec hook). The same table drives 12 digest partitions (:169-171).
  - The exec section is the suspended game fiber: the minicoro context plus the live stack span from SP minus the red zone up to the top. It also holds the tail-frame head (runner/glue.c:2530-2573; runner/fiber_compat.c:385-447).
  - The fiber stack is engine-owned and never moves, so a restore is only valid in the same process (glue.c:2527-2529).
  - The exec digest is address-free: yield site, running flag, resume PC and the guest tail chain (glue.c:2578-2582).
  - There is a mutation self-test (rb_state.c:314-360) and a section-skip negative control, `GENESIS_RB_NEGCTL_SKIP` (rb_state.c:234-261).
- **The probe** is runner/rb_probe.c. `GENESIS_RB_PROBE=period:depth` (depth at most 64) saves, runs live, restores, replays and compares the digest tick by tick, and checks restore symmetry (:214-290).
  - `_STATICS` diffs .data/.bss across a restore. It is **Linux/GCC only** (it needs `__data_start`/`_end`, :118-162), and tools/rb_statics_resolve.py uses `nm`.
  - `_STACKSCAN` looks for heap pointers on the fiber stack (:165-197).
- **The link simulator** is external/recomp-net/src/transport/rnet_netsim.c. It sits on the receive path and is set only by environment variables: `RNET_SIM_LATENCY_MS` (2000 ms at most), `RNET_SIM_JITTER_MS` (no more than the latency), `RNET_SIM_LOSS_PCT` (90 at most) and `RNET_SIM_SEED` (:90-140). It is wired in rnet_transport.c:455-500, so it works headless.
- **Transports:**
  - Implemented: LAN direct, LAN hub (seat 0 forwards), the lobby server's relay, ICE (libjuice, `RNET_ENABLE_ICE`, default OFF), the host relay, and the WebSocket lobby client.
  - The lobby server dropped its UDP relay on 2026-10-08 (NETPLAY.md:24-35).
  - The host relay's orchestration runs through the lobby (host_relay.h:4-33). In the match itself it is `rnet_session_start_lan_hub`. `RNET_HOST_RELAY_ENDPOINT` serves loopback tests.
- **Never exercised** (NETPLAY.md:10-15 and 191-233):
  - no two-machine or internet run;
  - nobody has played it with a controller;
  - ICE has not run;
  - Windows/MSVC netplay was only built and started (a 300-frame startup check);
  - Android was not built;
  - host SRAM push was not exercised;
  - cross-compiler UB in peers was never checked (:433);
  - fiber snapshots on arm64 have never run on hardware (:422).

### 2. XMen2Native today

- **Who owns the loop: the game.** main.cpp:431-433 calls `xm_entry_point()`, which never returns. `plat_sync_point` (machine.cpp:777-794) runs these steps in order, at VDP_WaitVBlank's entry and only at depth 0:
  1. the sync row;
  2. plat_frame_end: screenshot, FBHASH, present, benchmark exit (main.cpp:359-389);
  3. frame_begin, which reads the pads (`plat_frame_begin`, main.cpp:303-320: `host_input`, or the input script keyed by runner frame) and then runs the Z80's frame;
  4. the V-int, with the **game's handler called nested** on the same stack (take_vint, :672-686);
  5. the render;
  6. high_fps present.

  `plat_wait_vint` (:703-715) is a second V-int site. In played runs it also runs a Z80 frame.
- **Fiber:** phase 5 removed the engine's glue/exact_sched/fiber (native.cmake:1-8; machine.cpp:12-13). Bringing one back is cheap:
  - fiber_compat.c includes only minicoro (runner/fiber_compat.c:23-36).
  - It needs `/CETCOMPAT:NO` on MSVC and `-fstack-clash-protection` on GCC (cmake/GenesisRecompRunner.cmake:132-156). Neither is set on XMen2Native today.
  - The game C has no setjmp, longjmp, exceptions or heap use (grep of game/c is empty).
  - The yield would go at the top of plat_sync_point. The present pacing (`host_present_at`) and SDL input would move out to the host loop.
- **State a full snapshot needs.** The sizes below are measured from the MSVC map (build/Release/XMen2Native.map, the .data/.bss of section 0003).
  - The arena: 64 KB, mapped twice at a fixed host address (native_rt.cpp:53-85), plus `xm_tags` (64 KB, :99).
  - The escaping-locals region is inside the arena ($FFAF1A-$FFC518, main.cpp:131-132). Its mark `xm::s_sp` is in native_rt.cpp:146.
  - The bridge: `xm::g_d0` and `s_cur_fn` (build/bridge_native/xmen2_bridge.cpp:31479, 31533).
  - The machine:
    - `g_machine`: 90,576 B. This is the VDP with its VRAM, CRAM and VSRAM, the bus with Z80 RAM and the pads, and the Z80.
    - 38 further statics in machine.cpp, about 200 B: the Z80 clock and state, the YM timer model, the VDP port and DMA latches, I/O, the pad protocol, SR, depth, frame and sync counters, and the function-local `ei_shadow` (:111).
    - `s_cram_argb`, which is derived and can be rebuilt from CRAM.
    - `g_snd_frame`.
    - genesis_vdp.c statics: `s_pending_68k_stall`, `s_unlimited_sprites`, the host palette and sprites, and the widescreen extras.
  - The sound chips: the ymfm blob, the PSG and the event queue. They already have `*_rb_save` and are already compiled in (native.cmake:27-38). In headless runs they are not driven at all (main.cpp:254-257).
  - Options that affect the simulation: `g_opt` full_rate_2p, widescreen, lives, magneto and start_char.
  - widescreen.cpp's statics (s_cache_*, s_cerebro, s_pending…) feed the game through `plat_ws_view` (widescreen.cpp:101-109, 381-409).
  - Total writable statics in the binary: 292 symbols. None of them come from the 3,164 game/c objects. Only platform, runtime and engine objects have any.
  - Rough snapshot size: arena + tags 128 KB, machine about 91 KB, chips about 10-30 KB, fiber span unmeasured. About 250-300 KB in all.
  - **Statics finder:** the engine's `_STATICS` mode works only on Linux GCC (the WSL build in ~/xmen2-native-build qualifies). The allow list must be written fresh: it would see g_rom (4 MB), the framebuffers (2×983 KB) and the mixer and event rings (7 MB).
- **Host pointers:** the fiber stack would hold pointers into the arena, g_rom and the statics. All of these are stable in the process. The arena never holds stack addresses, because escaping locals live in the arena. The machine holds host function pointers: the vdp callbacks, `bus.vdp`, and the z80 read/write/port/userdata fields. These must be scrubbed as the engine's `machine_rb_save` does (genesis_machine.c:301-354). That code is not linked into XMen2Native, which has its own machine.

### 3. Builds

recomp-net and rbengine have no dependencies beyond ws2_32/iphlpapi/bcrypt/shell32. libjuice is fetched only when ICE is enabled.

| Toolchain | Configure + build (libs and rb_driver_test) | rb_driver_test | rbengine snap_ring_test |
|---|---|---|---|
| MSVC 19.41 (VS2022) | succeeded; 3 C445x warnings | exits 0 (its two-process part needs fork(); the in-process part is POSIX-only) | — |
| WSL GCC 15 (Ninja) | succeeded | `ok` (2-4 seat episodes) | ALL PASS |

- The engine's `genesisrecomp_enable_netplay` cannot be reused as it is. It FATALs without recomp-ui's launcher (cmake/GenesisRecompNetplay.cmake:84-97). The facade also needs sim_step.h and rb_state.h, which depend on g_cpu, glue and GenesisMachine's rb functions.
- XMen2Native should link `recomp_net` and `retcomm_rbengine` directly and write its own small host table.
- The N-process harnesses are tools/rb_loopback.sh, rb_sweep.sh, rb_lobby.sh and rb_probe.sh. They are **bash and POSIX** (SIGUSR1 stop, rb_loopback.sh:71, 219).
  - Their inputs are `GENESIS_NET_TEST_PAD` patterns, not replayed input files.
  - They grade a ledger plus tick-aligned screenshots, not equality with a reference.
  - netplay_regression.py is the netplay-off fingerprint gate. It is not a loopback harness.
  - A Windows-against-WSL run needs a Python driver.

### 4. The criteria

- **M2: measurable as written for rows and framebuffers.** The TAS is 51,209 sync points, so about 170 passes. The cost is about 1.2× the corpus native time plus the snapshots.
  - Two problems: the chips and the sound sections never change headless, and several sections affect neither the rows nor the picture. So the negative control "any one section makes the check fail" cannot fail through rows or framebuffers for fm, psg or evq (or for widescreen state with widescreen off).
  - Proposed wording: "...and per section, the mutation self-test changes only that section's digest and the restore brings it back; skipping any section that the 300/60 pass changes makes the restore-symmetry digest or the replayed digest differ."
  - Command: `XMEN2_RB_PROBE=300:60 xmen2check.py trace --mode native --fb` (corpus) plus `XMEN2_RB_NEGCTL_SKIP=<sec>` on the TAS.
  - Also: the replay must render, because the picture is compared and rendering sets the VDP sprite flags that are in the image.
- **M3: not measurable as written.**
  1. Played processes read the V counter from the **wall clock**, which seeds player 1's character at power-on (machine.cpp:612-619). Two peers diverge at once unless the value is sealed.
  2. Played runs add a Z80 frame in `plat_wait_vint` and traced runs do not. So "equal to the offline reference" needs the reference machine mode to be a sealed session setting.
  3. With input delay D, a seat must publish the script's pad for tick t+D. Otherwise the run is not the corpus input.
  4. Windows against Linux: raw-byte digests differ by compiler. `z80.cyc` is `unsigned long`: 4 bytes on MSVC and 8 on GCC, so the following fields move. Bool bitfields also differ. The engine never checked this case.

  Proposed digest for cross-OS sessions: the 68000 view of RAM plus VRAM, CRAM, VSRAM and Z80 RAM plus a canonical field list. These are the sync-row sections, which P9 already proved equal on MSVC and GCC.

  Proposed wording: "...in the reference machine mode, inputs sealed by tick..."

  Command: a Python driver that starts 2 XMen2Native processes with `--netplay seat=N --input-script F --sync-csv` and the `RNET_SIM_*` variables set, then diffs the per-tick digests and compares the host's CSV with the reference.
- **M5: the "host relay" in the criterion needs the lobby, which R8 defers.** On loopback without the lobby it is the LAN hub, the same in-match path. Proposed wording: "four processes over loopback (LAN hub, the host relay's in-match path)".
  - Every check here is a comparison between processes, which is measurable.
  - "Same digest as the offline run" requires the offline run to be the same machine mode with the same 4-pad sealing.

### 5. Risks and surprises

- The two-player corpus is thin. Only scenario-options-menu has two players alive (3,192 frames, NOTES:765-767). The TAS and scenario-two-player do not.
- The F10 widescreen toggle and the F9 high-fps toggle mid-game change the simulation and the present timing. Online they must be refused or sealed.
- The present clock and `host_present_at` pacing currently run inside the game's call stack. They must move to the host loop.
- `s_fs_reads`, the hang guard, and diagnostic counters (slow loads, present and ws counters) belong in the statics allow list. They should not be snapshotted.
- The fiber stack size and the cost of a native replay tick are unmeasured. Headless runs are about 1.7 ms per frame (NOTES), so an 8-tick replay costs about 14 ms. That is tight inside a 16.7 ms frame. A replay with the render skipped would be faster.
- The engine's Genesis netplay has only ever been Sonic 2 on Linux loopback. X-Men 2 would be the first MSVC peer and the first cross-OS peer.

## 2. Player art, palettes and sprites

### Data used
- Hand C: ..\XMen2Recomp\game\c (files named by ROM address).
- TAS RAM snapshots emu/runs/tas/ram (every 60 frames). Two-player TAS window: frames 49320-50580,
  scene 43 (the Brood boss), Wolverine (P1) and Beast (P2).
- New emulator runs (art_emu.py), one stats row per frame from the VDP's sprite table at $F000:
  - art_out/tas_stats.jsonl: TAS frames 49141-50620.
  - art_out/scn_stats.jsonl: scenario two-player.txt, frames 2345-7775, Nightcrawler (P1) and Cyclops (P2).
  - VRAM/CRAM/RAM dumps plus PNGs: art_out/{scn3000..7500, tas49400, tas49920, tas50300}_*.bin.
    The VRAM dumps were NOT analysed: after the dumps were taken, the session's shell was locked by
    the worktree guard. art_vram.py is ready to run on them.

### Palettes
- Line 0: the level's FG map palette. Level_Load (1F98A8.c) copies MapHeader+$10 into g_PalBase[0..15].
- Line 2: the BG map palette when flag2/bgPal2 is set (1F98A8.c, Level_LoadMaps 1F5788.c). Scene code
  also writes it (palette cycles, for example 034D7A). Evil clones use it (XClone_Init 095250.c: palette 2).
- Line 1: Pal_SceneDefaultLine1, written after every scene load by Scene_PostLoadVram (006B64.c). All
  seven heroes use it: every <Char>_Init calls Spr_Init(..., pal=1, ...). The other users are the HUD
  sprites (attributes $A7E8/$A7D0..: palette 1, Level_FrameLoop 1FA124.c), the common sprites (hit
  spark, flux bomb: Scene_AllocCommonVram 006A20.c), the player-select portraits (0656B0.c SLOT->pal = 1)
  and the pause sprite.
- Line 3: Pal_SceneDefaultLine3 (Scene_PostLoadVram). Enemies, through SprDef_Add pal 0-3 per class
  (counts in the C: 22x1, 20x3, 13x0, 9x2), and P2 under the friendly-fire cheat
  (Player2_MakeHostile 005F18.c: P2 takes palette 3).
- No character has a palette of its own, and nothing swaps palettes per character or per frame for
  the players. The one exception is Nightcrawler_FlashPalette (1A60B6.c), which brightens all 64
  colours of g_PalWork during a strong teleport, the whole screen included.
  - Screenshot tas49920.png: blue Beast and yellow Wolverine side by side, both drawn from line 1.
  - The sprites drawn at 50489 use palette 1 for 50 sprites and palette 2 for 30.
- The same character twice is not allowed. The cursors only move to a free character
  (PlayerSelect_FirstFreeChar/NextFreeChar/PrevFreeChar via CursorInput_Move* 067FCA/068078/068126).
  Random picks exclude the other player's character (Player1/2_StartLife 006242/0062E4,
  PlayerSelect_Run 0656B0.c:90-95).

### VRAM
- Fixed map (VDP_InitRegs): plane B $0000, window $D000, plane A $E000, sprites $F000, H-scroll $F400.
  HUD art sits at $FA00-$FFFF, 48 tiles: HUD_Redraw 006584.c (panels P1 $FD00, P2 $FA00) and
  HUD_UpdateHealthBars 006386.c (strips $FF80/$FF00 for P1, $FC00/$FC80 for P2).
- Each player has a fixed slot. g_PlayerTiles = Player_CalcMaxTiles() (006672.c) = $64 = 100 tiles
  (3,200 bytes), the largest character set: the Cyclops body plus $34 beam tiles. Scene_PostLoadVram
  gives g_P1VramTile = cursor, g_P2VramTile = +$64, cursor += $C8.
  - Both slots are reserved even in one-player play: p2t is always p1t + $64.
  - The body's definition is streamed. Spr_Init(frame -1) reserves the largest frame. When the frame
    changes, Spr_Draw -> Spr_UploadFrame (1FAD44.c) -> VDP_QueueDma (1FE17A.c) sends only that frame's
    pieces, and VDP_FlushDmaQueue sends them in V-blank.
  - Effects are preloaded at the end of the slot: Gambit cards 13 + trail 12 tiles; Psylocke's blast
    16; Beast's wave; Magneto's shot 7.
- Enemies are preloaded whole (SprDef_Add 15B0E6 region, Spr_PreloadToHeap) from g_P2VramTile + $64
  upward. Spr_ReloadDefs re-packs them.
- Measured cursor high-water marks (TAS RAM): $6F7 (scene 6), $6F5 (0), $6E3 (4), $6D5 (23), $6AB (43).
  The window area ($D000 = tile $680) is overrun in those scenes, so the usable top is $700. Four
  scenes have fewer than 45 tiles left and Sentinels B1 (scene 6) has 9, while players 3 and 4 need
  200. There is no VRAM for two more player slots in the busiest scenes.

### Sprites
- 80 hardware slots in g_SpriteTable ($FFE226, DMA'd to $F000), chained in order (Spr_InitLinks 1FA956).
  Every emitter stops at 80 (Spr_Emit* 1FB75A/1FBA0C/1FB8A2/1FBB5E, 15AE48), and later draws are dropped.
- HUD: 2 sprites per live player (Level_FrameLoop).
- Per player, hardware sprites per frame:

  | Character | Run | Average | Max |
  |---|---|---|---|
  | Nightcrawler | scenario | 12.9 | 26 |
  | Cyclops | scenario | 11.3 | 23 |
  | Wolverine / Beast | TAS | about 11-15 | 13-19 (any frame) |

  Effects (beam pieces, cards) count too: 32 frames of the TAS window have a player at 20 or more.
- Table fill in two-player:
  - Scenario: average 31.5, peak 59 (6991: P1 23, P2 23, HUD 4, other 9).
  - TAS Brood boss: peak 80, so the table is full (50489-50496: P1 13, P2 15, HUD 4, other 48). 66
    frames are at 65 or more.
- Per scanline (H40 limits: 20 sprites and 320 px per line):
  - Up to 22 sprites on a line (12 TAS frames over 20).
  - Over 320 px on 773/1480 TAS frames and 8 scenario frames. The pixel count includes off-screen x,
    which the VDP also counts.
  - Two players already hit both line limits.

### Fixed at two players (short list)
- g_Player1/g_Player2, with g_P1/P2* globals: CharIndex, VramTile, HasMeter, Lives, health/StartRec.
- Player-select: two slots and cursors, at most 6/7 characters, unique characters (0656B0, 067FCA..).
- Lives: Player1_StartLife / Player2_StartLife (006242/0062E4); Game_ResetPlayers (005C7C);
  Game_SceneLoop (005CC6).
- Players_PlaceAtStart (006BD0): P2 30 px right of P1.
- HUD: fixed VRAM panels and per-player sprite positions in Level_FrameLoop; HUD_UpdateHealthBars and
  HUD_Redraw.
- Camera: Cam_FollowBoth (1609CC) -> Cam_TrackBoth.
- g_PlayersAlive 0-2 and g_TwoPlayerStep (two-player half-rate stepping).
- Draw list key low bits: 1 = P1, 2 = P2.
- Per-character singletons that rely on unique characters: g_GambitCards, g_PsylockeFxSpr,
  g_BeamFlicker* (Cyclops beam V-blank flicker), Magneto shots $FFE8AE.
- Player2_MakeHostile (P2 only).

### Conclusion for players 3 and 4
- **Palettes.** No extra palette is needed. The four players would all be distinct characters, and
  every hero already shares line 1. Players 3 and 4 just use palette 1, as players 1 and 2 do.
  - R6's "extra palettes" is unnecessary.
  - M4's "all four players are drawn with their own palettes" should become "with the hero
    palette (line 1)".
  - Exception: the friendly-fire cheat, where only P2 switches to line 3. With four players it needs
    a rule, or more host lines.
- **Tile memory.** Host-side, needed: 2 x 100 tiles with 9-45 tiles free in the busiest scenes.
  - The extra slots can live outside the 64 KB (P3/P4 VramTile >= $800 in a host VRAM extension).
  - The per-frame body upload grows by up to about 2 x 3.2 KB DMA a frame, over the V-blank budget
    in the worst case. The native port has no budget limit, but that is still a host extension.
- **Sprites.** Host-side, needed: a 4-player frame averages about 4 x 12 + 8 HUD + enemies, and its
  peak is above 100. Even two players fill the 80 slots and break the 20/line and 320 px/line
  limits.
  - The extension has to cover more than 80 slots, and also the per-line limits (or keep them
    deliberately for authenticity, in which case players 3 and 4 flicker or drop pieces).
  - The emitters' hard stop at 80 (g_SprIndex compares) must be raised in the native branch, not
    only in the VDP model.
- **Gaps in R6.**
  1. It omits the sprite-count and per-line limits, which are the binding constraint.
  2. It omits the HUD's art: the panels are VRAM-fixed at $FA00-$FFFF with "1"/"2" baked in, and
     no space is left for panels 3 and 4.
  3. "Used only with four players": players 3 and 4 already need the extensions whenever three or
     more players are in play (three players need them too).
  4. The unique-character rule must hold for all four players, because per-character state is global
     (g_GambitCards, g_PsylockeFxSpr, beam flicker). Before Magneto's stage, 6 characters remain for
     4 players.

## 3. Stage music player parts

Read-only measurement, 2026-10-21. Scripts and raw output (all in this scratchpad):
`mus_parse.py` -> `mus_all.txt` (every command $69-$72 in all 256 songs), `mus_z80.py` -> `mus_z80.txt`
(linear Z80 disassembly of the driver, ROM $1FE66C-$1FFED2 loaded at Z80 $0000), `mus_sim.py` ->
`mus_sim.txt` (static track listings + event simulation of every stage song for A=0, A=1 x 7, A=2 x 49),
`mus_sum.py` -> `mus_sum.txt` (summary).

### 1. The driver is GEMS 2.8 (confirmed)

- `Game_Init` ($006636) -> `Snd_Init($1618BC, $163BF2, $1641BE, $17B8AA)` (jt 2111-2114), sent as
  `$FF $0B` + four 24-bit addresses: GEMS `gemsinit(patchbank, envbank, seqbank, sampbank)`.
- Sequence bank $1641BE: 256 little-endian 16-bit song offsets ($0200 = 2*256), each song = track count
  byte + 3-byte track pointers. Song 0 at +$200 has 10 tracks and song 1 starts at +$21F = $200+1+3*10:
  the GEMS **2.8** layout (3-byte pointers; ValleyBell's gems2mid detects it the same way and even names
  X-Men 2 as a game that starts other sequences from inside songs).
- Patch bank $1618BC: 16-bit offsets, type byte 0 FM / 1 DAC / 2 PSG / 3 noise (GEMS).
- Driver command dispatch at Z80 $0537 (`SUB $60` then a DEC chain): $60 end, $61 patch, ... $6B start
  song ($06A3 -> $0BB6), $69 mute ($065D), $70 store ($0712), $71 conditional ($0719), $72 misc ($076D).

#### Exact semantics from the Z80 code
- Variables: 68k command `$1B slot value` -> Z80 $0B2B: `[$1B22+slot] = value`. Sequence `$70 v x` writes the
  same array ($075F computes $1B22+v).
- `$71 v rel x n`: compare var[v] with x; if true run the next n bytes, else skip n bytes ($074F adds n to
  the track pointer). rel 0 ==, 1 !=, 2 >, 3 >=, 4 <, 5 <= (decoded from $0720-$074D). No delay applied.
- `$69 m`: finds the track slot of the *same song* (slot+$0E = song id, slot+$0F = track number) with
  number m&15; bit 4 clear -> SET bit 1 of slot+6 (muted: note-ons skipped at $0512), bit 4 set -> RES (unmuted).
- `$6B s`: start song s ($0BB6): its tracks take free slots among the **16 track slots** at Z80 $1B80
  (stride $20); tracks beyond 16 are silently not started.
- `$68 t`: tempo = t+40, written to the single global $0885 ($0652 -> $0DF4): **one tempo for all music**.
  Part songs contain no $68; they run at the base song's tempo.
- Voices are **allocated per note, dynamically** (note-on $11E5 -> allocator $17BF/$1822): pools in Z80 RAM
  $1772 (7-byte entries): FM 0,1,2,4,5,6 (6 voices; DAC patches use only the FM6 entry, Ch3-mode FM patches
  only FM3), PSG tone 0-2, noise 3. Free voice first (preferring the one this track used last); otherwise
  the busy voice with the lowest owner priority is stolen if that priority <= the requester's priority
  ($6A sets it, slot+$1C); otherwise the note is dropped. There is no fixed channel per track or per song.

### 2. Which songs use $B/$C (complete scan of all 256 songs)

Only four dispatcher songs test $B/$C. Each has track 0 = player 1 dispatcher (`71 0B 00 k 03 C0 6B part`),
track 1 = player 2 dispatcher (same with var $0C), both run once at the start and end. Character k
(Player_MusicVoice: 1 Beast, 2 Nightcrawler, 3 Magneto, 4 Gambit, 5 Wolverine, 6 Cyclops, 7 Psylocke):

| base song | stage(s) | part songs for k = 1..7 | parts start at |
|---|---|---|---|
| $27 | SiberiaB1 Blizzard (RunScene; FrameHook restarts it when P2 joins) | $28 $29 $2A $2B $2D $2F $2C | tick 480 |
| $25 | BaniMazaB2 Exterior | same set $28..$2F | tick 384 (Magneto $2A at tick 0) |
| $48 | SavageB1 Jungle 2 (its track 2 also starts $47) | $49 $4A $4B $4C $4D $4E $50 | tick 0 |
| $64 | CloneA1 ($5E: var$14=0, start $64), CloneA2 + XClone_DieRestartMusic ($5F: var$14=1) | $65 $66 $67 $68 $69 $6A $6B | tick 0 (+ $6C) |

Not player-driven: Jungle 1 (SavageC1) plays only $47 + $51 (no conditionals), so its frame hook's
`Music_SetPlayerParams` has no audible effect. $74 (clone arena, `XClone_LockArena_SetTheme`) dispatches on
var $12 = the clone's theme (1-7 -> $6D $75 $72 $71 $77 $6E $76), not on the players. $2E, $4F are 2-note
effects (unused part slots). Every other stage plays a fixed song (Level_Load arg $36) with no tests.

The dispatchers run once, at song start: parameters only matter when the song (re)starts. The 31-of-32-frame
refreshes in the Jungle/Blizzard hooks change nothing until a restart (Music_PlayStage / the Siberia P2-join path).

### 3. What $A does

Every part song's track 0 is `71 0A 01 01 03 C0 69 0n | 71 0A 00 01 03 C0 69 1n`: if $A != 1 mute track n,
if $A == 1 unmute it. The muted track is the part's second (doubling/harmony, lower-priority) voice:
$28/$2B/$2F/$49/$4C/$4E/$65/$68/$6A track 2; $29/$2C/$2D/$4A/$4D/$50/$66/$69/$6B track 3; $2A/$4B/$67 track 4.
So one player = full part (2-3 voices), two players = each part thinned by one track. Evaluated once at
part start. Other uses: song $05 (title/attract?) mutes its track 3 when $A == 0; songs $06/$07 and
$53-$59 write $A themselves ($53+k-1: `70 0A 01`, then `72 00` stop character k's part in all three sets,
e.g. $53 stops $49 $28 $65); no 68k literal plays $53-$59 (caller unknown, possibly data-driven or unused).

### 4. Voice demand (simulation, approximate)

Base alone (A=0): $27 peak 5 FM + 2 PSG (4 music tracks, prio 10-126); $25 4 FM incl. DAC + noise
(its track 4 uses Ch3-mode patch 57, FM3 only, prio 5); $48+$47 4 FM; $64+$6C 4 FM.
Parts alone: 1-2 FM (A=2: 1 FM, except $2C/$50 2 FM) plus PSG for Nightcrawler (1) and Magneto (2).
Combined peaks: A=1 up to 6 FM / 4 PSG, A=2 up to 7 FM / 6 PSG (Magneto+Magneto on $27, Psylocke+Psylocke
on $48). Stolen/dropped notes appear where pools overflow: $27 with any Magneto part (base PSG track,
prio 10, loses ~30 notes per 48 bars to $2A's PSG prio 110); $27 2+2 / 2+3 / 3+3; $48 3+3 / 7+7; $25 drops
its FM3-only base track notes in most combinations (FM3 taken by part notes with higher priority).
Parts and base therefore compete for the same pools in every song, but by priority, not by fixed channels.

Second machine for P3/P4 (parts $28..$2F only, A=2): peak 4 FM / 4 PSG; only Magneto+Magneto overflows
(PSG 4 > 3). Four players on one machine: 7 FM / 5 PSG demand plus up to 6+4*4 = 22 track slots > 16.

### 5. Implications for a second, audio-only machine

- Parts are separate songs, so a second driver can play P3/P4 parts **without the base track**.
- But tempo is global and only the base song sets it, and the start offset (480 ticks on $27, 384 on $25)
  comes from the base's dispatcher. Simplest faithful scheme: machine 2 plays the *same* base song with
  $B/$C = P3/P4 and $A = 2, and the port mutes machine 2's base tracks (slots with slot+$0E = base id
  ($27/$25/$48/$47/$64/$6C): set bit 1 of slot+6 in Z80 RAM $1B80+$20*i) right after the start command,
  or equivalently drops machine 2's notes owned by those slots. Alternatively write the tempo directly.
- $A should be 2 on both machines whenever two or more players are in, or the part on a machine with one
  part would play its 1P doubling track.

### 6. Dynamic check (not built)

Per frame in the native runner: log Z80 RAM voice tables ($1772..$17B9: byte 0 = channel|free bit7,
byte 1 = owner priority, byte 3 = owner track slot) and the track slots ($1B80+$20*i: +6 flags, +$0E song,
+$0F track), plus YM2612 $28 key-on writes and PSG volume writes; run each stage with $A/$B/$C forced to
the 57 combinations and count per song key-ons and steals. That replaces this simulation's approximations
(voice held for the note length, no release tails, allocator picks the first free voice instead of the
age byte).
