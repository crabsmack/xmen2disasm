; ---------------------------------------------------------------------------
; Player2_StartLife_Psylocke - switch case 4 (Psylocke) of Player2_StartLife
; In:  d7 = character index
; Out: none
; Evidence: jump table $006344 entry 4 -> Player2_SetPsylocke
; ---------------------------------------------------------------------------
Player2_StartLife_Psylocke:
	jsr	Player2_SetPsylocke(pc)
	bra.s	$6372
