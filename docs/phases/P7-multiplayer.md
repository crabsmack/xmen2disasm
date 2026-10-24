# Phase 7: online play and four players (definition of done)

approved: 2026-10-21

**Status: criteria approved by the user 2026-10-21, with rulings R1-R10** (asked one by one in the
session, after the kickoff's measurements; the draft of the same day revised with them and with
what phase 6 taught). R11 (2026-10-22) and R12 (2026-10-23) came later; R12 changed the canonical
digest's definition and M3's measurement, with the user's approval. Phase 7 is the user's two stretch goals, as decided on 2026-10-21 (ROADMAP.md "Decisions on
record"): **online play** and **four-player multiplayer**, then the two together. It follows
phase 6 ([P6-enhance.md](P6-enhance.md)). Changing a criterion or a definition below needs the
user's approval, recorded here.

Goal: two to four players on one screen, on one machine or over the network, on the port with no
68000. With four players and netplay off, it is still the proven port (phase 6's checks).

Checked by `uv run tools/phase.py 7` (writes `docs/progress/P7.md`). Phase 6's E6 playtest may
still be open when phase 7 starts (the user's call, as phase 6 started before phase 5's).

## What the earlier phases leave (measured at the kickoff, 2026-10-21)

Three read-only measurements were made for the kickoff (netplay readiness, the characters' video,
the music), in full with their evidence in [P7-kickoff.md](P7-kickoff.md).

1. **Determinism.** The native port is a pure function of its inputs: it equals the reference at
   every sync point of all 76 corpus runs, and the Windows (MSVC) and Linux (GCC) builds give the
   same 51,209 TAS sync rows (P9).
2. **But played runs are not traced runs** (phase 6). A played run gives each frame-tick V-int its
   own Z80 frame (`plat_frame_repeat`, so two players play at 30 Hz with the music at its tempo)
   and reads the V counter from the wall clock (`vcounter_now`, machine.cpp; it seeds player 1's
   random power-on character). Traced runs do neither. Two peers would diverge at once on the V
   counter. Online play needs a machine that is the played one but a function of its inputs only:
   the **session machine** (Definitions).
3. **The corpus covers little in the native machine** (phase 6). The frame-synchronous machine has
   no lag frames, so the TAS desyncs in the first stage: the native corpus reaches Siberia, the
   player select and the four attract-demo stages only. Only `scenario-options-menu` has two
   players alive (3,192 of its 6,070 logic frames). Phase 6 reached every stage with a start-scene
   switch (`XMEN2_DEBUG_SCENE`, `tools/ws_warp.py`: 22 stages). Phase 7 measures with inputs of its
   own from each stage's start (the **stage inputs**).
4. **No savestates, but a small state.** The game owns the loop (`xm_entry_point` never returns;
   `plat_sync_point` writes the row, presents, reads the pads, runs the Z80's frame, calls the
   game's V-int handler on the same stack, renders). Phase 5 removed the engine's fiber; bringing
   one back is cheap (`fiber_compat.c` needs only minicoro; the game C has no setjmp, exceptions or
   heap; it needs `/CETCOMPAT:NO` on MSVC). The state: the arena (64 KB, which holds the
   escaping-locals region) and its store tags (64 KB), `g_machine` (90,576 B: VDP, VRAM, CRAM,
   VSRAM, bus, Z80 RAM, Z80), ~38 machine statics (~200 B), the sound chips (ymfm, PSG, event
   queue: they have `*_rb_save` but are not driven in headless runs), the VDP model's statics, the
   bridge's `g_d0`, the options and widescreen statics. Of 292 writable statics in the runner none
   is in the 3,164 game/c objects. About 250-300 KB with the fiber's stack. `g_machine` holds host
   function pointers (callbacks), scrubbed as the engine's `machine_rb_save` does.
5. **The engine's netplay.** `recomp-net` and `rbengine` (rollback, 1-4 seats, LAN, LAN hub, host
   relay, ICE, lobby client, a link simulator `RNET_SIM_LATENCY_MS/JITTER_MS/LOSS_PCT/SEED`) build
   with MSVC 19.41 and WSL GCC 15; their tests pass on Linux. The game supplies the `RNetRbHost`
   table (snapshot save/load by tick, run one tick, resim begin/end, digests, pad rows). The
   engine's Genesis binding can't be reused (it needs its launcher, `sim_step`, `rb_state` and the
   68000 glue), and its loopback harness is bash/POSIX. Never exercised by the engine: two
   machines, the internet, controllers, ICE, Windows peers, peers built by different compilers.
   **Raw state differs between compilers** (`z80.cyc` is `unsigned long`: 4 bytes on MSVC, 8 on
   GCC; bool bitfields), so Windows and Linux peers compare a canonical digest, not bytes.
6. **Two players are built in.** `g_Player1`/`g_Player2` (240-byte objects at `$FFE9B8`,
   `$FFEAA8`), the `g_P1*`/`g_P2*` globals, `g_PlayersAlive` (0-2), draw-list key bits 1/2,
   `Players_PlaceAtStart`, `Cam_FollowBoth`, the HUD's fixed panels and sprite positions,
   `Player1/2_StartLife`, `Game_SceneLoop`, the select's two cursors. **No two players share a
   character** (the select's cursors skip taken ones; random picks exclude the other's), and
   per-character state lives in single globals that rely on it (`g_GambitCards`, `g_PsylockeFxSpr`,
   the Cyclops beam flicker, Magneto's shot object at `$FFE8AE`). Six characters, seven with
   Magneto: enough for four.
7. **Work RAM is full.** At the TAS's peak the heap's top (`g_HeapTop`) is 3,386 bytes below the
   lowest global, and the 68000 stack lives in that gap.
8. **Video.** All seven heroes, the HUD and common effects use CRAM line 1
   (`Pal_SceneDefaultLine1`); no character has a palette of its own (the friendly-fire cheat moves
   player 2 to line 3). Each player has a fixed VRAM slot of `$64` tiles (`Player_CalcMaxTiles`,
   reserved for both players even in one-player), streamed per animation frame
   (`Spr_UploadFrame` → `VDP_QueueDma`); the busiest scenes have 9-45 tiles left below plane A
   (`$700`). The game's 80-entry sprite table is already full in the two-player Brood fight, and
   two players pass the hardware's 20 sprites / 320 px per line. The HUD panels have "1"/"2" drawn
   into their art (`$FA00-$FFFF`, 48 tiles), with no VRAM left for more.
9. **Music: GEMS 2.8, parts are songs.** The driver is Sega's GEMS 2.8 (the four boot pointers are
   its patch, envelope, sequence and sample banks). Four stage songs start a part song per player:
   track 0 tests `$B` (player 1's character) and track 1 `$C` (player 2's), each starting one of
   seven part songs, once, when the stage song starts:

   | Base song | Stage(s) | Parts (characters 1-7) |
   |---|---|---|
   | `$27` | SiberiaB1 (restarted when player 2 joins) | `$28 $29 $2A $2B $2D $2F $2C`, from tick 480 |
   | `$25` | BaniMazaB2 | the same `$28..$2F`, from tick 384 (Magneto at 0) |
   | `$48` (+ `$47`) | SavageB1 (Jungle 2) | `$49 $4A $4B $4C $4D $4E $50` |
   | `$64` (+ `$6C`) | CloneA1, CloneA2, the clone-death restart | `$65 .. $6B` |

   `$A` (players in play) mutes each part's doubling track when it isn't 1. Parts and the base
   track share the driver's voices (6 FM, 3 PSG, noise, allocated per note by priority) and its
   16 track slots, so four players' parts don't fit one driver. The tempo is global and set by the
   base song, which also times the parts' start. The Jungle 1 and Blizzard hooks' parameter writes
   change nothing until a song restarts.

## Rulings (ruled by the user 2026-10-21, one by one in the session)

- **R1 Netplay library. Ruled: the engine's libraries with our own glue.** Rollback through
  `recomp-net` and `rbengine`, linked into XMen2Native directly, with XMen2Native's own
  `RNetRbHost` table (savestates, run one tick, digests, pad rows). Engine changes go in the
  forks. (Not chosen: our own delay-based lockstep.)
- **R2 Savestates. Ruled: as proposed, internal only.** The game on its own fiber again (the host
  owns the loop: pacing, input and present move out of the game's call stack). A snapshot is the
  fiber's stack and context, the arena and its tags, the machine (VDP, Z80, YM2612, PSG, event
  queue, I/O, timers; host pointers scrubbed), the second sound machine (R9), the four-player
  region (R5), and every runtime static that affects the game, in named sections. In-process only.
  Peers compare the canonical digest (Definitions). No quick save or rewind for players (they can
  come later).
- **R3 Order. Ruled: as proposed.** Savestates, then two players online, then four on one machine,
  then four online.
- **R4 Sources. Ruled: keep the byte matches.** Four-player code goes in native-only branches as
  in phase 6; every file that matched keeps matching. The cost is measured on the first 20 files
  and recorded in NOTES; asked again only if it turns out bad.
- **R5 Memory for players 3 and 4. Ruled: a native region.** Their objects and state live in a
  host-side region outside the 68000's 64 KB, used only with three or more players. The 68000 view
  and every one- and two-player comparison stay unchanged.
- **R6 Video for three or more players. Ruled: extend, no limits.** Extra VRAM tile slots for
  players 3 and 4 in a host-side extension of the VDP model; the game's 80-sprite stop raised in
  native branches; no per-line sprite limits (no flicker). Palettes unchanged: every hero is on
  line 1 already. With one or two players everything is the original.
- **R6a HUD for players 3 and 4. Ruled: built from the ROM's tiles.** At run time, panels for
  players 3 and 4 are made from the user's ROM: the player 1/2 panel art with its digit replaced
  by a "3"/"4" from the game's own font. Nothing ROM-derived is shipped.
- **R7 Four-player rules. Ruled: the two-player rules extended.** No two players share a
  character; no difficulty scaling; the camera keeps the group in view; players are held at the
  screen edges as in two-player; lives per player; players 3 and 4 join with Start as player 2
  does.
- **R8 Transports. Ruled: as proposed.** LAN and direct IP first, then the host relay and ICE (a
  public STUN server). No lobby server.
- **R9 Music for players 3 and 4. Ruled: a second sound machine.** With three or more players in
  play, an audio-only second machine (its own Z80, YM2612 and PSG, the same driver) gets the first
  machine's music commands (play, stop, stop all, pause, resume; parameters with `$B`/`$C` =
  players 3's and 4's characters and `$A` = 2; no sound effects), runs the same stage song with
  that song's own (base) tracks muted in its track slots, so only players 3's and 4's part songs
  sound there, at the base song's tempo and start. `$A` is 2 on both machines whenever two or
  more players are in (the game's count is clamped to the original's 0-2). The host mixes the two.
  The 68000 never sees the second machine (no game state); it is in the snapshot (R2). (Not chosen:
  all parts on one driver, which has 16 track slots and 6 FM voices.)
- **R10 Options online. Ruled: the host's apply to everyone.** The options that change the game
  (`full_rate_2p`, `widescreen`, which changes what activates and the camera's limits, `players`,
  `lives`, `magneto`, `start_char`) and the session seed are the host's, sealed into the session;
  each player keeps their own `high_fps`. In-game toggles that change the game (F10) are refused
  online; F9 (`high_fps`) stays local. A later presentation-only 16:9 would be a local setting (the
  user, 2026-10-21).
- **R11 M4 against the original (ruled by the user 2026-10-22, in the session; QUESTIONS.md "M4's
  bounds").** Three stage inputs couldn't meet M4's bounds for reasons that are the original's
  (AvalonB1's opening pan, SiberiaB1's snow drifts and its own missing panel, Brood aiming at
  players 1-2 by name). Ruled: (a) **off view** relative to the original: each player's `off_view`
  share at most the larger of players 1-2's shares in the `players` 2 run of the same input, plus
  1%; (b) **HUD** relative to the original, join frames skipped: a missing panel counts only where
  the `players` 2 run of the same input draws that player's panel at that frame, and not on the
  first frame of a stretch in play; (c) **enemies aim at all four** (R7 extended): enemies that
  pick players 1-2 by name choose among every player in play.
- **R12 The presentation-only 16:9 view is each seat's own (the user, 2026-10-23, in the session:
  "yes, do it. per player if we can").** After phase 6's R8 (`widescreen=16:9` presentation only by
  default), R10's "a later presentation-only 16:9 would be a local setting" applies: online,
  `widescreen` is each seat's own, like `high_fps`, and F10 works, changing that seat's view from
  the next screen (a rollback keeps the seat's request). With the host's `widescreen_gameplay=1`
  the view changes the game and stays the host's, sealed, and F10 is refused. For seats with
  different views to agree, the canonical digest leaves out the picture's state, the same state
  R8's `--game-rows` leaves out (Definitions); the netplay version became 2.
- *Note (2026-10-24; the user asked for the voice contention fixed "as an option (default on)",
  and for its digest/seal treatment decided by R12's precedent).* `music_voices` (on by default)
  adds two audio-only machines like R9's (a music machine and a parts machine for players 1-2's
  parts) and drops the first machine's music voices on their way to its synthesis. Decided as
  presentation-only state, like R12's view: they are **not in the canonical digest** (the
  Definitions list what is in it; the first machine, R9's second machine and their fields are
  unchanged), and `music_voices` is **not sealed**: each seat's own, like `high_fps`. They are in
  the snapshot (`snd_music`, `snd_parts`), so M2's negative control covers them. The netplay
  version is unchanged (the digest is the same). Measured (xmen2-pc NOTES "music_voices"): digests
  equal with it on and off; two seats with different settings, 0 desyncs under `mid` and `bad`.

