; ---------------------------------------------------------------------------
; AvalonA4_SetCameraZone_case4 - AvalonA4_SetCameraZone cases 4-5 (mask $10, $20)
; In:  none
; Out: d7 = mask
; Evidence: Sw_0358D8 targets
; ---------------------------------------------------------------------------
AvalonA4_SetCameraZone_case4:
	moveq	#$10,d7
	bra.s	AvalonA4_SetCameraZone_apply
loc_03596A:
	moveq	#$20,d7
