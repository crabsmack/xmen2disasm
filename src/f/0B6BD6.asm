; ---------------------------------------------------------------------------
; sub_0B6BD6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0B6BD6:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,$44(a4)
	moveq	#$3,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_0B6C0A
	move.l	#$200,d0
	bra.s	loc_0B6C10
loc_0B6C0A:
	move.l	#$FFFFFE00,d0
loc_0B6C10:
	move.w	d0,$16(a4)
	move.w	#$FAE0,$18(a4)
	move.w	#$3C,$20(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_0B6C3E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
