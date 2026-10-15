; ---------------------------------------------------------------------------
; Scroll_ComputeParallax - fill the line/column scroll buffers from the current parallax descriptor and camera position
; In:  none
; Out: none
; Evidence: walks the g_ParallaxDesc(a5) descriptor records, writes longs at g_HScrollBuf(a5) ($FFF63A) per scanline band and column words at -$646; called by Scroll_UpdateParallax
; ---------------------------------------------------------------------------
Scroll_ComputeParallax:
	move.l	g_ParallaxDesc(a5),d0
	bne.s	loc_15FD16
	rts
loc_15FD16:
	movem.l	d2-d7/a2-a4,-(a7)
	movea.l	d0,a4
	lea.l	-$846(a5),a3
	lea.l	g_HScrollBuf(a5),a2
	moveq	#$0,d7
	move.b	$1(a4),d7
	addq.w	#$2,a4
	cmpi.b	#$32,-$2(a4)
	beq.s	loc_15FD50
	move.w	-$3AC8(a5),d6
loc_15FD38:
	sub.w	$2(a4),d6
	bmi.s	loc_15FD4C
	addq.w	#$8,a4
	addq.w	#$4,a3
	dbra	d7,loc_15FD38
	beq.w	loc_16009A
	bra.s	loc_15FD38
loc_15FD4C:
	add.w	$2(a4),d6
loc_15FD50:
	move.b	(a4),d0
	beq.s	loc_15FD78
	cmpi.b	#$1,d0
	beq.w	loc_15FE20
	cmpi.b	#$2,d0
	beq.w	loc_15FE94
	cmpi.b	#$3,d0
	beq.w	loc_15FF36
	cmpi.b	#$4,d0
	beq.w	loc_15FFD4
	bra.w	loc_16009A
loc_15FD78:
	movea.l	g_ParallaxDesc(a5),a0
	cmpi.b	#$32,(a0)
	beq.s	loc_15FDEC
	move.w	d6,d5
	neg.w	d5
	move.w	d5,d4
	add.w	$2(a4),d4
	tst.w	d5
	bpl.s	loc_15FD92
	moveq	#$0,d5
loc_15FD92:
	cmpi.w	#$E0,d4
	ble.s	loc_15FD9C
	move.w	#$E0,d4
loc_15FD9C:
	move.w	d4,d3
	sub.w	d5,d3
	move.w	$4(a4),d1
	move.w	-$3AC2(a5),d0
	mulu.w	d1,d0
	lsr.l	#$8,d0
	neg.w	d0
	andi.w	#$1FF,d0
	swap	d0
	move.w	-$3AC2(a5),d0
	neg.w	d0
	andi.w	#$1FF,d0
	swap	d0
	move.w	d3,d1
	asr.w	#$3,d1
	bra.s	loc_15FDD6
loc_15FDC6:
	move.l	d0,(a2)+
	move.l	d0,(a2)+
	move.l	d0,(a2)+
	move.l	d0,(a2)+
	move.l	d0,(a2)+
	move.l	d0,(a2)+
	move.l	d0,(a2)+
	move.l	d0,(a2)+
loc_15FDD6:
	dbra	d1,loc_15FDC6
	move.w	d3,d1
	andi.w	#$7,d1
	bra.s	loc_15FDE4
loc_15FDE2:
	move.l	d0,(a2)+
loc_15FDE4:
	dbra	d1,loc_15FDE2
	bra.w	loc_16006E
loc_15FDEC:
	move.w	$2(a4),d3
	move.w	$4(a4),d1
	move.w	-$3AC4(a5),d0
	mulu.w	d1,d0
	lsr.l	#$8,d0
	move.w	-$34A0(a5),d1
	ext.l	d1
	add.l	d1,d0
	swap	d0
	move.w	-$3AC4(a5),d0
	add.w	-$3AD4(a5),d0
	andi.w	#$FF,d0
	swap	d0
	subq.w	#$1,d3
loc_15FE16:
	move.l	d0,(a2)+
	dbra	d3,loc_15FE16
	bra.w	loc_16006E
loc_15FE20:
	move.w	d6,d2
	neg.w	d2
	move.w	d2,d3
	add.w	$2(a4),d3
	tst.w	d2
	bpl.s	loc_15FE30
	moveq	#$0,d2
