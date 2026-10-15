; ---------------------------------------------------------------------------
; PlayerSelect_Run_P1Cyclops - PlayerSelect_Run: P1 chose Cyclops or Gambit (jt $2BCA / $2BC2)
; In:  none
; Out: none
; Evidence: Sw_065C5A entries 1 and 2
; ---------------------------------------------------------------------------
PlayerSelect_Run_P1Cyclops:
	lea.l	$2BCA(a5),a0
	move.l	$2(a0),g_Player1(a5)
	bra.s	$65CCC
loc_065C80:
	lea.l	$2BC2(a5),a0
	move.l	$2(a0),g_Player1(a5)
	bra.s	$65CCC
