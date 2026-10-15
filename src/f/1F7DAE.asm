; ---------------------------------------------------------------------------
; sub_1F7DAE	[jt 2530]
; ---------------------------------------------------------------------------
sub_1F7DAE:
	link.w	a6,#$FFFA
	movem.l	d3-d7/a3-a4,-(a7)
	move.w	$E(a6),d4
	move.w	#$4E20,-$2(a6)
	moveq	#$0,d0
	movea.l	d0,a3
	movea.l	$8(a6),a0
	move.l	$8(a0),d5
	asr.l	#$8,d5
	move.l	$C(a0),d6
	asr.l	#$8,d6
	lea.l	g_Segs(a5),a4
	clr.w	-$6(a6)
	lea.l	g_Segs(a5),a4
	bra.w	loc_1F7ED8
loc_1F7DE4:
	move.b	$1(a4),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,d7
	move.b	(a4),d0
	ext.w	d0
	move.w	#$80,d1
	and.b	d0,d1
	beq.w	loc_1F7ECC
	ext.l	d4
	cmp.l	d4,d7
	beq.s	loc_1F7E2A
	cmpi.w	#$3E9,d4
	beq.s	loc_1F7E2A
	cmpi.w	#$3E8,d4
	bne.w	loc_1F7ECC
	moveq	#$21,d0
	cmp.l	d7,d0
	beq.s	loc_1F7E2A
	moveq	#$22,d0
	cmp.l	d7,d0
	beq.s	loc_1F7E2A
	moveq	#$23,d0
	cmp.l	d7,d0
	beq.s	loc_1F7E2A
	moveq	#$24,d0
	cmp.l	d7,d0
	bne.w	loc_1F7ECC
loc_1F7E2A:
	move.w	$8(a4),d0
	ext.l	d0
	move.w	$C(a4),d1
	ext.l	d1
	add.l	d0,d1
	asr.l	#$1,d1
	ext.l	d5
	sub.l	d5,d1
	sge.b	d3
	neg.b	d3
	beq.s	loc_1F7E5A
	move.w	$8(a4),d0
	ext.l	d0
	move.w	$C(a4),d1
	ext.l	d1
	add.l	d0,d1
	asr.l	#$1,d1
	ext.l	d5
	sub.l	d5,d1
	bra.s	loc_1F7E70
loc_1F7E5A:
	move.w	$8(a4),d0
	ext.l	d0
	move.w	$C(a4),d1
	ext.l	d1
	add.l	d0,d1
	asr.l	#$1,d1
	ext.l	d5
	sub.l	d5,d1
	neg.l	d1
loc_1F7E70:
	move.w	$A(a4),d0
	ext.l	d0
	move.w	$E(a4),d2
	ext.l	d2
	add.l	d0,d2
	asr.l	#$1,d2
	ext.l	d6
	sub.l	d6,d2
	sge.b	d3
	neg.b	d3
	beq.s	loc_1F7EA0
	move.w	$A(a4),d0
	ext.l	d0
	move.w	$E(a4),d2
	ext.l	d2
	add.l	d0,d2
	asr.l	#$1,d2
	ext.l	d6
	sub.l	d6,d2
	bra.s	loc_1F7EB6
loc_1F7EA0:
	move.w	$A(a4),d0
	ext.l	d0
	move.w	$E(a4),d2
	ext.l	d2
	add.l	d0,d2
	asr.l	#$1,d2
	ext.l	d6
	sub.l	d6,d2
	neg.l	d2
loc_1F7EB6:
	add.w	d1,d2
	move.w	d2,d0
	move.w	d0,-$4(a6)
	cmp.w	-$2(a6),d0
	bge.s	loc_1F7ECC
	move.w	-$4(a6),-$2(a6)
	movea.l	a4,a3
loc_1F7ECC:
	move.w	-$6(a6),d0
	addq.w	#$1,-$6(a6)
	lea.l	$14(a4),a4
loc_1F7ED8:
	move.w	-$6(a6),d0
	cmp.w	g_SegHighWater(a5),d0
	ble.w	loc_1F7DE4
	move.l	a3,d0
	beq.s	loc_1F7F2E
	movea.l	$8(a6),a0
	andi.w	#$EFFF,$4(a0)
	move.l	a3,$76(a0)
	moveq	#-$1,d0
	cmp.w	$12(a6),d0
	bne.s	loc_1F7F0C
	move.l	$8(a6),-(a7)
	move.l	a3,-(a7)
	jsr	Seg_ComputeObjPos(pc)
	addq.w	#$8,a7
	bra.s	loc_1F7F1C
loc_1F7F0C:
	move.w	$12(a6),d0
	ext.l	d0
	lsl.l	#$8,d0
	movea.l	$8(a6),a0
	move.l	d0,$72(a0)
loc_1F7F1C:
	move.l	$8(a6),-(a7)
	jsr	sub_1F6D76(pc)
	move.l	$8(a6),-(a7)
	jsr	$4DD2(a5)	; -> Obj_UpdateBoxes
	addq.w	#$8,a7
loc_1F7F2E:
	movem.l	-$22(a6),d3-d7/a3-a4
	unlk	a6
	rts
