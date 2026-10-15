; ---------------------------------------------------------------------------
; loc_064DD2
; ---------------------------------------------------------------------------
loc_064DD2:
	move.b	#$1,g_PalBaseDirty(a5)
loc_064DD8:
	addq.w	#$1,-$3B32(a5)
	moveq	#$3,d0
	cmp.w	-$3B32(a5),d0
	bge.w	loc_064E98
	clr.w	-$3B32(a5)
	move.w	-$3B3A(a5),d0
	bmi.w	loc_064E82
	cmpi.w	#$7,d0
	bgt.w	loc_064E82
	add.w	d0,d0
	move.w	$64E04(pc,d0.w),d0
	jmp	$64E02(pc,d0.w)
