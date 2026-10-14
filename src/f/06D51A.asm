; ---------------------------------------------------------------------------
; sub_06D51A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_06D51A:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d7
	asr.l	#$8,d7
	move.l	$C(a4),d6
	asr.l	#$8,d6
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	cmp.w	$A8(a4),d6
	addq.w	#$8,a7
	bne.s	loc_06D598
	cmp.w	$A2(a4),d7
	blt.s	loc_06D598
	cmp.w	$A4(a4),d7
	bgt.s	loc_06D598
	tst.l	$98(a4)
	bne.s	loc_06D568
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.w	loc_06D694
loc_06D568:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_06D57C
	clr.w	$96(a4)
loc_06D57C:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.w	loc_06D694
loc_06D598:
	cmp.w	$A2(a4),d7
	bge.s	loc_06D5D6
	tst.b	$A0(a4)
	beq.s	loc_06D5BA
	move.w	$A2(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
	bra.s	loc_06D614
loc_06D5BA:
	move.w	#$100,$20(a4)
	clr.w	$6C(a4)
	lea.l	sub_06D51A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_06D694
loc_06D5D6:
	cmp.w	$A4(a4),d7
	ble.s	loc_06D614
	tst.b	$A1(a4)
	beq.s	loc_06D5F8
	move.w	$A4(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
	bra.s	loc_06D614
loc_06D5F8:
	move.w	#$100,$20(a4)
	clr.w	$6C(a4)
	lea.l	sub_06D51A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_06D694
loc_06D614:
	cmp.w	$A8(a4),d6
	ble.s	loc_06D628
	move.w	$A8(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	bra.s	loc_06D656
loc_06D628:
	cmp.w	$AA(a4),d6
	bge.s	loc_06D63C
	move.w	$AA(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	bra.s	loc_06D656
loc_06D63C:
	move.w	#$100,$20(a4)
	clr.w	$6C(a4)
	lea.l	sub_06D51A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_06D694
loc_06D656:
	tst.l	$98(a4)
	bne.s	loc_06D668
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_06D694
loc_06D668:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_06D67C
	clr.w	$96(a4)
loc_06D67C:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_06D694:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
