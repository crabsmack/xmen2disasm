; ---------------------------------------------------------------------------
; sub_15A82A	[jt 2010]
; ---------------------------------------------------------------------------
sub_15A82A:
	link.w	a6,#$0
	movem.l	d3-d7/a3-a4,-(a7)
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	sub_15A7C8(pc)
	move.w	d0,d5
	movea.l	-$3478(a5),a0
	lea.l	(a0,d5.w),a3
	move.b	(a3),d5
	moveq	#$0,d0
	movea.l	d0,a4
	addq.w	#$8,a7
	bra.w	loc_15A8E6
loc_15A85C:
	moveq	#$0,d0
	move.b	d5,d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_Segs(a5),a0
	lea.l	(a0,d0.w),a4
	move.w	$8(a4),d6
	move.w	$C(a4),d7
	cmp.w	d6,d7
	bge.s	loc_15A886
	move.w	$C(a4),d6
	move.w	$8(a4),d7
loc_15A886:
	move.w	$A(a4),d0
	cmp.w	$E(a4),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_15A89A
	move.w	$A(a4),d0
	bra.s	loc_15A89E
loc_15A89A:
	move.w	$E(a4),d0
loc_15A89E:
	move.w	d0,d4
	move.b	$2(a4),d0
	ext.w	d0
	cmp.w	$12(a6),d0
	bgt.s	loc_15A8E2
	move.b	(a4),d0
	ext.w	d0
	move.w	#$80,d1
	and.b	d0,d1
	beq.s	loc_15A8E2
	cmp.w	$E(a6),d4
	bgt.s	loc_15A8E2
	ext.l	d4
	move.w	$16(a6),d0
	ext.l	d0
	add.l	d4,d0
	move.w	$E(a6),d1
	ext.l	d1
	cmp.l	d1,d0
	ble.s	loc_15A8E2
	cmp.w	$A(a6),d6
	bgt.s	loc_15A8E2
	cmp.w	$A(a6),d7
	blt.s	loc_15A8E2
	move.l	a4,d0
	bra.s	loc_15A8F4
loc_15A8E2:
	addq.w	#$1,a3
	move.b	(a3),d5
loc_15A8E6:
	moveq	#$0,d0
	move.b	d5,d0
	cmpi.w	#$FF,d0
	bne.w	loc_15A85C
	moveq	#$0,d0
loc_15A8F4:
	movem.l	-$1C(a6),d3-d7/a3-a4
	unlk	a6
	rts
