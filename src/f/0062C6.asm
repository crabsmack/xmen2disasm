; ---------------------------------------------------------------------------
; Player1_StartLife_Psylocke - switch case 4 (Psylocke) of Player1_StartLife
; In:  d7 = character index
; Out: none
; Evidence: jump table $0062A2 entry 4 -> Player1_SetPsylocke
; ---------------------------------------------------------------------------
Player1_StartLife_Psylocke:
	jsr	Player1_SetPsylocke(pc)
	bra.s	$62D0
