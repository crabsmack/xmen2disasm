; ---------------------------------------------------------------------------
; Player1_SetBeast - make player 1 Beast
; In:  none
; Out: none
; Evidence: Player_SetCharacter(jt $2B9A class, g_Player1); jt $2B9A = Player_CharIndexOf 0; TAS f033600 Beast on screen when g_Player1 = $11339A
; ---------------------------------------------------------------------------
Player1_SetBeast:
	link.w	a6,#$0
	pea.l	g_Player1(a5)
	lea.l	$2B9A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	Player_SetCharacter(pc)
	unlk	a6
	rts
