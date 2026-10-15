; ---------------------------------------------------------------------------
; Player2_SetWolverine - make player 2 Wolverine
; In:  none
; Out: none
; Evidence: Player_SetCharacter(jt $2BB2 class, g_Player2)
; ---------------------------------------------------------------------------
Player2_SetWolverine:
	link.w	a6,#$0
	pea.l	g_Player2(a5)
	lea.l	$2BB2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	Player_SetCharacter(pc)
	unlk	a6
	rts