## Criteria

| ID | Criterion | Check |
|---|---|---|
| M0 | Criteria approved | this file has a line `approved: YYYY-MM-DD` (user's word only) and the capitalised draft marker is gone from the title |
| M1 | The original is kept | with netplay off and `players` 2: phase 6's E1-E5 pass on the phase-7 sources and runner |
| M2 | Savestates | on every corpus run: at every 300th sync point save, run 60 sync points, restore, run them again on the same inputs: the sync rows and framebuffers are identical both times and equal the run without the probe, and the snapshot saved right after a restore has the same bytes as the one restored. Negative control: leaving any one section out of the restore makes the check fail on a run where that section changes |
| M3 | Two players online, one machine | two processes over loopback through the link simulator, each seat playing its pad of a two-player input (`scenario-options-menu` and the stage inputs of each world): every seat's canonical digest equals the offline session-machine run's at every sync point (0 desyncs), and the host's sync rows equal it; rollbacks happen under latency; the host's options are sealed (R10); a Windows seat against a Linux (WSL) seat passes the same |
| M4 | Four players on one machine | with `players` 4 (and 3): every stage input runs to its end with no fatal and no hang, with all players in play most of the time; each player in play is drawn, has its HUD panel, and is in the view; no sprite is dropped; the second sound machine plays players 3's and 4's parts on every song that has parts, never its base tracks, and is silent with players 3 and 4 out of play; with `players` 2 explicit the TAS equals the run without options |
| M5 | Four players online | four processes over loopback (the LAN hub, the host relay's in-match path), stage inputs with `players` 4: 0 desyncs against the offline session-machine run, and its rows; plus one two-seat session over ICE on loopback |
| M6 | Release and playtest | packages (Windows and Linux) with netplay and `players`, ROM-free as P8/P9; and `docs/USER_VERIFIED.md` (XMen2Recomp) has `multiplayer-verified: YYYY-MM-DD`, written only on the user's word after a two-machine online game and a four-player game |

### Definitions (changing any of them needs the user's approval, recorded here)

- **Session machine**: the played runs' machine (each frame-tick V-int gets its Z80 frame, the
  sound chips run) with the V counter a pure function of the session seed and the runner frame,
  so it depends on its inputs only. Netplay runs in it; `trace --session SEED` runs it headless.
- **Canonical digest**: at each sync point, a hash over work RAM as the 68000 sees it, VRAM,
  CRAM, VSRAM, Z80 RAM, a fixed list of machine fields (VDP registers and latches, Z80 registers,
  YM2612 and PSG registers and timers, I/O) in a fixed byte layout, and with three or more players
  the four-player region and the second sound machine's the same way. The same on every compiler
  (the rows P9 proved equal are part of it). Not in it (R12, the user 2026-10-23): the picture's
  state, which a seat's own 16:9 view changes and nothing deciding the game reads: the sprite
  table and its fill state, the streamer's drawn x, the hologram and beam flicker splices in work
  RAM, VRAM's planes A and B and sprite table, and the view and its F10 request (phase 6's
  `--game-rows`, P6-enhance.md "The game's state"). `digest.csv`: `sync,digest`.
