; ---------------------------------------------------------------------------
; AvalonA4_AnimatePalettes_part4 - part 4 of AvalonA4_AnimatePalettes: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of AvalonA4_AnimatePalettes
; Out: continues in AvalonA4_AnimatePalettes
; Evidence: only reached by branches from AvalonA4_AnimatePalettes
; ---------------------------------------------------------------------------
AvalonA4_AnimatePalettes_part4:
	addq.w	#$1,g_SceneVar3B3A(a5)
	moveq	#$6,d0
	cmp.w	g_SceneVar3B3A(a5),d0
	bne.s	loc_034F7A
	clr.w	g_SceneVar3B3A(a5)
	move.b	g_AvalonA4PalStep(a5),d0
	addq.b	#$1,g_AvalonA4PalStep(a5)
loc_034F7A:
	move.w	g_SceneVar3B34(a5),d0
	subq.w	#$1,g_SceneVar3B34(a5)
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_034F90
	move.w	g_SceneVar3B34(a5),d0
	subq.w	#$1,g_SceneVar3B34(a5)
loc_034F90:
	tst.w	g_SceneVar3B34(a5)
	bgt.w	loc_035184
	move.w	#$4,g_SceneVar3B34(a5)
	move.b	#$1,g_PalBaseDirty(a5)
	move.w	g_SceneVar3B3C(a5),d0
	bmi.w	AvalonA4_AnimatePalettes_part6
	cmpi.w	#$E,d0
	bgt.w	AvalonA4_AnimatePalettes_part6
	add.w	d0,d0
	move.w	Sw_034F62(pc,d0.w),d0
	jmp	Sw_034F62-2(pc,d0.w)
