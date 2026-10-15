; ---------------------------------------------------------------------------
; loc_034F62
; ---------------------------------------------------------------------------
loc_034F62:
	addq.w	#$1,-$3B3A(a5)
	moveq	#$6,d0
	cmp.w	-$3B3A(a5),d0
	bne.s	loc_034F7A
	clr.w	-$3B3A(a5)
	move.b	-$3CB0(a5),d0
	addq.b	#$1,-$3CB0(a5)
loc_034F7A:
	move.w	-$3B34(a5),d0
	subq.w	#$1,-$3B34(a5)
	tst.b	-$38DE(a5)
	beq.s	loc_034F90
	move.w	-$3B34(a5),d0
	subq.w	#$1,-$3B34(a5)
loc_034F90:
	tst.w	-$3B34(a5)
	bgt.w	loc_035184
	move.w	#$4,-$3B34(a5)
	move.b	#$1,g_PalBaseDirty(a5)
	move.w	-$3B3C(a5),d0
	bmi.w	loc_035174
	cmpi.w	#$E,d0
	bgt.w	loc_035174
	add.w	d0,d0
	move.w	Sw_034F62(pc,d0.w),d0
	jmp	Sw_034F62-2(pc,d0.w)
