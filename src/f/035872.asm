; ---------------------------------------------------------------------------
; AvalonA4_ClearCameraZone - drop camera zone N and restore the camera; meant to clear bit 1<<N of g_SceneVar3B02 but uses logical NOT, so any N clears all bits
; In:  8(a6) = word zone 0-5
; Out: none
; Evidence: switch Sw_035872 -> d7 = 1<<N; seq/neg/ext/and.w d3,g_SceneVar3B02 (C 'flags &= !mask'); g_Camera +$3A
; ---------------------------------------------------------------------------
AvalonA4_ClearCameraZone:
	link.w	a6,#$0
	movem.l	d3/d7,-(a7)
	move.w	$A(a6),d0
	bmi.s	AvalonA4_ClearCameraZone_apply
	cmpi.w	#$5,d0
	bgt.s	AvalonA4_ClearCameraZone_apply
	add.w	d0,d0
	move.w	Sw_035872(pc,d0.w),d0
	jmp	Sw_035872-2(pc,d0.w)
