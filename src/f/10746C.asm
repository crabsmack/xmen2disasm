; ---------------------------------------------------------------------------
; loc_10746C
; ---------------------------------------------------------------------------
loc_10746C:
	addq.w	#$1,-$3B3C(a5)
	moveq	#$D,d0
	cmp.w	-$3B3C(a5),d0
	bge.s	loc_10747C
	clr.w	-$3B3C(a5)
loc_10747C:
	subq.w	#$1,-$3B36(a5)
	tst.w	-$3B36(a5)
	bge.s	loc_107504
	move.w	#$2,-$3B36(a5)
	move.b	#$1,g_PalBaseDirty(a5)
	move.w	-$3B3E(a5),d0
	bmi.s	loc_1074F4
	cmpi.w	#$7,d0
	bgt.s	loc_1074F4
	add.w	d0,d0
	move.w	$1074A8(pc,d0.w),d0
	jmp	$1074A6(pc,d0.w)
