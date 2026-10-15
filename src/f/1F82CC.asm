; ---------------------------------------------------------------------------
; sub_1F82CC	[jt 2533]
; ---------------------------------------------------------------------------
sub_1F82CC:
	link.w	a6,#$FFF2
	movem.l	d4-d7/a3-a4,-(a7)
	move.w	$E(a6),-$C(a6)
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$3EEA(a5)	; -> Seg_GridCell
	move.w	d0,-$A(a6)
	moveq	#$0,d0
	movea.l	d0,a4
	move.l	d0,-$4(a6)
	addq.w	#$8,a7
loc_1F82FC:
	movea.l	g_SegGridPool(a5),a0
	move.w	-$A(a6),d0
	lea.l	(a0,d0.w),a3
	move.w	-$A(a6),-$8(a6)
	move.b	(a3),-$5(a6)
	bra.w	loc_1F8404
loc_1F8316:
	moveq	#$0,d0
	move.b	-$5(a6),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_Segs(a5),a0
	lea.l	(a0,d0.w),a4
	move.b	$1(a4),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,d7
	move.b	(a4),d0
	ext.w	d0
	move.w	#$80,d1
	and.b	d0,d1
	beq.w	loc_1F83FE
	move.w	$12(a6),d0
	ext.l	d0
	cmp.l	d0,d7
	beq.s	loc_1F837C
	cmpi.w	#$3E9,$12(a6)
	beq.s	loc_1F837C
	cmpi.w	#$3E8,$12(a6)
	bne.w	loc_1F83FE
	moveq	#$21,d0
	cmp.l	d7,d0
	beq.s	loc_1F837C
	moveq	#$22,d0
	cmp.l	d7,d0
	beq.s	loc_1F837C
	moveq	#$23,d0
	cmp.l	d7,d0
	beq.s	loc_1F837C
	moveq	#$24,d0
	cmp.l	d7,d0
	bne.w	loc_1F83FE
loc_1F837C:
	move.w	$8(a4),d5
	move.w	$C(a4),-$E(a6)
	move.w	$A(a4),d6
	move.w	$E(a4),d4
	cmp.w	-$E(a6),d5
	ble.s	loc_1F83A4
	move.w	-$E(a6),d0
	eor.w	d0,d5
	eor.w	d5,-$E(a6)
	move.w	-$E(a6),d0
	eor.w	d0,d5
loc_1F83A4:
	cmp.w	d4,d6
	ble.s	loc_1F83AE
	eor.w	d4,d6
	eor.w	d6,d4
	eor.w	d4,d6
loc_1F83AE:
	move.w	-$E(a6),d0
	ext.l	d0
	ext.l	d5
	sub.l	d5,d0
	moveq	#$6,d1
	cmp.l	d0,d1
	ble.s	loc_1F83C8
	subq.w	#$3,d5
	move.w	d5,d0
	addq.w	#$6,d0
	move.w	d0,-$E(a6)
loc_1F83C8:
	ext.l	d4
	ext.l	d6
	move.l	d4,d0
	sub.l	d6,d0
	moveq	#$6,d1
	cmp.l	d0,d1
	ble.s	loc_1F83DC
	subq.w	#$3,d6
	move.w	d6,d4
	addq.w	#$6,d4
loc_1F83DC:
	cmp.w	$A(a6),d5
	bgt.s	loc_1F83FE
	move.w	$A(a6),d0
	cmp.w	-$E(a6),d0
	bgt.s	loc_1F83FE
	cmp.w	$E(a6),d6
	bgt.s	loc_1F83FE
	cmp.w	$E(a6),d4
	blt.s	loc_1F83FE
	move.l	a4,-$4(a6)
	bra.s	loc_1F8412
loc_1F83FE:
	addq.w	#$1,a3
	move.b	(a3),-$5(a6)
loc_1F8404:
	moveq	#$0,d0
	move.b	-$5(a6),d0
	cmpi.w	#$FF,d0
	bne.w	loc_1F8316
loc_1F8412:
	move.w	g_SegGridShiftY(a5),d0
	moveq	#$1,d1
	lsl.l	d0,d1
	add.w	d1,-$C(a6)
	move.w	-$C(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$3EEA(a5)	; -> Seg_GridCell
	move.w	d0,-$A(a6)
	cmp.w	-$8(a6),d0
	addq.w	#$8,a7
	beq.s	loc_1F8446
	tst.l	-$4(a6)
	beq.w	loc_1F82FC
loc_1F8446:
	move.l	-$4(a6),d0
	movem.l	-$26(a6),d4-d7/a3-a4
	unlk	a6
	rts
