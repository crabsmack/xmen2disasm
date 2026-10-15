; ---------------------------------------------------------------------------
; sub_13E6EE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_13E6EE:
	link.w	a6,#$FFFC
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	clr.w	-$4(a6)
	movea.l	a3,a4
	lea.l	$E(a4),a4
loc_13E704:
	moveq	#$5,d0
	cmp.w	-$4(a6),d0
	ble.w	loc_13E7FE
	tst.b	$21(a4)
	beq.w	loc_13E7EE
	clr.w	d5
	bra.w	loc_13E7E2
loc_13E71C:
	tst.b	$18(a4,d5.w)
	bne.s	loc_13E72A
	tst.b	$1B(a4,d5.w)
	beq.w	loc_13E7DE
loc_13E72A:
	ext.l	d5
	move.l	d5,d0
	asl.l	#$2,d0
	move.l	(a4,d0.l),d6
	asr.l	#$3,d6
	ext.l	d5
	move.l	d5,d0
	asl.l	#$2,d0
	move.l	$C(a4,d0.l),d7
	asr.l	#$3,d7
	move.b	$1E(a4,d5.w),d0
	lsr.b	#$4,d0
	moveq	#$0,d1
	move.b	d0,d1
	move.w	d1,-$2(a6)
	sub.w	-$348E(a5),d6
	sub.w	-$3490(a5),d7
	move.w	-$2(a6),d0
	ext.l	d0
	lsl.l	#$4,d0
	move.w	d0,d4
	add.w	-$3BB8(a5),d4
	ori.w	#$2000,d4
	moveq	#$1,d0
	and.w	$4(a3),d0
	beq.s	loc_13E77A
	move.l	#$8000,d0
	bra.s	loc_13E77C
loc_13E77A:
	moveq	#$0,d0
loc_13E77C:
	or.w	d0,d4
	cmpi.w	#$FFE0,d6
	ble.s	loc_13E7DE
	cmpi.w	#$140,d6
	bge.s	loc_13E7DE
	cmpi.w	#$FFE0,d7
	ble.s	loc_13E7DE
	cmpi.w	#$E0,d7
	bge.s	loc_13E7DE
	lea.l	g_SpriteTable(a5),a0
	movea.l	-$1FE6(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,-$1FE2(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,-$1FE6(a5)
	move.w	d7,d0
	add.w	#$80,d0
	movea.l	-$1FE6(a5),a0
	move.w	d0,(a0)
	movea.l	-$1FE6(a5),a0
	move.b	#$F,$2(a0)
	movea.l	-$1FE6(a5),a0
	move.w	d4,$4(a0)
	move.w	d6,d0
	add.w	#$80,d0
	movea.l	-$1FE6(a5),a0
	move.w	d0,$6(a0)
loc_13E7DE:
	move.w	d5,d0
	addq.w	#$1,d5
loc_13E7E2:
	moveq	#$0,d0
	move.b	$21(a4),d0
	cmp.w	d5,d0
	bgt.w	loc_13E71C
loc_13E7EE:
	move.w	-$4(a6),d0
	addq.w	#$1,-$4(a6)
	lea.l	$22(a4),a4
	bra.w	loc_13E704
loc_13E7FE:
	movem.l	-$1C(a6),d4-d7/a3-a4
	unlk	a6
	rts
