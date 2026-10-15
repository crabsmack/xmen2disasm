; ---------------------------------------------------------------------------
; PlayerSelect_Run_P1Magneto - PlayerSelect_Run: P1 chose Magneto (jt $2BBA)
; In:  none
; Out: none
; Evidence: Sw_065C5A entry 6
; ---------------------------------------------------------------------------
PlayerSelect_Run_P1Magneto:
	lea.l	$2BBA(a5),a0
	move.l	$2(a0),g_Player1(a5)
	bra.s	$65CCC
