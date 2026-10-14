; ---------------------------------------------------------------------------
; sub_15F5FC	[jt 2079]
; ---------------------------------------------------------------------------
sub_15F5FC:
	link.w	a6,#$0
	movem.l	d3-d7/a2-a4,-(a7)
	movea.l	$8(a6),a0
	movea.l	$C(a6),a1
	movea.l	$10(a6),a3
	move.b	(a0)+,d4
	ext.w	d4
	move.b	(a0)+,d0
	movea.w	(a0)+,a2
	movea.w	(a0)+,a4
	moveq	#$0,d3
	moveq	#$0,d5
	move.b	(a0)+,d5
	asl.l	#$8,d5
	move.b	(a0)+,d5
	move.w	#$10,d6
	moveq	#$7,d0
	move.w	d6,d7
	sub.w	d0,d7
	move.w	d5,d1
	lsr.w	d7,d1
	andi.w	#$7F,d1
	move.w	d1,d2
	cmpi.w	#$40,d1
	bge.s	loc_15F642
	moveq	#$6,d0
	lsr.w	#$1,d2
loc_15F642:
	sub.w	d0,d6
	cmpi.w	#$9,d6
	bge.s	loc_15F650
	addq.w	#$8,d6
	asl.l	#$8,d5
	move.b	(a0)+,d5
loc_15F650:
	andi.w	#$F,d2
	lsr.w	#$4,d1
	add.w	d1,d1
	jmp	$15F65C(pc,d1.w)
