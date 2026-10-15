; ---------------------------------------------------------------------------
; Player1_SetWolverine - make player 1 Wolverine
; In:  none
; Out: none
; Evidence: Player_SetCharacter(jt $2BB2 class, g_Player1); index 5; TAS f018000 Wolverine on screen when g_Player1 = $11369A
; ---------------------------------------------------------------------------
Player1_SetWolverine:
	link.w	a6,#$0
	pea.l	g_Player1(a5)
	lea.l	$2BB2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	Player_SetCharacter(pc)
	unlk	a6
	rts
