; ---------------------------------------------------------------------------
; sub_1F42D0	[jt 2475]
; ---------------------------------------------------------------------------
sub_1F42D0:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	sub_1F4208(pc)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_1F42F8
	moveq	#$0,d0
	move.w	$C0(a4),d0
	moveq	#$3,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	tst.l	d0
	bra.s	loc_1F42FA
loc_1F42F8:
	moveq	#$0,d0
loc_1F42FA:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
