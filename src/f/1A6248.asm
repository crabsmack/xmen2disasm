; ---------------------------------------------------------------------------
; sub_1A6248	[jt 2200]
; ---------------------------------------------------------------------------
sub_1A6248:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$18(a4),d7
	cmpi.w	#$FE4A,d7
	bge.s	loc_1A6270
	moveq	#$21,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	loc_1A6298
loc_1A6270:
	cmpi.w	#$14A,d7
	bge.s	loc_1A6288
	pea.l	($C8).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	loc_1A6298
loc_1A6288:
	moveq	#$22,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
loc_1A6298:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
