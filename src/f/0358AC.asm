; ---------------------------------------------------------------------------
; AvalonA4_ClearCameraZone_case4 - AvalonA4_ClearCameraZone case 4 (mask $10)
; In:  none
; Out: d7 = mask
; Evidence: Sw_035872 target
; ---------------------------------------------------------------------------
AvalonA4_ClearCameraZone_case4:
	moveq	#$10,d7
	bra.s	AvalonA4_ClearCameraZone_apply
