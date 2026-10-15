; ---------------------------------------------------------------------------
; SpaceB1_CyclePalettes_NextA - SpaceB1_CyclePalettes: advance the first cycle (wrap after 14) and run the second
; In:  -
; Out: -
; Evidence: shared tail of the Sw_1073A8 cases
; ---------------------------------------------------------------------------
SpaceB1_CyclePalettes_NextA:
	addq.w	#$1,g_SceneVar3B3C(a5)
	moveq	#$D,d0
	cmp.w	g_SceneVar3B3C(a5),d0
	bge.s	loc_10747C
	clr.w	g_SceneVar3B3C(a5)
loc_10747C:
	subq.w	#$1,g_SceneVar3B36(a5)
	tst.w	g_SceneVar3B36(a5)
	bge.s	loc_107504
	move.w	#$2,g_SceneVar3B36(a5)
	move.b	#$1,g_PalBaseDirty(a5)
	move.w	g_SceneVar3B3E(a5),d0
	bmi.s	SpaceB1_CyclePalettes_NextB
	cmpi.w	#$7,d0
	bgt.s	SpaceB1_CyclePalettes_NextB
	add.w	d0,d0
	move.w	Sw_10746C(pc,d0.w),d0
	jmp	Sw_10746C-2(pc,d0.w)
