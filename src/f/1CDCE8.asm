; ---------------------------------------------------------------------------
; sub_1CDCE8	[jt 2296]
; ---------------------------------------------------------------------------
sub_1CDCE8:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$18(a4),d7
	cmpi.w	#$FC18,d7
	bge.s	loc_1CDD12
	moveq	#$25,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.w	loc_1CDD9A
loc_1CDD12:
	cmpi.w	#$FC7C,d7
	bge.s	loc_1CDD2A
	moveq	#$26,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	loc_1CDD9A
loc_1CDD2A:
	cmpi.w	#$FCE0,d7
	bge.s	loc_1CDD42
	moveq	#$27,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	loc_1CDD9A
loc_1CDD42:
	cmpi.w	#$FD44,d7
	bge.s	loc_1CDD5A
	moveq	#$28,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	loc_1CDD9A
loc_1CDD5A:
	cmpi.w	#$FDA8,d7
	bge.s	loc_1CDD72
	moveq	#$29,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	loc_1CDD9A
loc_1CDD72:
	cmpi.w	#$C8,d7
	bge.s	loc_1CDD8A
	moveq	#$2A,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	loc_1CDD9A
loc_1CDD8A:
	moveq	#$2B,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
loc_1CDD9A:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
