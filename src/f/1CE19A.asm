; ---------------------------------------------------------------------------
; sub_1CE19A	[jt 2299]
; ---------------------------------------------------------------------------
sub_1CE19A:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CE1BA
	move.w	-$3B9A(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1CE1C2
loc_1CE1BA:
	move.w	-$3B9A(a5),d0
	and.w	-$3A38(a5),d0
loc_1CE1C2:
	beq.s	loc_1CE1D2
	andi.b	#$EF,$2E(a4)
	move.w	#$8,$BC(a4)
	bra.s	loc_1CE212
loc_1CE1D2:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CE1E6
	move.w	-$3B98(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1CE1EE
loc_1CE1E6:
	move.w	-$3B98(a5),d0
	and.w	-$3A38(a5),d0
loc_1CE1EE:
	beq.s	loc_1CE1FE
	ori.b	#$10,$2E(a4)
	move.w	#$1,$BC(a4)
	bra.s	loc_1CE212
loc_1CE1FE:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_1CE20E
	move.w	#$9,$BC(a4)
	bra.s	loc_1CE212
loc_1CE20E:
	clr.w	$BC(a4)
loc_1CE212:
	lea.l	sub_1CDFD2(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_1CDFD2(pc)
	addq.w	#$4,a7
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
