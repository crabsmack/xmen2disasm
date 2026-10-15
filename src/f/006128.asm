; ---------------------------------------------------------------------------
; Player1_SetCyclops - make player 1 Cyclops
; In:  none
; Out: none
; Evidence: Player_SetCharacter(jt $2BCA class, g_Player1); index 1; Cyclops is the no-input power-on character
; ---------------------------------------------------------------------------
Player1_SetCyclops:
	link.w	a6,#$0
	pea.l	g_Player1(a5)
	lea.l	$2BCA(a5),a0
	move.l	$2(a0),-(a7)
	jsr	Player_SetCharacter(pc)
	unlk	a6
	rts
