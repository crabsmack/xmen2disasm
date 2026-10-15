; ---------------------------------------------------------------------------
; FloatBubble_Move - vtable +$4E: per-frame movement of a FLOATBUBBLE
; In:  8(a6) = this
; Evidence: slot +$4E of the FLOATBUBBLE descriptor $0AB496; TAS frames 29721-31625 (289 frames active)
; ---------------------------------------------------------------------------
FloatBubble_Move:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$4,d0
	and.w	$8C(a4),d0
	beq.w	loc_0ABE70
	moveq	#$2,d0
	and.w	$8C(a4),d0
	beq.s	loc_0ABC84
	move.w	-$38BC(a5),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	bra.w	loc_0ABE70
loc_0ABC84:
	move.w	$16(a4),$1A(a4)
	move.w	$18(a4),$1C(a4)
	move.w	$16(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	move.w	$18(a4),d0
	ext.l	d0
	add.l	d0,$C(a4)
	move.w	$1E(a4),d0
	add.w	d0,$16(a4)
	move.w	$20(a4),d0
	add.w	d0,$18(a4)
	moveq	#$1,d0
	cmp.w	$E(a6),d0
	bge.s	loc_0ABCE0
	move.w	$16(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	move.w	$18(a4),d0
	ext.l	d0
	add.l	d0,$C(a4)
	move.w	$1E(a4),d0
	add.w	d0,$16(a4)
	move.w	$20(a4),d0
	add.w	d0,$18(a4)
loc_0ABCE0:
	move.w	$16(a4),d0
	cmp.w	$22(a4),d0
	ble.s	loc_0ABCF0
	move.w	$22(a4),$16(a4)
loc_0ABCF0:
	move.w	$22(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	$16(a4),d1
	ext.l	d1
	cmp.l	d1,d0
	ble.s	loc_0ABD0E
	move.w	$22(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$16(a4)
loc_0ABD0E:
	move.w	$18(a4),d0
	cmp.w	$24(a4),d0
	ble.s	loc_0ABD1E
	move.w	$24(a4),$18(a4)
loc_0ABD1E:
	move.w	$24(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	$18(a4),d1
	ext.l	d1
	cmp.l	d1,d0
	ble.s	loc_0ABD3C
	move.w	$24(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$18(a4)
loc_0ABD3C:
	move.l	$8(a4),d6
	sub.l	$94(a4),d6
	move.l	$C(a4),d7
	sub.l	$98(a4),d7
	move.w	$A0(a4),d0
	add.w	d0,$9C(a4)
	move.w	$A2(a4),d0
	add.w	d0,$9E(a4)
	moveq	#$64,d0
	cmp.w	$9C(a4),d0
	bge.s	loc_0ABD6C
	move.w	#$64,$9C(a4)
	bra.s	loc_0ABD7A
loc_0ABD6C:
	moveq	#-$64,d0
	cmp.w	$9C(a4),d0
	ble.s	loc_0ABD7A
	move.w	#$FF9C,$9C(a4)
loc_0ABD7A:
	moveq	#$64,d0
	cmp.w	$9E(a4),d0
	bge.s	loc_0ABD8A
	move.w	#$64,$9E(a4)
	bra.s	loc_0ABD98
loc_0ABD8A:
	moveq	#-$64,d0
	cmp.w	$9E(a4),d0
	ble.s	loc_0ABD98
	move.w	#$FF9C,$9E(a4)
loc_0ABD98:
	cmpi.w	#$60,d6
	ble.s	loc_0ABDA6
	move.w	#$FFFC,$A0(a4)
	bra.s	loc_0ABDB2
loc_0ABDA6:
	cmpi.w	#$FFA0,d6
	bge.s	loc_0ABDB2
	move.w	#$4,$A0(a4)
loc_0ABDB2:
	cmpi.w	#$60,d7
	ble.s	loc_0ABDC0
	move.w	#$FFFD,$A2(a4)
	bra.s	loc_0ABDCC
loc_0ABDC0:
	cmpi.w	#$FFA0,d7
	bge.s	loc_0ABDCC
	move.w	#$3,$A2(a4)
loc_0ABDCC:
	tst.w	$16(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_0ABDDE
	move.w	$16(a4),d0
	ext.l	d0
	bra.s	loc_0ABDE6
loc_0ABDDE:
	move.w	$16(a4),d0
	ext.l	d0
	neg.l	d0
loc_0ABDE6:
	moveq	#$10,d1
	cmp.l	d0,d1
	bgt.s	loc_0ABE0E
	move.w	$16(a4),d0
	ext.l	d0
	move.w	#$8000,d1
	and.w	d0,d1
	move.w	$1A(a4),d0
	ext.l	d0
	move.w	#$8000,d2
	and.w	d0,d2
	eor.w	d2,d1
	moveq	#$0,d0
	move.w	d1,d0
	tst.l	d0
	bls.s	loc_0ABE14
loc_0ABE0E:
	move.l	$8(a4),$94(a4)
loc_0ABE14:
	tst.w	$18(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_0ABE26
	move.w	$18(a4),d0
	ext.l	d0
	bra.s	loc_0ABE2E
loc_0ABE26:
	move.w	$18(a4),d0
	ext.l	d0
	neg.l	d0
loc_0ABE2E:
	moveq	#$10,d1
	cmp.l	d0,d1
	bgt.s	loc_0ABE56
	move.w	$18(a4),d0
	ext.l	d0
	move.w	#$8000,d1
	and.w	d0,d1
	move.w	$1C(a4),d0
	ext.l	d0
	move.w	#$8000,d2
	and.w	d0,d2
	eor.w	d2,d1
	moveq	#$0,d0
	move.w	d1,d0
	tst.l	d0
	bls.s	loc_0ABE5C
loc_0ABE56:
	move.l	$C(a4),$98(a4)
loc_0ABE5C:
	move.w	$9C(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	move.w	$9E(a4),d0
	ext.l	d0
	add.l	d0,$C(a4)
loc_0ABE70:
	movem.l	-$10(a6),d3/d6-d7/a4
	unlk	a6
	rts
