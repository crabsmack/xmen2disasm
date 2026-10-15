; ---------------------------------------------------------------------------
; PlayerSelect_Run_P2None - PlayerSelect_Run: P2 not playing: clear g_Player2 and g_P2CharIndex
; In:  none
; Out: none
; Evidence: default of Sw_065CBC; also the function's exit
; ---------------------------------------------------------------------------
PlayerSelect_Run_P2None:
	moveq	#$0,d0
	move.l	d0,g_Player2(a5)
	clr.w	-$1844(a5)
	dc.w	$1B7C,$FFFF,$C445	; insn: move.b #$ff, -$3bbb(a5)
	movem.l	-$9E(a6),d4-d7/a3-a4
	unlk	a6
	rts
