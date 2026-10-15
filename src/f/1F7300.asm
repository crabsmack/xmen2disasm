; ---------------------------------------------------------------------------
; Seg_CollideBlock - collide an object's box with a solid block segment (types $13-$1C): choose the smaller push-out, out of the top/bottom or the sides
; In:  8(a6) = object  $C(a6) = segment  $10(a6) = contact record
; Out: d0 = 1 no contact, 2 contact, 3 below
; Evidence: vertical push (flag 8 = landing on top) or horizontal push, each clipped to +-127; a block carried by an object (+$12) moving up is skipped; neighbour segments of the one stood on don't push sideways
; ---------------------------------------------------------------------------
Seg_CollideBlock:
	link.w	a6,#$0
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$C(a6),a3
	movea.l	$10(a6),a4
	movea.l	$8(a6),a0
	move.w	$4E(a0),d0
	ext.l	d0
	move.w	$52(a0),d1
	ext.l	d1
	add.l	d0,d1
	move.l	d1,d7
	asr.l	#$1,d7
	move.w	$4C(a0),d0
	ext.l	d0
	move.w	$50(a0),d1
	ext.l	d1
	add.l	d0,d1
	move.l	d1,d5
	asr.l	#$1,d5
	move.w	$52(a0),d0
	ext.l	d0
	move.w	$4E(a0),d1
	ext.l	d1
	move.l	d0,d5
	sub.l	d1,d5
	move.w	$A(a3),d0
	cmp.w	$E(a3),d0
	blt.s	loc_1F735C
	move.w	$E(a3),d4
	move.w	$A(a3),d6
	bra.s	loc_1F7364
loc_1F735C:
	move.w	$A(a3),d4
	move.w	$E(a3),d6
loc_1F7364:
	movea.l	$8(a6),a0
	cmp.w	$4C(a0),d6
	bgt.s	loc_1F7374
	moveq	#$1,d0
	bra.w	loc_1F761E
loc_1F7374:
	movea.l	$8(a6),a0
	move.w	$4E(a0),d0
	cmp.w	$C(a3),d0
	blt.s	loc_1F7388
	moveq	#$1,d0
	bra.w	loc_1F761E
loc_1F7388:
	movea.l	$8(a6),a0
	move.w	$52(a0),d0
	cmp.w	$8(a3),d0
	bge.s	loc_1F739C
	moveq	#$1,d0
	bra.w	loc_1F761E
loc_1F739C:
	movea.l	$8(a6),a0
	cmp.w	$50(a0),d4
	blt.s	loc_1F73AC
	moveq	#$3,d0
	bra.w	loc_1F761E
loc_1F73AC:
	cmp.w	$C(a3),d7
	bge.w	loc_1F7464
	cmp.w	$8(a3),d7
	blt.w	loc_1F7464
	move.w	$E(a3),d0
	ext.l	d0
	movea.l	$8(a6),a0
	move.w	$4C(a0),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	movea.l	$8(a6),a0
	move.w	$50(a0),d0
	ext.l	d0
	move.w	$A(a3),d1
	ext.l	d1
	move.l	d0,d6
	sub.l	d1,d6
	moveq	#$7F,d0
	cmp.l	d7,d0
	bge.s	loc_1F73EC
	moveq	#$7F,d7
loc_1F73EC:
	moveq	#-$7F,d0
	cmp.l	d7,d0
	ble.s	loc_1F73F4
	moveq	#-$7F,d7
loc_1F73F4:
	moveq	#$7F,d0
	cmp.l	d6,d0
	bge.s	loc_1F73FC
	moveq	#$7F,d6
loc_1F73FC:
	moveq	#-$7F,d0
	cmp.l	d6,d0
	ble.s	loc_1F7404
	moveq	#-$7F,d6
loc_1F7404:
	tst.l	d7
	ble.s	loc_1F7464
	tst.l	d6
	beq.s	loc_1F7458
	cmp.l	d7,d6
	ble.s	loc_1F7458
	moveq	#-$2,d0
	cmp.b	$12(a3),d0
	beq.s	loc_1F7452
	moveq	#$40,d0
	and.w	(a4),d0
	beq.s	loc_1F7452
	move.b	$12(a3),d0
	ext.w	d0
	cmpi.w	#$FF,d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F7432
	moveq	#$0,d0
	bra.s	loc_1F7444
loc_1F7432:
	move.b	$12(a3),d0
	ext.w	d0
	ext.l	d0
	movea.l	g_ObjTable(a5),a0
	asl.l	#$2,d0
	move.l	(a0,d0.l),d0
loc_1F7444:
	movea.l	d0,a0
	tst.w	$18(a0)
	bge.s	loc_1F7452
	moveq	#$1,d0
	bra.w	loc_1F761E
loc_1F7452:
	move.b	d7,$4(a4)
	bra.s	loc_1F7464
loc_1F7458:
	ori.w	#$8,(a4)
	move.l	d6,d0
	neg.l	d0
	move.b	d0,$4(a4)
loc_1F7464:
	moveq	#$C,d4
	movea.l	$8(a6),a0
	move.w	#$1000,d0
	and.w	$4(a0),d0
	moveq	#$0,d1
	move.w	d0,d1
	tst.l	d1
	beq.s	loc_1F747C
	clr.w	d4
