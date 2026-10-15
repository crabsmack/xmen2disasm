; ---------------------------------------------------------------------------
; AvalonA4_ClearCameraZone_case5 - AvalonA4_ClearCameraZone case 5 (mask $20)
; In:  none
; Out: d7 = mask
; Evidence: Sw_035872 target
; ---------------------------------------------------------------------------
AvalonA4_ClearCameraZone_case5:
	moveq	#$20,d7
