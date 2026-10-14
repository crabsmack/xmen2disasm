; ---------------------------------------------------------------------------
; sub_0B757C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0B757C:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d7
	asr.l	#$8,d7
	move.l	$A6(a4),d7
	asr.l	#$8,d7
	ext.l	d7
	move.w	$12(a4),d0
	ext.l	d0
	move.l	d7,d1
	sub.l	d0,d1
	sge.b	d3
	neg.b	d3
	beq.s	loc_0B75B4
	ext.l	d7
	move.w	$12(a4),d0
	ext.l	d0
	move.l	d7,d1
	sub.l	d0,d1
	bra.s	loc_0B75C2
loc_0B75B4:
	ext.l	d7
	move.w	$12(a4),d0
	ext.l	d0
	move.l	d7,d1
	sub.l	d0,d1
	neg.l	d1
loc_0B75C2:
	move.w	d1,d6
	cmpi.w	#$A,d6
	bge.s	loc_0B75FC
	move.w	$12(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$A6(a4)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	movea.l	$9A(a4),a0
	addq.l	#$2,a0
	move.w	$98(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0B7618
loc_0B75FC:
	cmp.w	$12(a4),d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_0B760E
	move.l	#$100,d0
	bra.s	loc_0B7614
loc_0B760E:
	move.l	#$FFFFFF00,d0
loc_0B7614:
	move.w	d0,$18(a4)
loc_0B7618:
	movem.l	-$10(a6),d3/d6-d7/a4
	unlk	a6
	rts
