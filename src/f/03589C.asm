; ---------------------------------------------------------------------------
; AvalonA4_ClearCameraZone_case0 - AvalonA4_ClearCameraZone cases 0-2 (mask 1, 2, 4)
; In:  none
; Out: d7 = mask
; Evidence: Sw_035872 targets
; ---------------------------------------------------------------------------
AvalonA4_ClearCameraZone_case0:
	moveq	#$1,d7
	bra.s	AvalonA4_ClearCameraZone_apply
loc_0358A0:
	moveq	#$2,d7
	bra.s	AvalonA4_ClearCameraZone_apply
loc_0358A4:
	moveq	#$4,d7
	bra.s	AvalonA4_ClearCameraZone_apply