loc_1F747C:
	movea.l	$8(a6),a0
	move.w	$4C(a0),d0
	cmp.w	$E(a3),d0
	bge.s	loc_1F7500
	move.w	$50(a0),d0
	ext.l	d0
	ext.l	d4
	sub.l	d4,d0
	move.w	$A(a3),d1
	ext.l	d1
	cmp.l	d0,d1
	bgt.s	loc_1F7500
	move.w	$C(a3),d0
	ext.l	d0
	movea.l	$8(a6),a0
	move.w	$4E(a0),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	movea.l	$8(a6),a0
	move.w	$52(a0),d0
	ext.l	d0
	move.w	$8(a3),d1
	ext.l	d1
	move.l	d0,d6
	sub.l	d1,d6
	moveq	#$7F,d0
	cmp.l	d7,d0
	bge.s	loc_1F74CE
	moveq	#$7F,d7
loc_1F74CE:
	moveq	#-$7F,d0
	cmp.l	d7,d0
	ble.s	loc_1F74D6
	moveq	#-$7F,d7
loc_1F74D6:
	moveq	#$7F,d0
	cmp.l	d6,d0
	bge.s	loc_1F74DE
	moveq	#$7F,d6
loc_1F74DE:
	moveq	#-$7F,d0
	cmp.l	d6,d0
	ble.s	loc_1F74E6
	moveq	#-$7F,d6
loc_1F74E6:
	tst.l	d7
	ble.s	loc_1F7500
	tst.l	d6
	ble.s	loc_1F7500
	cmp.l	d7,d6
	ble.s	loc_1F74F8
	move.b	d7,$3(a4)
	bra.s	loc_1F7500
loc_1F74F8:
	move.l	d6,d0
	neg.l	d0
	move.b	d0,$3(a4)
loc_1F7500:
	tst.b	$3(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_1F7512
	move.b	$3(a4),d0
	ext.w	d0
	bra.s	loc_1F751A
loc_1F7512:
	move.b	$3(a4),d0
	ext.w	d0
	neg.w	d0
loc_1F751A:
	ext.l	d0
	move.l	d0,d7
	tst.b	$4(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_1F7530
	move.b	$4(a4),d0
	ext.w	d0
	bra.s	loc_1F7538
loc_1F7530:
	move.b	$4(a4),d0
	ext.w	d0
	neg.w	d0
loc_1F7538:
	ext.l	d0
	move.l	d0,d6
	moveq	#$0,d0
	move.b	$10(a3),d0
	cmpi.w	#$FF,d0
	beq.s	loc_1F7568
	moveq	#$0,d0
	move.b	$10(a3),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_Segs(a5),a0
	adda.w	d0,a0
	movea.l	$8(a6),a1
	cmpa.l	$76(a1),a0
	beq.s	loc_1F7594
loc_1F7568:
	moveq	#$0,d0
	move.b	$11(a3),d0
	cmpi.w	#$FF,d0
	beq.s	loc_1F759A
	moveq	#$0,d0
	move.b	$11(a3),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_Segs(a5),a0
	adda.w	d0,a0
	movea.l	$8(a6),a1
	cmpa.l	$76(a1),a0
	bne.s	loc_1F759A
loc_1F7594:
	moveq	#$0,d7
	clr.b	$3(a4)
loc_1F759A:
	tst.l	d7
	beq.s	loc_1F75F0
	ext.l	d5
	move.l	d5,d0
	addq.l	#$3,d0
	cmp.l	d7,d0
	blt.s	loc_1F75F0
	tst.l	d6
	beq.s	loc_1F75F0
	ext.l	d5
	move.l	d5,d0
	addq.l	#$3,d0
	cmp.l	d6,d0
	blt.s	loc_1F75F0
	moveq	#$42,d0
	and.w	(a4),d0
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$42,d0
	cmp.l	d1,d0
	beq.s	loc_1F75F0
	moveq	#$2,d0
	and.w	(a4),d0
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$2,d0
	cmp.l	d1,d0
	bne.s	loc_1F75D8
	moveq	#$0,d7
	clr.b	$3(a4)
loc_1F75D8:
	moveq	#$40,d0
	and.w	(a4),d0
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$40,d0
	cmp.l	d1,d0
	bne.s	loc_1F75F0
	moveq	#$0,d6
	clr.b	$4(a4)
	andi.w	#$FFF7,(a4)
loc_1F75F0:
	tst.l	d7
	beq.s	loc_1F760E
	tst.l	d6
	beq.s	loc_1F760E
	cmp.l	d7,d6
	bge.s	loc_1F7604
	moveq	#$0,d7
	clr.b	$3(a4)
	bra.s	loc_1F760E
loc_1F7604:
	moveq	#$0,d6
	clr.b	$4(a4)
	andi.w	#$FFF7,(a4)
loc_1F760E:
	move.b	$4(a4),d0
	or.b	$3(a4),d0
	beq.s	loc_1F761C
	moveq	#$2,d0
	bra.s	loc_1F761E
loc_1F761C:
	moveq	#$1,d0
loc_1F761E:
	movem.l	-$1C(a6),d3-d7/a3-a4
	unlk	a6
	rts
