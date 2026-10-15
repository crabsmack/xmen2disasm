; ---------------------------------------------------------------------------
; PlayerSelect_Run_P2Cyclops - PlayerSelect_Run: P2 chose Cyclops (jt $2BCA)
; In:  none
; Out: none
; Evidence: Sw_065CBC entry 1
; ---------------------------------------------------------------------------
PlayerSelect_Run_P2Cyclops:
	lea.l	$2BCA(a5),a0
	move.l	$2(a0),g_Player2(a5)
	bra.s	$65D84
