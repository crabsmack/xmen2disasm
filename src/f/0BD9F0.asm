; ---------------------------------------------------------------------------
; sub_0BD9F0	[jt 1046]
; ---------------------------------------------------------------------------
sub_0BD9F0:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	clr.w	d7
	movea.l	-$34A6(a5),a0
	movea.l	(a0),a4
	bra.s	loc_0BDA56
loc_0BDA06:
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0BDA46
	lea.l	$211A(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_0BDA46
	cmpa.l	$76(a4),a3
	bne.s	loc_0BDA46
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_0BDA46
	tst.b	$C0(a4)
	bne.s	loc_0BDA46
	move.b	#$1,$C0(a4)
loc_0BDA46:
	addq.w	#$1,d7
	move.w	d7,d0
	ext.l	d0
	movea.l	-$34A6(a5),a0
	asl.l	#$2,d0
	movea.l	(a0,d0.l),a4
loc_0BDA56:
	cmp.w	-$13F2(a5),d7
	blt.s	loc_0BDA06
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