loc_15FE30:
	cmpi.w	#$E0,d3
	ble.s	loc_15FE3A
	move.w	#$E0,d3
loc_15FE3A:
	sub.w	d2,d3
	move.w	$4(a4),d1
	move.w	-$3AC2(a5),d0
	mulu.w	d1,d0
	lsr.l	#$8,d0
	move.w	d0,d4
	move.l	(a3),d5
	move.w	-$3AC2(a5),d0
	muls.w	d0,d5
	asl.l	#$8,d4
	asl.l	#$4,d4
	tst.w	d6
	ble.s	loc_15FE6C
	move.l	d5,d0
	swap	d0
	muls.w	d6,d0
	swap	d4
	add.w	d0,d4
	swap	d4
	move.w	d5,d0
	muls.w	d6,d0
	add.l	d0,d4
loc_15FE6C:
	move.w	-$3AC2(a5),d0
	neg.w	d0
	andi.w	#$1FF,d0
	swap	d0
	subq.w	#$1,d3
loc_15FE7A:
	move.l	d4,d1
	asr.l	#$8,d1
	asr.l	#$4,d1
	move.w	d1,d0
	neg.w	d0
	andi.w	#$1FF,d0
	move.l	d0,(a2)+
	add.l	d5,d4
	dbra	d3,loc_15FE7A
	bra.w	loc_16006E
loc_15FE94:
	movea.l	g_ParallaxDesc(a5),a0
	cmpi.b	#$32,(a0)
	beq.s	loc_15FF0C
	move.w	d6,d5
	neg.w	d5
	move.w	d5,d4
	add.w	$2(a4),d4
	tst.w	d5
	bpl.s	loc_15FEAE
	moveq	#$0,d5
loc_15FEAE:
	cmpi.w	#$E0,d4
	ble.s	loc_15FEB8
	move.w	#$E0,d4
loc_15FEB8:
	move.w	d4,d3
	sub.w	d5,d3
	move.b	$7(a4),d1
	ext.w	d1
	move.w	-$3AC2(a5),d0
	mulu.w	d1,d0
	lsr.l	#$8,d0
	move.w	d0,d2
	asl.w	#$6,d2
	move.w	-$3AC2(a5),d0
	neg.w	d0
	andi.w	#$1FF,d0
	swap	d0
	move.w	(a3),d0
	sub.w	$4(a4),d0
	move.w	d0,(a3)
	add.w	d0,d2
	move.w	$2(a3),d1
	move.b	$6(a4),d0
	ext.w	d0
	sub.w	d0,d1
	move.w	d1,$2(a3)
	subq.w	#$1,d3
loc_15FEF6:
	move.w	d2,d0
	asr.w	#$6,d0
	neg.w	d0
	andi.w	#$1FF,d0
	move.l	d0,(a2)+
	add.w	d1,d2
	dbra	d3,loc_15FEF6
	bra.w	loc_16006E
loc_15FF0C:
	move.w	$2(a4),d3
	move.w	(a3),d0
	add.w	$6(a4),d0
	move.w	d0,(a3)
	asr.w	#$6,d0
	swap	d0
	move.w	-$3AC4(a5),d0
	add.w	-$3AD4(a5),d0
	andi.w	#$FF,d0
	swap	d0
	subq.w	#$1,d3
loc_15FF2C:
	move.l	d0,(a2)+
	dbra	d3,loc_15FF2C
	bra.w	loc_16006E
loc_15FF36:
	move.w	d6,d5
	neg.w	d5
	move.w	d5,d4
	add.w	$2(a4),d4
	move.w	#$0,-(a7)
	tst.w	d5
	bpl.s	loc_15FF4C
	move.w	d5,(a7)
	moveq	#$0,d5
loc_15FF4C:
	cmpi.w	#$E0,d4
	ble.s	loc_15FF56
	move.w	#$E0,d4
