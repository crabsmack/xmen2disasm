; ---------------------------------------------------------------------------
; sub_1CFA90	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1CFA90:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_1CFAB6
	lea.l	sub_1D011E(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_1D011E(pc)
	addq.w	#$4,a7
	bra.s	loc_1CFAD0
loc_1CFAB6:
	move.l	a4,-(a7)
	jsr	sub_1CF84A(pc)
	addq.w	#$4,a7
	clr.w	$6C(a4)
	lea.l	sub_1CFA48(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1CFAD0:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
