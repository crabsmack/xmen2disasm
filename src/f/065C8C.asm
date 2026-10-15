; ---------------------------------------------------------------------------
; PlayerSelect_Run_P1Nightcrawler - PlayerSelect_Run: P1 chose Nightcrawler (jt $2BA2)
; In:  none
; Out: none
; Evidence: Sw_065C5A entry 3
; ---------------------------------------------------------------------------
PlayerSelect_Run_P1Nightcrawler:
	lea.l	$2BA2(a5),a0
	move.l	$2(a0),g_Player1(a5)
	bra.s	$65CCC
