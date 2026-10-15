; ---------------------------------------------------------------------------
; Player1_SetGambit - make player 1 Gambit
; In:  none
; Out: none
; Evidence: Player_SetCharacter(jt $2BC2 class, g_Player1); index 2 (alphabetical select order)
; ---------------------------------------------------------------------------
Player1_SetGambit:
	link.w	a6,#$0
	pea.l	g_Player1(a5)
	lea.l	$2BC2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	Player_SetCharacter(pc)
	unlk	a6
	rts
