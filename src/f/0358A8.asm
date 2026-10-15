; ---------------------------------------------------------------------------
; AvalonA4_ClearCameraZone_case3 - AvalonA4_ClearCameraZone case 3 (mask 8)
; In:  none
; Out: d7 = mask
; Evidence: Sw_035872 target
; ---------------------------------------------------------------------------
AvalonA4_ClearCameraZone_case3:
	moveq	#$8,d7
	bra.s	AvalonA4_ClearCameraZone_apply
