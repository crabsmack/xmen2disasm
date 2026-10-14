; ---------------------------------------------------------------------------
; sub_123272	[link-after-rts]
; ---------------------------------------------------------------------------
sub_123272:
	link.w	a6,#$FFFC
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	-$1A8C(a5),a4
	lea.l	$349A(a5),a0
	move.l	$2(a0),-$4(a6)
	moveq	#$10,d0
	move.l	$C(a3),d6
	swap	d6
	ext.l	d6
	asr.w	d0,d6
	tst.l	d6
	clr.w	d7
	moveq	#$10,d3
loc_12329E:
	movea.l	-$4(a6),a0
	addq.l	#$2,-$4(a6)
	move.w	(a0),d0
	add.w	d0,$2(a4)
	cmp.w	$2(a4),d6
	bge.s	loc_1232B6
	move.w	#$FF38,(a4)
loc_1232B6:
	addq.w	#$6,a4
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_12329E
	tst.w	$6E(a3)
	bne.s	loc_1232D4
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.s	loc_1232E6
loc_1232D4:
	clr.w	$6C(a3)
	lea.l	sub_123272(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
loc_1232E6:
	movem.l	-$18(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
