; ---------------------------------------------------------------------------
; AvalonA4_SetCameraZone_case3 - AvalonA4_SetCameraZone case 3 (mask 8)
; In:  none
; Out: d7 = mask
; Evidence: Sw_0358D8 target
; ---------------------------------------------------------------------------
AvalonA4_SetCameraZone_case3:
	moveq	#$8,d7
	bra.s	AvalonA4_SetCameraZone_apply