- **Desync**: a sync point where a seat's canonical digest differs from the offline session-machine
  run's of the same inputs and sealed options.
- **Stage inputs**: XMen2Recomp `game/mp_inputs/`: `boot.input` (from power-on) and
  `scene<N>.input` for each stage start of `tools/ws_warp.py --all` (its `WORLDS` and `LATER`
  scenes), in the native input format with four pad columns (`PADS p1 p2 p3 p4`, `WAIT n`).
  Written by the phase's work; checked by what they reach (M4's in-play share), not by their text.
  With `players` 2 pads 3 and 4 do nothing. (Not in `emu/corpus/scenarios/`: the emulator has no
  third pad.)
- **No fatal, no hang**: as phase 6 (the runner exits 0 at the input's end).
- **Link profiles** (the link simulator, on every seat's receive path): `clean` (0/0/0),
  `mid` (latency 50 ms, jitter 10 ms, loss 2%), `bad` (120 ms, 40 ms, 10%), seed 7.

## Where things live

| What | Where |
|---|---|
| Fiber, savestates, digest, netplay glue, second sound machine, four-player video | `XMen2Recomp/platform/native/` |
| Netplay libraries | the engine's `external/recomp-net`, `external/rbengine` (forks; engine changes go there) |
| Four-player game code | `XMen2Recomp/game/c/`, native-only branches (R4) |
| Stage inputs | `XMen2Recomp/game/mp_inputs/` |
| Contract | `XMen2Recomp/tools/xmen2check.py` (`trace --session/--state-probe/--digest/--scene`, `netplay`, `package`) |
| Notes | `XMen2Recomp/docs/NOTES.md` "Phase 7" |

## The contract (extends P6's)

What `phase.py 7` calls in XMen2Recomp. Building these is phase 7's work: until a piece exists,
the criteria that need it fail and name it.

```
XMen2Native --options --json         # as phase 6, plus
    #   "players": {"default": "2", "values": ["2", "3", "4"]}
XMen2Native --netplay --json         # prints {"transports": ["lan", "hub", "ice", ...], "max_seats": 4}, exits 0
xmen2check.py trace --mode native ... # as phase 6, plus:
    # without --replay, the native runner plays --input F by runner frame, as a played run and a
    # netplay seat do (the stage inputs; the offline references of netplay sessions)
    [--session SEED]       # the session machine (Definitions)
    [--scene N]            # start a new game at scene N (XMEN2_DEBUG_SCENE)
    [--digest]             # OUT/digest.csv: sync,digest (the canonical digest), every sync point
    [--state-probe P:L]    # every P-th sync point: save, run L, restore, run L again (below)
    [--state-skip NAME]    # the negative control: that section is left out of every restore
    # the JSON adds "state": {"sections": [names], "bytes": n} when the runner has savestates,
    # and "mp" (counters below) in every native trace
xmen2check.py netplay --seats N --input F [--scene N] [--session SEED] [--options K=V,...]
        [--seat-options I:K=V,...] [--seat-f10 I:TICK,...] [--link latency=L,jitter=J,loss=P,seed=S]
        [--transport lan|hub|ice] [--linux-seats I,...] --out DIR --json
    # N processes of the release runner on loopback, seat i playing pad column i+1 of F (seat 0
    # hosts; options from --options are the host's, --seat-options a seat's own command line;
    # --seat-f10: seat I presses F10 before live tick TICK, R12).
    # Prints {"ok", "seats": [{"seat", "os", "exit", "sync_csv", "digest_csv", "options",
    #   "rollbacks", "max_rollback", "late_frames", "frames"}], "link", "transport"}
    # Each seat writes its sync rows and digest.csv as a traced run does; "options" is the
    # seat's effective values; late_frames: frames presented more than one period late.
xmen2check.py package [--platform P] --json
    # as phase 6, plus "netplay": the packaged runner's --netplay --json
```

`--state-probe P:L` writes `OUT/probe.csv`: `at,pass,sync,<COMPARED>,fb_fnv1a64` (`at` the save
point, `pass` 1 for the run after the save, 2 for the run after the restore) and
`OUT/probe_snap.csv`: `at,saved_sha1,resaved_sha1` (the snapshot saved at `at`, and the one saved
right after restoring it). The trace's `sync.csv` is the live run.

`mp` counters, in every native trace:

| Counter | What |
|---|---|
| `gameplay_frames` | gameplay frames (phase 6's definition) |
| `players_max` | the most players in play at once |
| `in_play` | per player (a list of four counts, players 1-4): gameplay frames in play |
| `drawn` | per player: of those, frames with at least one sprite owned by its object (phase 6's owner tags) |
| `off_view` | per player: of those, frames with its position outside the camera's view |
| `hud_missing` | gameplay frames where a player in play has no HUD panel drawn |
| `sprites_dropped` | sprite entries the game's stop dropped (the original's 80, or R6's raised stop) |
| `snd2` | `{"frames": frames the second machine ran, "songs": {song id: {"part_keyons", "base_keyons"}}}`: key-ons on its YM2612 and PSG, by whether the playing track's song is the base song (muted) or a part; song ids as two hex digits (`"27"`) |

How `phase.py 7` measures each criterion (traces cached by the runner's hash as in phases 5-6;
the session seed is 1):

- **M1**: phase 6's measurement of E1-E5 (`phase6()`), passing when they pass.
- **M2**: every corpus run with `--state-probe 300:60 --fb` and the same run without it. The probe
  run's `sync.csv` equals the plain one (rows and frame hashes); in `probe.csv` each `at`'s pass 1
  and pass 2 rows are equal, and there is one `at` per 300 sync points; in `probe_snap.csv` every
  `saved_sha1` equals its `resaved_sha1`. Negative control: for each section in `state.sections`,
  `--state-skip NAME` with the probe on the TAS in the session machine with `widescreen=16:9`, and
  once `players` exists also on `scene1.input` (Sentinels) with `players` 4: at least one of those
  runs reports a mismatch (rows, frames or snapshot bytes).
- **M3**: sessions of two seats:
  - `scenario-options-menu`'s input under `clean`, `mid` and `bad`;
  - each world's stage input (`players` 2) under `mid`;
  - `scenario-options-menu` under `mid` with the host's `--options
    full_rate_2p=1,widescreen=16:9,lives=inf` and seat 1's own `high_fps=144,widescreen=0`;
  - the same with the host's `widescreen_gameplay=1` added (R12);
  - `scenario-options-menu` under `bad` with the host's `widescreen=16:9` and seat 1 pressing F10
    before tick 600 (`netplay --seat-f10 1:600`, R12);
  - `scenario-options-menu` under `mid` with seat 1 on Linux.

  Each against the offline `trace --session 1 --digest` of the same input and the host's options.
  Every seat exits 0 and its `digest.csv` equals the offline one at every sync point; the host's
  `sync.csv` equals the offline rows; every seat's effective game options are the host's (R10)
  and its `high_fps` its own; its `widescreen` its own (the sealed-options session's seat 1: `0`,
  its command line; the F10 session's seat 1: `16:9`, its F10 from its own default 4:3), but the
  host's with `widescreen_gameplay=1` (R12); the `mid` and `bad` sessions together
  have rollbacks > 0; under `mid`, `late_frames` ≤ 1% of `frames` on every seat.
- **M4**: every stage input with `--options players=4` (and `players=3`), `--session 1`,
  `--scene N` for `scene<N>.input`. Each ends normally. With `players` 4: `in_play` of every player
  ≥ 50% of the run's gameplay frames (the input does what it claims); `drawn` ≥ 50% of `in_play`
  and `off_view` ≤ 1% of it, per player; `hud_missing` 0; `sprites_dropped` 0. With `players` 3
  the same for players 1-3. Music: the `players` 4 runs together reach each base song with parts
  (`$27`, `$25`, `$48` or `$47`, `$64` or `$6C`), and on each `snd2.songs` has `part_keyons` > 0
  and `base_keyons` 0; the same inputs with pads 3 and 4 emptied have `snd2.frames` 0. With
  `--options players=2 --fb` the TAS has the same rows and frames as without options, and
  `snd2.frames` 0.
- **M5**: four seats, transport `hub`, under `mid`, on `boot.input` and each world's stage input
  with `--options players=4`: as M3 (every seat's digests equal the offline run's at every sync
  point, the host's rows equal it). Then two seats, transport `ice`, `clean`, on
  `scenario-options-menu`: the same.
- **M6**: both packages as P8/P9 (ROM-free, built), each runner listing `players` and its
  `--netplay --json` listing `lan`, `hub` and `ice`; and `multiplayer-verified: DATE` in
  XMen2Recomp `docs/USER_VERIFIED.md`.

## How to work it

The phase-6 loop with `/multiplayer-batch`: the worker gate (`tools/gate.py`) after every batch,
notes, `phase.py 7`, commit and push. Order (R3):

1. **M0** approval. **M1** passes from phase 6's result and stays the regression gate.
2. **M2** savestates: the fiber and the host-owned loop first (no trace may change), the section
   table, the probe, the canonical digest, the session machine (`--session`). Measure the fiber's
   stack depth and a replay tick's cost; consider skipping the render in replays (the rows and
   the VDP's sprite flags must still match).
3. **M3** two players online: the `RNetRbHost` table, `xmen2check.py netplay` (a Python driver;
   the engine's harness is bash), the R10 seal, Windows against WSL.
4. **M4** four players: `players`, the R5 region, the stage inputs and the `mp` counters first (so
   every later step is measured), then the joins, the select, the camera, the HUD (R6a), VRAM and
   sprites (R6), the second sound machine (R9). R4's cost after the first 20 files, in NOTES.
5. **M5** four online, ICE on loopback.
6. **M6** packages, then queue the playtest the moment both games play.

Same rules as earlier phases: never weaken a check; engine changes go in the forks; kill runners
only by PID.
