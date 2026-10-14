; ---------------------------------------------------------------------------
; sub_09B55C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_09B55C:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d7
	asr.l	#$8,d7
	clr.b	$90(a4)
	ext.l	d7
	move.w	-$348E(a5),d0
	ext.l	d0
	moveq	#$30,d1
	add.l	d1,d0
	cmp.l	d7,d0
	ble.s	loc_09B58C
	move.w	-$348E(a5),d6
	add.w	#$30,d6
	bra.s	loc_09B5D4
loc_09B58C:
	ext.l	d7
	move.w	-$348E(a5),d0
	ext.l	d0
	add.l	#$144,d0
	cmp.l	d7,d0
	bge.s	loc_09B5A8
	move.w	-$348E(a5),d6
	add.w	#$144,d6
	bra.s	loc_09B5D4
loc_09B5A8:
	clr.w	$1E(a4)
	clr.w	$16(a4)
	lea.l	$143A(a5),a0
	move.l	a0,-$340E(a5)
	lea.l	$1432(a5),a0
	move.l	a0,-$3402(a5)
	clr.w	$6C(a4)
	lea.l	sub_09B50C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_09B600
loc_09B5D4:
	cmp.w	d7,d6
	slt.b	d3
	neg.b	d3
	beq.s	loc_09B5E4
	move.l	#$FFFFFCC0,d0
	bra.s	loc_09B5EA
loc_09B5E4:
	move.l	#$340,d0
loc_09B5EA:
	move.w	d0,$16(a4)
	clr.w	$6C(a4)
	lea.l	sub_09B55C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_09B600:
	movem.l	-$10(a6),d3/d6-d7/a4
	unlk	a6
	rts
