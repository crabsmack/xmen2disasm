; ---------------------------------------------------------------------------
; Player2_SetCyclops - make player 2 Cyclops
; In:  none
; Out: none
; Evidence: Player_SetCharacter(jt $2BCA class, g_Player2)
; ---------------------------------------------------------------------------
Player2_SetCyclops:
	link.w	a6,#$0
	pea.l	g_Player2(a5)
	lea.l	$2BCA(a5),a0
	move.l	$2(a0),-(a7)
	jsr	Player_SetCharacter(pc)
	unlk	a6
	rts
