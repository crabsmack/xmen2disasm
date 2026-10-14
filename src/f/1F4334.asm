; ---------------------------------------------------------------------------
; sub_1F4334	[jt 2477]
; ---------------------------------------------------------------------------
sub_1F4334:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$BC(a3),a4
	move.l	$8(a3),d5
	asr.l	#$8,d5
	movea.l	-$35B6(a5),a0
	move.w	$68(a0),d5
	move.w	$8(a4),d6
	move.w	$C(a4),d7
	cmp.w	d6,d7
	bge.s	loc_1F4366
	move.w	$C(a4),d6
	move.w	$8(a4),d7
loc_1F4366:
	moveq	#$10,d0
	and.b	$2E(a3),d0
	bne.s	loc_1F438E
	ext.l	d7
	move.w	-$348E(a5),d0
	ext.l	d0
	move.l	d7,d1
	sub.l	d0,d1
	ext.l	d5
	move.l	#$140,d0
	sub.l	d5,d0
	cmp.l	d1,d0
	sge.b	d3
	neg.b	d3
	move.b	d3,d0
	bra.s	loc_1F43A4
loc_1F438E:
	ext.l	d6
	move.w	-$348E(a5),d0
	ext.l	d0
	move.l	d6,d1
	sub.l	d0,d1
	ext.l	d5
	cmp.l	d1,d5
	sle.b	d3
	neg.b	d3
	move.b	d3,d0
loc_1F43A4:
	movem.l	-$18(a6),d3/d5-d7/a3-a4
	unlk	a6
	rts
