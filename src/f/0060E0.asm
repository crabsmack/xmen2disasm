; ---------------------------------------------------------------------------
; Player1_SetPsylocke - make player 1 Psylocke
; In:  none
; Out: none
; Evidence: Player_SetCharacter(jt $2BAA class, g_Player1); index 4 (alphabetical order of the select screen, confirmed for 0, 3, 5)
; ---------------------------------------------------------------------------
Player1_SetPsylocke:
	link.w	a6,#$0
	pea.l	g_Player1(a5)
	lea.l	$2BAA(a5),a0
	move.l	$2(a0),-(a7)
	jsr	Player_SetCharacter(pc)
	unlk	a6
	rts
