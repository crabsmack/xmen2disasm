; ---------------------------------------------------------------------------
; sub_04744E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_04744E:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	tst.b	-$38DE(a5)
	beq.s	loc_04746A
	subq.w	#$2,-$3B32(a5)
	subq.w	#$2,-$3B34(a5)
	subq.w	#$2,-$3B36(a5)
	bra.s	loc_047476
loc_04746A:
	subq.w	#$1,-$3B32(a5)
	subq.w	#$1,-$3B34(a5)
	subq.w	#$1,-$3B36(a5)
loc_047476:
	tst.w	-$3B34(a5)
	bgt.s	loc_0474B2
	move.b	#$1,g_PalBaseDirty(a5)
	move.w	#$4,-$3B34(a5)
	tst.w	-$3B3C(a5)
	beq.s	loc_0474A0
	move.w	#$20A,-$390C(a5)
	move.w	#$24C,-$390A(a5)
	clr.w	-$3B3C(a5)
	bra.s	loc_0474B2
loc_0474A0:
	move.w	#$EEE,-$390C(a5)
	move.w	#$EEE,-$390A(a5)
	move.w	#$1,-$3B3C(a5)
loc_0474B2:
	tst.w	-$3B0E(a5)
	bne.s	loc_0474F0
	tst.w	-$3B36(a5)
	bgt.s	loc_0474F0
	move.b	#$1,g_PalBaseDirty(a5)
	move.w	-$3B38(a5),-$3B36(a5)
	addq.w	#$1,-$3B3E(a5)
	moveq	#$15,d0
	cmp.w	-$3B3E(a5),d0
	bge.s	loc_0474DA
	clr.w	-$3B3E(a5)
loc_0474DA:
	lea.l	$99A(a5),a0
	movea.l	$2(a0),a3
	move.w	-$3B3E(a5),d0
	ext.l	d0
	add.l	d0,d0
	adda.l	d0,a3
	move.w	(a3),-$396C(a5)
loc_0474F0:
	tst.w	-$3B32(a5)
	bgt.w	loc_0475AA
	move.b	#$1,g_PalBaseDirty(a5)
	move.w	#$2,-$3B02(a5)
	move.w	-$3B02(a5),-$3B32(a5)
	tst.w	-$3B04(a5)
	beq.s	loc_04753C
	tst.w	-$3B0A(a5)
	beq.s	loc_04751A
	moveq	#$1,d0
	bra.s	loc_04751C
loc_04751A:
	moveq	#-$1,d0
loc_04751C:
	ext.w	d0
	add.w	d0,-$3B3A(a5)
	moveq	#$5,d0
	cmp.w	-$3B3A(a5),d0
	bge.s	loc_047530
	clr.w	-$3B3A(a5)
	bra.s	loc_04753C
loc_047530:
	tst.w	-$3B3A(a5)
	bge.s	loc_04753C
	move.w	#$5,-$3B3A(a5)
loc_04753C:
	move.w	-$3B0C(a5),d0
	asr.w	#$1,d0
	bmi.s	loc_047586
	cmpi.w	#$4,d0
	bgt.s	loc_047586
	add.w	d0,d0
	move.w	Sw_04744E(pc,d0.w),d0
	jmp	Sw_04744E-2(pc,d0.w)
