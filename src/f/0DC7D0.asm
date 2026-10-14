; ---------------------------------------------------------------------------
; sub_0DC7D0	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0DC7D0:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$8C(a4)
	bne.s	loc_0DC7FC
	move.l	a4,-(a7)
	jsr	sub_0DC9C4(pc)
	addq.w	#$4,a7
	clr.w	$6C(a4)
	lea.l	sub_0DC9A0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0DC80E
loc_0DC7FC:
	clr.w	$6C(a4)
	lea.l	sub_0DC816(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0DC80E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
