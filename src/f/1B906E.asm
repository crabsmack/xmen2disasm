; ---------------------------------------------------------------------------
; sub_1B906E	[jt 2231]
; ---------------------------------------------------------------------------
sub_1B906E:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$18(a4),d7
	cmpi.w	#$FC9E,d7
	bge.s	loc_1B9096
	moveq	#$11,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	loc_1B90D6
loc_1B9096:
	cmpi.w	#$1AE,d7
	bge.s	loc_1B90AE
	moveq	#$12,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	loc_1B90D6
loc_1B90AE:
	cmpi.w	#$1AE,d7
	bge.s	loc_1B90C6
	moveq	#$13,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	loc_1B90D6
loc_1B90C6:
	moveq	#$14,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
loc_1B90D6:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
