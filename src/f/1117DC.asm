; ---------------------------------------------------------------------------
; Deathbird_SetMoveMode_Case0 - Deathbird_SetMoveMode case 0: stop
; In:  inside Deathbird_SetMoveMode
; Out: -
; Evidence: Sw_1117A0 target
; ---------------------------------------------------------------------------
Deathbird_SetMoveMode_Case0:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	clr.b	$AE(a4)
	bra.w	$111BA0
