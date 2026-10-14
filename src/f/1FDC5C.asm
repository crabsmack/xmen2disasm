; ---------------------------------------------------------------------------
; sub_1FDC5C	[jt 2590]
; ---------------------------------------------------------------------------
sub_1FDC5C:
	link.w	a6,#$0
	clr.b	-$3A0C(a5)
	moveq	#$40,d0
	and.w	-$1D48(a5),d0
	beq.s	loc_1FDC8C
loc_1FDC6C:
	moveq	#$8,d0
	and.w	($C00004).l,d0
	moveq	#$0,d1
	move.w	d0,d1
	tst.l	d1
	bne.s	loc_1FDC6C
loc_1FDC7C:
	moveq	#$8,d0
	and.w	($C00004).l,d0
	moveq	#$0,d1
	move.w	d0,d1
	tst.l	d1
	beq.s	loc_1FDC7C
loc_1FDC8C:
	unlk	a6
	rts
