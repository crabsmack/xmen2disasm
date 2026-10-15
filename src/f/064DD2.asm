; ---------------------------------------------------------------------------
; Cerebro_AnimatePalettes_StepB - second palette sequence of Cerebro_AnimatePalettes: advance its timer and dispatch
; In:  none
; Out: none
; Evidence: part of Cerebro_AnimatePalettes before Sw_064DD2
; ---------------------------------------------------------------------------
Cerebro_AnimatePalettes_StepB:
	move.b	#$1,g_PalBaseDirty(a5)
loc_064DD8:
	addq.w	#$1,g_SceneVar3B32(a5)
	moveq	#$3,d0
	cmp.w	g_SceneVar3B32(a5),d0
	bge.w	loc_064E98
	clr.w	g_SceneVar3B32(a5)
	move.w	g_SceneVar3B3A(a5),d0
	bmi.w	Cerebro_AnimatePalettes_EndB
	cmpi.w	#$7,d0
	bgt.w	Cerebro_AnimatePalettes_EndB
	add.w	d0,d0
	move.w	Sw_064DD2(pc,d0.w),d0
	jmp	Sw_064DD2-2(pc,d0.w)
