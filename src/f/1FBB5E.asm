; ---------------------------------------------------------------------------
; sub_1FBB5E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1FBB5E:
	link.w	a6,#$FFFC
	movem.l	d2-d7/a2-a4,-(a7)
	cmpi.w	#$50,-$1FE2(a5)
	bge.w	loc_1FBCC4
	moveq	#$0,d2
	movea.l	$8(a6),a0
	movea.l	$2(a0),a2
	move.b	(a0),d1
	move.b	$A(a0),d2
	bmi.w	loc_1FBCC4
	movea.l	-$1FE6(a5),a1
	moveq	#$0,d5
	move.w	$16(a6),d7
	sf.b	-$2(a6)
	sf.b	-$3(a6)
	moveq	#$0,d4
	move.b	d1,d4
	ror.l	#$3,d4
	swap	d4
	btst	#$4,d1
	beq.s	loc_1FBBAC
	st.b	-$2(a6)
	ori.w	#$800,d4
loc_1FBBAC:
	btst	#$3,d1
	beq.s	loc_1FBBBA
	st.b	-$3(a6)
	ori.w	#$1000,d4
loc_1FBBBA:
	lea.l	$24(a2),a3
	lsl.w	#$2,d2
	adda.w	d2,a3
	lsl.w	#$2,d2
	adda.w	d2,a3
	movea.l	a2,a4
	adda.w	$12(a3),a4
	bra.w	loc_1FBCAC
loc_1FBBD0:
	andi.w	#$7FF,d7
	or.w	d4,d7
	move.w	$4(a4),d2
	move.w	d2,d6
	andi.w	#$F,d6
	move.w	d6,d3
	ror.l	#$8,d6
	add.w	d3,d3
	andi.w	#$1800,d2
	eor.w	d2,d7
	swap	d7
	move.w	(a4),d7
	move.w	$2(a4),d6
	tst.b	-$2(a6)
	beq.s	loc_1FBC00
	neg.w	d7
	sub.w	$1FBC16(pc,d3.w),d7
loc_1FBC00:
	add.w	$E(a6),d7
	tst.b	-$3(a6)
	beq.s	loc_1FBC10
	neg.w	d6
	sub.w	$1FBC36(pc,d3.w),d6
loc_1FBC10:
	add.w	$12(a6),d6
	bra.s	loc_1FBC76
