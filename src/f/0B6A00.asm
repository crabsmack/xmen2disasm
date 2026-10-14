; ---------------------------------------------------------------------------
; sub_0B6A00	[jt 924]
; ---------------------------------------------------------------------------
sub_0B6A00:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
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
	bge.s	loc_0B6A5C
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
loc_0B6A5C:
	move.l	$8(a4),d7
	asr.l	#$8,d7
	cmp.w	$96(a4),d7
	bge.s	loc_0B6A7E
	move.w	$96(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
	bra.s	loc_0B6A98
loc_0B6A7E:
	cmp.w	$98(a4),d7
	ble.s	loc_0B6A98
	move.w	$98(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
loc_0B6A98:
	move.l	$C(a4),d6
	asr.l	#$8,d6
	move.w	$4C(a4),d0
	cmp.w	$50(a4),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_0B6AB2
	move.w	$4C(a4),d0
	bra.s	loc_0B6AB6
loc_0B6AB2:
	move.w	$50(a4),d0
loc_0B6AB6:
	move.w	d0,d7
	cmp.w	$9C(a4),d7
	bge.s	loc_0B6B06
	move.w	$9C(a4),d0
	ext.l	d0
	move.w	$50(a4),d1
	ext.l	d1
	move.w	$4C(a4),d2
	ext.l	d2
	sub.l	d2,d1
	sge.b	d3
	neg.b	d3
	beq.s	loc_0B6AE8
	move.w	$50(a4),d1
	ext.l	d1
	move.w	$4C(a4),d2
	ext.l	d2
	sub.l	d2,d1
	bra.s	loc_0B6AF8
loc_0B6AE8:
	move.w	$50(a4),d1
	ext.l	d1
	move.w	$4C(a4),d2
	ext.l	d2
	sub.l	d2,d1
	neg.l	d1
loc_0B6AF8:
	add.l	d0,d1
	lsl.l	#$8,d1
	move.l	d1,$C(a4)
	clr.w	$18(a4)
	bra.s	loc_0B6B20
loc_0B6B06:
	cmp.w	$9A(a4),d6
	ble.s	loc_0B6B20
	move.w	$9A(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	clr.w	$18(a4)
	clr.w	$20(a4)
loc_0B6B20:
	movem.l	-$10(a6),d3/d6-d7/a4
	unlk	a6
	rts
