; ---------------------------------------------------------------------------
; Game_ResetPlayers - new game: both players out (no character, health 0), 9 lives each, scene = first stage
; In:  none
; Out: none
; Evidence: sets g_P1Lives/g_P2Lives = 9, g_P1CharIndex/g_P2CharIndex = $FF, clears both player vtables/flags, g_SceneIndex = Siberia scene id (-$3B70); TAS RAM: lives 9 at frame 60
; ---------------------------------------------------------------------------
Game_ResetPlayers:
	link.w	a6,#$0
	clr.w	g_P1Health(a5)
	dc.w	$1B7C,$FFFF,$C444	; insn: move.b #$ff, -$3bbc(a5)
	moveq	#$0,d0
	move.l	d0,g_Player1(a5)
	clr.w	g_Player1+$4(a5)
	move.w	#$9,g_P1Lives(a5)
	clr.w	g_P2Health(a5)
	dc.w	$1B7C,$FFFF,$C445	; insn: move.b #$ff, -$3bbb(a5)
	move.l	d0,g_Player2(a5)
	clr.w	g_Player2+$4(a5)
	move.w	#$9,g_P2Lives(a5)
	moveq	#$0,d1
	move.b	g_ScnSiberiaB1(a5),d1
	move.w	d1,g_SceneIndex(a5)
	move.b	#$1,g_SceneIndexSet(a5)
	unlk	a6
	rts
