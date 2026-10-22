# Phase 7: online play and four players (DRAFT definition of done)

**Status: DRAFT, 2026-10-21.** Phase 7 is the user's two stretch goals, as decided on
2026-10-21 (ROADMAP.md "Decisions on record"): **online play** and **four-player multiplayer**,
then the two together. It follows phase 6 ([P6-enhance.md](P6-enhance.md)). This draft becomes
the criteria when the user approves it (M0): until then, `uv run tools/phase.py 7` reports M0
failing and measures nothing else. It will be revised at its kickoff with what phase 6 taught.
Rulings R1-R9 below are proposals, each with the default a session takes until the user rules
(docs/QUESTIONS.md).

Goal: two to four players on one screen, on one machine or over the network, on the port with no
68000. With four-player and netplay off, it is still the proven port.

Checked by `uv run tools/phase.py 7` (writes `docs/progress/P7.md`). Requires phase 6 complete.

## What the earlier phases leave (measured 2026-10-21)

1. **Determinism.** The native port is a pure function of its inputs: it equals the reference at
   every sync point of all 76 corpus runs, and the Windows (MSVC) and Linux (GCC) builds give the
   same 51,209 TAS sync rows. That is what lockstep and rollback netplay need.
2. **No savestates yet.** The game runs on the main thread, and the frame is shown from inside
   the sync point (`plat_sync_point` in `platform/native/machine.cpp`), so the game's own call
   stack is part of its state. The engine's netplay snapshots a suspended game fiber for this
   reason. The native runner dropped the fiber in phase 5.
3. **The engine's netplay.** `segagenesisrecomp` has rollback netplay for Sonic 2 (`docs/NETPLAY.md`;
   libraries `external/recomp-net` and `external/rbengine`): 1-4 seats plus spectators, LAN, a LAN
   hub, a host relay and ICE, a lobby, a session config seal, a partitioned state digest, and a
   determinism probe (`GENESIS_RB_PROBE`) with a statics finder and a mutation self-test. By its
   own notes it has run as processes on one machine over loopback, never between two machines or
   over the internet, and never with controllers.
4. **Two players are built in.** `g_Player1` and `g_Player2` are fixed 240-byte objects
   (`$FFE9B8`, `$FFEAA8`) named in about 180 game files: enemy targeting, hits, the camera's
   two-player follow (`Cam_FollowBoth`), the HUD, scene scripts, the player select.
5. **Work RAM is nearly full.** At the TAS's peak, the heap's top (`g_HeapTop`, `$FFB7E0`) is
   3,386 bytes below the lowest global (`$FFC51A`), and the 68000 stack lives in that gap.
6. **Video limits.** The Genesis has four 16-colour palettes and 64 KB of VRAM, shared by the
   level and both players. How each character's art and palette are placed is not yet measured.
