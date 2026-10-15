; ---------------------------------------------------------------------------
; PlayerSelect_Run_P2Beast - PlayerSelect_Run: P2 chose Beast (jt $2B9A)
; In:  none
; Out: none
; Evidence: Sw_065CBC entry 0
; ---------------------------------------------------------------------------
PlayerSelect_Run_P2Beast:
	lea.l	$2B9A(a5),a0
	move.l	$2(a0),g_Player2(a5)
	bra.s	$65D84
