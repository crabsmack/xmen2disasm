; ---------------------------------------------------------------------------
; sub_1B9800	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1B9800:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	#$10000,d0
	and.l	$90(a4),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1B9826
	movea.l	$8C(a4),a0
	movea.w	$10(a0),a0
	bra.s	loc_1B982A
loc_1B9826:
	movea.w	#$0,a0
loc_1B982A:
	move.w	a0,$18(a4)
	movea.l	$8C(a4),a0
	move.w	$E(a0),$20(a4)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_1B9848
	move.l	#$FFFFFF00,d0
	bra.s	loc_1B984E
loc_1B9848:
	move.l	#$100,d0
loc_1B984E:
	move.w	d0,$1E(a4)
	moveq	#$11,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.w	$C0(a4),d0
	moveq	#-$4,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	moveq	#$0,d1
	or.w	d0,d1
	move.w	d1,$C0(a4)
	addq.w	#$8,a7
	move.w	#$10,$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