7. **The stage music follows the players.** `Music_PlayStage` (every stage's RunScene) and the
   Jungle 1, Jungle 2 and Blizzard frame hooks (31 of every 32 frames) call
   `Music_SetPlayerParams`, which sets three parameters of the Z80 sound driver (command `$1B`):
   `$A` the number of players in play (0-2), `$B` and `$C` player 1's and player 2's character
   (`Player_MusicVoice`: 1-7, 0 = not in play). Each player's character adds its own part over
   the stage's base track, both parts in two-player (the user, 2026-10-21). Which songs have
   parts, on which channels, and what `$A` changes are in the song data and not yet measured.
   The driver has slots for two players only, and one YM2612 (6 FM channels) and PSG (4) play the
   base track and both parts. The command set (`$0B` + four ROM pointers at boot, `$10` play,
   `$12` stop, `$16` stop all, `$1B` parameter) looks like Sega's GEMS driver, whose songs test
   such parameters with conditional jumps (not yet confirmed). The native port still runs the
   original driver on the engine's Z80 and sound chips (`platform/native/machine.cpp`).

## Rulings (to ask at M0; the default stands until the user rules)

- **R1 Netplay library.** Use the engine's `recomp-net` and `rbengine` (rollback) in XMen2Native.
  Alternative: our own delay-based lockstep (simpler, no savestates, a few frames of input lag).
- **R2 Savestates.** A full snapshot at a sync point: the game on its own fiber again (the host
  owns the loop), and the snapshot is the fiber's stack and registers, work RAM and its store
  tags, the escaping-locals stack region, the machine (VDP, Z80, YM2612, PSG, I/O, timers) and
  every static the runtime keeps. In-process only: rollback restores on the same machine, so host
  addresses on the fiber stack stay valid. Player-facing quick save and rewind come for free, but
  are left out of the release unless the user wants them.
- **R3 Order.** Online with two players first (the original game's modes), then four players on
  one machine, then four players online.
- **R4 Sources for four players.** Phase 6's R2 asks to keep every byte match through native-only
  branches. Four players touch about 180 files, so ask again here: (a) keep the native-only
  branches (every proof stays; the sources get harder to read), or (b) tag the proven tree and
  let the four-player sources diverge, keeping the corpus comparison with four-player off as the
  regression gate. Default: (a) on the first 20 files, with the cost measured and recorded in
  NOTES, then ask again with that measurement.
- **R5 Memory for players 3 and 4.** Their objects and state live in a native extension region
  outside the 68000 image (the 64 KB has no room). Not exported: there is no reference for
  four-player play to compare against.
- **R6 Video for four players.** Extra palettes and tile memory are host-side extensions of the
  renderer (the VDP model's host palette and host sprite hooks), used only with four players.
- **R7 Four-player rules.** What the original's two-player mode does, extended: the same
  character choice rules as two players, no difficulty scaling, the camera follows the group's
  bounding box, and players stop at the screen edges as two players do. Lives and continues per
  player as in two-player.
- **R8 Transports.** LAN and direct IP first, then the host relay and ICE with a public STUN
  server. No lobby server (`recomp-net-server`) until the user says who hosts one.
- **R9 Music for four players.** Required by the user (2026-10-21): players 3 and 4 add their
  characters' parts to the stage music as players 1 and 2 do. Proposal: a second sound machine
  (the same driver on its own Z80, YM2612 and PSG, audio only, used only with three or more
  players). It gets the first machine's music commands (play, stop, stop all, pause, resume,
  parameters; no sound effects, so nothing interrupts its parts), with `$B` and `$C` set to
  players 3's and 4's characters, and the host mixes in only its part channels: the base track
  plays once, from the first machine. Which channels carry the parts, per song, and what `$A`
  should be on the second machine are measured at the kickoff. The 68000 never sees the second
  machine, so it changes no game state; it is in the savestate (R2) so a rollback restores its
  sound with the rest. Alternative: an edited song bank with four player slots (more channels
  than one chip has). Where a song's parts share channels with its base track, players 3 and 4
  add nothing on that song, and NOTES lists those songs.

## Criteria

| ID | Criterion | Check |
|---|---|---|
| M0 | Criteria approved | this file has a line `approved: YYYY-MM-DD` (user's word only) and the capitalised draft marker is gone from the title |
| M1 | The original is kept | with netplay and four players off: phase 6's E1-E5 pass on the phase-7 sources and runner |
| M2 | Savestates | on the TAS and every corpus run: save at every 300th sync point, run 60 sync points, restore, replay the same inputs: the sync rows and framebuffers are identical both times, and restoring then saving again gives the same snapshot bytes. Negative control: leaving out any one section of the snapshot makes the check fail |
| M3 | Netplay on one machine | two processes over loopback through the link simulator (delay, jitter and loss settings recorded), each seat replaying its pad of a two-player corpus input: 0 desyncs (state digest compared every frame), and the host's sync rows equal the offline reference's at every sync point. Also Windows against Linux (WSL), the same check |
| M4 | Four players on one machine | with `players` 4: a scripted four-pad scenario plays each level's first scene to its end with no fatal and no hang, all four players are drawn with their own palettes, the HUD shows four, the camera keeps all four in view; on every stage song with parts (R9), the second sound machine's part channels are not silent with four characters and silent with players 3 and 4 out of play; and with `players` 2 or less, M1 holds (the second machine never runs) |
| M5 | Four players online | four processes over loopback (host relay), four-pad scenario inputs: 0 desyncs, and every process ends in the same state digest as the offline run of the same inputs |
| M6 | Release and playtest | packages (Windows and Linux) with netplay and four players, ROM-free as P8/P9; and `docs/USER_VERIFIED.md` (XMen2Recomp) has `multiplayer-verified: YYYY-MM-DD`, written only on the user's word after a two-machine online game and a four-player game |

### Definitions (changing any of them needs the user's approval, recorded here)

- **State digest**: a hash of the snapshot's sections (R2), computed at every sync point, the
  engine's partitioned digest applied to the native port's snapshot.
- **Desync**: two processes of one session with different digests at the same sync point.
- **Four-pad scenario**: a scenario file with four pads' input (the corpus format, extended), in
  `emu/corpus/scenarios/`, played only by the native port (the emulator has no four-player game).

## Where things live

| What | Where |
|---|---|
| Fiber, savestates, netplay glue | `XMen2Recomp/platform/native/` |
| Netplay libraries | the engine's `external/recomp-net`, `external/rbengine` (forks; engine changes go there) |
| Four-player game code | `XMen2Recomp/game/c/` under R4 |
| Notes | `XMen2Recomp/docs/NOTES.md` "Phase 7" |

## How to work it

The phase-6 loop. At the kickoff (M0), revise this draft with what phase 6 taught, measure how
the characters' art and palettes are placed (point 6 above) and which songs have player parts on
which channels (point 7: each stage song played with every `$A`/`$B`/`$C` value, channels
compared), and ask the rulings. Then M2
(savestates; they also make the native side of the corpus check faster, LESSONS.md), M3, M4, M5,
M6.
