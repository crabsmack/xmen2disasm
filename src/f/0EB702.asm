; ---------------------------------------------------------------------------
; sub_0EB702	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0EB702:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$1,d6
	tst.w	$9A(a4)
	bgt.s	loc_0EB748
	move.b	$90(a4),d0
	ext.w	d0
	lea.l	$92(a4),a0
	tst.b	(a0,d0.w)
	beq.s	loc_0EB748
	tst.b	$91(a4)
	bne.s	loc_0EB748
	moveq	#$1,d0
	cmp.w	$6E(a4),d0
	blt.s	loc_0EB748
	move.l	#$FFFFFE00,-(a7)
	move.l	a4,-(a7)
	jsr	sub_0EBC7C(pc)
	move.w	#$14,$9A(a4)
	addq.w	#$8,a7
loc_0EB748:
	lea.l	$92(a4),a3
	clr.w	d7
	moveq	#$8,d3
loc_0EB750:
	tst.b	(a3)
	bne.s	loc_0EB758
	clr.b	d6
	bra.s	loc_0EB762
loc_0EB758:
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$1,a3
	cmp.w	d7,d3
	bgt.s	loc_0EB750
loc_0EB762:
	tst.b	d6
	beq.s	loc_0EB77A
	clr.w	$6C(a4)
	lea.l	sub_0EB6CE(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0EB78C
loc_0EB77A:
	clr.w	$6C(a4)
	lea.l	sub_0EB702(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0EB78C:
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
