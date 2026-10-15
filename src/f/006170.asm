; ---------------------------------------------------------------------------
; Player2_SetPsylocke - make player 2 Psylocke
; In:  none
; Out: none
; Evidence: Player_SetCharacter(jt $2BAA class, g_Player2)
; ---------------------------------------------------------------------------
Player2_SetPsylocke:
	link.w	a6,#$0
	pea.l	g_Player2(a5)
	lea.l	$2BAA(a5),a0
	move.l	$2(a0),-(a7)
	jsr	Player_SetCharacter(pc)
	unlk	a6
	rts
