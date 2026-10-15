; ---------------------------------------------------------------------------
; PlayerSelect_Run_P1Wolverine - PlayerSelect_Run: P1 chose Wolverine (jt $2BB2)
; In:  none
; Out: none
; Evidence: Sw_065C5A entry 5
; ---------------------------------------------------------------------------
PlayerSelect_Run_P1Wolverine:
	lea.l	$2BB2(a5),a0
	move.l	$2(a0),g_Player1(a5)
	bra.s	$65CCC
