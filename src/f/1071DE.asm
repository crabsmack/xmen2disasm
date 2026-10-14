; ---------------------------------------------------------------------------
; sub_1071DE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1071DE:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.b	$8B(a4),d0
	movea.l	-$1CA6(a5),a0
	add.l	d0,d0
	move.w	#$200,d7
	and.w	$6(a0,d0.l),d7
	tst.w	d7
	bne.s	loc_10721A
	tst.w	$16(a4)
	beq.s	loc_10724A
	move.w	$16(a4),$92(a4)
	clr.w	$16(a4)
	move.w	#$A,$6E(a4)
	bra.s	loc_10724A
loc_10721A:
	move.w	#$100,d0
	and.w	$4(a4),d0
	beq.s	loc_10723E
	tst.w	$6E(a4)
	bgt.s	loc_10724A
	andi.w	#$FEFF,$4(a4)
	move.w	$92(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$16(a4)
	bra.s	loc_10724A
loc_10723E:
	tst.w	$16(a4)
	bne.s	loc_10724A
	move.w	$92(a4),$16(a4)
loc_10724A:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
