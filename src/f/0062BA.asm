; ---------------------------------------------------------------------------
; Player1_StartLife_Gambit - switch case 2 (Gambit) of Player1_StartLife
; In:  d7 = character index
; Out: none
; Evidence: jump table $0062A2 entry 2 -> Player1_SetGambit, then the common tail
; ---------------------------------------------------------------------------
Player1_StartLife_Gambit:
	jsr	Player1_SetGambit(pc)
	bra.s	$62D0
