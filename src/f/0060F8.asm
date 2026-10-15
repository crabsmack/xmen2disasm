; ---------------------------------------------------------------------------
; Player1_SetNightcrawler - make player 1 Nightcrawler
; In:  none
; Out: none
; Evidence: Player_SetCharacter(jt $2BA2 class, g_Player1); index 3; TAS (U+D at power-on gets Nightcrawler) g_Player1 = $113496 from frame 180
; ---------------------------------------------------------------------------
Player1_SetNightcrawler:
	link.w	a6,#$0
	pea.l	g_Player1(a5)
	lea.l	$2BA2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	Player_SetCharacter(pc)
	unlk	a6
	rts
