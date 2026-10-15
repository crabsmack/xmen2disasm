; ---------------------------------------------------------------------------
; PlayerSelect_Run_P1Psylocke - PlayerSelect_Run: P1 chose Psylocke (jt $2BAA)
; In:  none
; Out: none
; Evidence: Sw_065C5A entry 4
; ---------------------------------------------------------------------------
PlayerSelect_Run_P1Psylocke:
	lea.l	$2BAA(a5),a0
	move.l	$2(a0),g_Player1(a5)
	bra.s	$65CCC
