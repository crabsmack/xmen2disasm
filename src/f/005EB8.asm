; ---------------------------------------------------------------------------
; Game_PlayAttractDemo - common tail of the attract demos: set P1 class, health $900, demo input pointer, run the scene with sound muted, then reset players
; In:  d7 = scene id, a3 = demo input data, a4 = character class (from Game_AttractDemo*)
; Out: none (returns into Game_SceneLoop)
; Evidence: sets -$3A1E = demo input pointer (read in (duration, buttons) pairs by sub_1F9DE8) and -$3A1A = 1 (demo active); -$18AC = 1 during the scene (sound commands suppressed); idle run plays demos after the title
; ---------------------------------------------------------------------------
Game_PlayAttractDemo:
	addq.w	#$1,g_AttractDemoNum(a5)
	move.l	a4,g_Player1(a5)
	move.w	#$900,g_P1Health(a5)
	move.l	a3,g_DemoInput(a5)
	move.b	#$1,g_DemoActive(a5)
	move.w	d7,g_SceneIndex(a5)
	lea.l	Scene_PreLoadReset(pc),a0
	move.l	a0,-$38E8(a5)
	lea.l	Scene_PostLoadVram(pc),a0
	move.l	a0,-$38EC(a5)
	move.b	#$1,g_SndMute(a5)
	move.l	d7,d0
	asl.w	#$3,d0
	lea.l	g_SceneTable(a5),a0
	movea.l	$4(a0,d0.w),a1
	jsr	(a1)
	clr.b	g_SndMute(a5)
	jsr	$4ACA(a5)	; -> Cyclops_ResetBeams
	tst.b	-$38C6(a5)
	beq.s	loc_005F0C
	ori.w	#$2,-$3C5E(a5)
loc_005F0C:
	jsr	Game_ResetPlayers(pc)
loc_005F10:
	clr.b	-$38C2(a5)
	bra.w	loc_005CF8
