; ---------------------------------------------------------------------------
; PlayerSelect_Run_P1Beast - PlayerSelect_Run: P1 chose Beast (class jt $2B9A)
; In:  none
; Out: none
; Evidence: Sw_065C5A entry 0 on g_P1CharIndex
; ---------------------------------------------------------------------------
PlayerSelect_Run_P1Beast:
	lea.l	$2B9A(a5),a0
	move.l	$2(a0),g_Player1(a5)
	bra.s	$65CCC