loc_15FF56:
	move.w	d4,d3
	sub.w	d5,d3
	move.w	$4(a4),d1
	move.w	-$3AC2(a5),d0
	mulu.w	d1,d0
	lsr.l	#$8,d0
	move.w	d0,d2
	move.w	-$3AC2(a5),d0
	neg.w	d0
	andi.w	#$1FF,d0
	swap	d0
	movea.l	g_ParallaxDesc(a5),a1
	adda.w	$6(a4),a1
	move.w	$2(a3),d1
	move.w	(a3),d0
	subq.w	#$1,d0
	bgt.s	loc_15FF94
	moveq	#$0,d0
	move.b	$1(a1),d0
	addq.w	#$1,d1
	cmp.b	(a1),d1
	blt.s	loc_15FF94
	moveq	#$0,d1
loc_15FF94:
	move.w	d0,(a3)
	move.w	d1,$2(a3)
	movea.l	d0,a0
	move.w	(a7)+,d0
	tst.w	d0
	beq.s	loc_15FFB4
	move.w	d2,-(a7)
	moveq	#$0,d2
	move.b	(a1),d2
	sub.w	d0,d1
loc_15FFAA:
	cmp.w	d2,d1
	blt.s	loc_15FFB2
	sub.w	d2,d1
	bra.s	loc_15FFAA
loc_15FFB2:
	move.w	(a7)+,d2
loc_15FFB4:
	move.l	a0,d0
	subq.w	#$1,d3
loc_15FFB8:
	move.b	$2(a1,d1.w),d0
	ext.w	d0
	add.w	d2,d0
	neg.w	d0
	andi.w	#$1FF,d0
	move.l	d0,(a2)+
	addq.w	#$1,d1
	cmp.b	(a1),d1
	blt.s	loc_15FFD0
	moveq	#$0,d1
loc_15FFD0:
	dbra	d3,loc_15FFB8
loc_15FFD4:
	movea.l	g_ParallaxDesc(a5),a0
	cmpi.b	#$32,(a0)
	beq.s	loc_160048
	move.w	d6,d5
	neg.w	d5
	move.w	d5,d4
	add.w	$2(a4),d4
	tst.w	d5
	bpl.s	loc_15FFEE
	moveq	#$0,d5
loc_15FFEE:
	cmpi.w	#$E0,d4
	ble.s	loc_15FFF8
	move.w	#$E0,d4
loc_15FFF8:
	move.w	d4,d3
	sub.w	d5,d3
	move.b	$7(a4),d1
	ext.w	d1
	moveq	#$0,d0
	mulu.w	d1,d0
	lsr.l	#$8,d0
	move.w	d0,d2
	asl.w	#$6,d2
	move.w	-$3AC2(a5),d0
	neg.w	d0
	andi.w	#$1FF,d0
	swap	d0
	move.w	(a3),d0
	sub.w	$4(a4),d0
	move.w	d0,(a3)
	add.w	d0,d2
	move.w	$2(a3),d1
	move.b	$6(a4),d0
	ext.w	d0
	sub.w	d0,d1
	move.w	d1,$2(a3)
	subq.w	#$1,d3
loc_160034:
	move.w	d2,d0
	asr.w	#$6,d0
	neg.w	d0
	andi.w	#$1FF,d0
	move.l	d0,(a2)+
	add.w	d1,d2
	dbra	d3,loc_160034
	bra.s	loc_16006E
loc_160048:
	move.w	$2(a4),d3
	move.w	(a3),d0
	add.w	$6(a4),d0
	move.w	d0,(a3)
	asr.w	#$6,d0
	swap	d0
	move.w	-$3AC4(a5),d0
	add.w	-$3AD4(a5),d0
	andi.w	#$FF,d0
	swap	d0
	subq.w	#$1,d3
loc_160068:
	move.l	d0,(a2)+
	dbra	d3,loc_160068
loc_16006E:
	movea.l	g_ParallaxDesc(a5),a0
	cmpi.b	#$32,(a0)
	beq.s	loc_160090
	sub.w	$2(a4),d6
	cmpi.w	#$FF20,d6
	bls.s	loc_16009A
	addq.w	#$8,a4
	addq.w	#$4,a3
	dbra	d7,loc_15FD38
	bne.w	loc_15FD50
	beq.s	loc_16009A
loc_160090:
	addq.w	#$8,a4
	addq.w	#$4,a3
	subq.w	#$1,d7
	bne.w	loc_15FD50
loc_16009A:
	movem.l	(a7)+,d2-d7/a2-a4
	rts
