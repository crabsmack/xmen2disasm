; ---------------------------------------------------------------------------
; AvalonA4_SetCameraZone_case0 - AvalonA4_SetCameraZone cases 0-2 (mask 1, 2, 4)
; In:  none
; Out: d7 = mask
; Evidence: Sw_0358D8 targets
; ---------------------------------------------------------------------------
AvalonA4_SetCameraZone_case0:
	moveq	#$1,d7
	bra.s	AvalonA4_SetCameraZone_apply
loc_03595A:
	moveq	#$2,d7
	bra.s	AvalonA4_SetCameraZone_apply
loc_03595E:
	moveq	#$4,d7
	bra.s	AvalonA4_SetCameraZone_apply
