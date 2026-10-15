; ---------------------------------------------------------------------------
; SpaceB1_CyclePalettes - SpaceB1: two colour cycles (14 steps every 4 frames, 8 steps every 3) written through switch tables
; In:  none
; Out: none
; Evidence: Sw_1073A8/Sw_10746C write palette words, g_PalBaseDirty; TAS 35054-37013
; ---------------------------------------------------------------------------
SpaceB1_CyclePalettes:
	link.w	a6,#$0
	move.l	a4,-(a7)
	lea.l	g_PalBase(a5),a4
	subq.w	#$1,-$3B34(a5)
	tst.w	-$3B34(a5)
	bge.w	loc_10747C
	move.w	#$3,-$3B34(a5)
	move.b	#$1,g_PalBaseDirty(a5)
	move.w	-$3B3C(a5),d0
	bmi.w	SpaceB1_CyclePalettes_NextA
	cmpi.w	#$D,d0
	bgt.w	SpaceB1_CyclePalettes_NextA
	add.w	d0,d0
	move.w	Sw_1073A8(pc,d0.w),d0
	jmp	Sw_1073A8-2(pc,d0.w)
