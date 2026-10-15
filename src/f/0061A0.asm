; ---------------------------------------------------------------------------
; Player2_SetGambit - make player 2 Gambit
; In:  none
; Out: none
; Evidence: Player_SetCharacter(jt $2BC2 class, g_Player2)
; ---------------------------------------------------------------------------
Player2_SetGambit:
	link.w	a6,#$0
	pea.l	g_Player2(a5)
	lea.l	$2BC2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	Player_SetCharacter(pc)
	unlk	a6
	rts
