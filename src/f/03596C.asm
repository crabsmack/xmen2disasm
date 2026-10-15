; ---------------------------------------------------------------------------
; AvalonA4_SetCameraZone_apply - tail of AvalonA4_SetCameraZone: or the mask into g_SceneVar3B02
; In:  d7 = mask
; Out: none
; Evidence: common exit of the Sw_0358D8 cases
; ---------------------------------------------------------------------------
AvalonA4_SetCameraZone_apply:
	or.w	d7,g_SceneVar3B02(a5)
	movem.l	-$10(a6),d3/d5-d7
	unlk	a6
	rts
