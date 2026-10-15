; ---------------------------------------------------------------------------
; Player2_SetBeast - make player 2 Beast
; In:  none
; Out: none
; Evidence: Player_SetCharacter(jt $2B9A class, g_Player2); TAS P2 joins as $11339A at frame 49140
; ---------------------------------------------------------------------------
Player2_SetBeast:
	link.w	a6,#$0
	pea.l	g_Player2(a5)
	lea.l	$2B9A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	Player_SetCharacter(pc)
	unlk	a6
	rts
