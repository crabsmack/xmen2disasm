; ---------------------------------------------------------------------------
; sub_0C0A52	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0C0A52:
	link.w	a6,#$0
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.w	$A8(a3),d0
	ext.l	d0
	move.l	d0,d7
	movea.l	$A4(a3),a0
	move.l	d7,d0
	add.l	d0,d0
	lea.l	$2(a0,d0.l),a4
	move.b	(a4),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,d4
	move.b	$1(a4),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,d5
	movea.l	$96(a3),a0
	move.l	$8(a0),d6
	sub.l	$8(a3),d6
	cmpi.l	#$1400,d6
	ble.s	loc_0C0AA0
	andi.b	#$EF,$2E(a3)
	bra.s	loc_0C0AAE
loc_0C0AA0:
	cmpi.l	#$FFFFEC00,d6
	bge.s	loc_0C0AAE
	ori.b	#$10,$2E(a3)
loc_0C0AAE:
	move.w	$AA(a3),d0
	ext.l	d0
	cmp.l	d7,d0
	ble.w	loc_0C0B60
	move.w	$10(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.b	$B0(a3),d1
	move.l	d4,d2
	lsl.l	d1,d2
	add.l	d0,d2
	move.l	d2,$8(a3)
	move.w	$12(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.b	$B1(a3),d1
	move.l	d5,d2
	lsl.l	d1,d2
	add.l	d0,d2
	move.l	d2,$C(a3)
	moveq	#$0,d0
	move.b	$AF(a3),d0
	tst.l	d0
	bcc.s	loc_0C0B04
	move.b	-$38DE(a5),d0
	move.b	$AF(a3),d1
	lsr.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	sub.w	d0,$A8(a3)
	bra.s	loc_0C0B72
loc_0C0B04:
	addq.w	#$1,$A8(a3)
	moveq	#$0,d0
	move.b	$AF(a3),d0
	tst.l	d0
	tst.b	-$38DE(a5)
	beq.s	loc_0C0B1A
	moveq	#$0,d1
	bra.s	loc_0C0B1C
loc_0C0B1A:
	moveq	#$1,d1
loc_0C0B1C:
	lsl.l	d1,d0
	moveq	#-$1,d1
	cmp.l	d0,d1
	bne.s	loc_0C0B36
	lea.l	sub_0C0A52(pc),a0
	move.l	a0,$5C(a3)
	move.l	a3,-(a7)
	jsr	sub_0C0A52(pc)
	addq.w	#$4,a7
	bra.s	loc_0C0B72
loc_0C0B36:
	moveq	#$0,d0
	move.b	$AF(a3),d0
	tst.l	d0
	tst.b	-$38DE(a5)
	beq.s	loc_0C0B48
	moveq	#$0,d1
	bra.s	loc_0C0B4A
loc_0C0B48:
	moveq	#$1,d1
loc_0C0B4A:
	lsl.l	d1,d0
	move.w	d0,$6C(a3)
	lea.l	sub_0C0A52(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
	bra.s	loc_0C0B72
loc_0C0B60:
	clr.w	$6C(a3)
	lea.l	sub_0C099C(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
loc_0C0B72:
	movem.l	-$18(a6),d4-d7/a3-a4
	unlk	a6
	rts
