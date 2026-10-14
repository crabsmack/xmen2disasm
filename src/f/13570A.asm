; ---------------------------------------------------------------------------
; sub_13570A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_13570A:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$A2(a4)
	bne.s	loc_13577A
	tst.b	$A6(a4)
	beq.s	loc_135724
	moveq	#$0,d0
	bra.s	loc_135726
loc_135724:
	moveq	#$1,d0
loc_135726:
	move.b	d0,$A6(a4)
	beq.s	loc_135734
	andi.b	#$EF,$2E(a4)
	bra.s	loc_13573A
loc_135734:
	ori.b	#$10,$2E(a4)
loc_13573A:
	tst.l	$8E(a4)
	bne.s	loc_13574C
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_13578C
loc_13574C:
	addq.w	#$1,$8C(a4)
	movea.l	$8E(a4),a0
	move.w	$8C(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_135760
	clr.w	$8C(a4)
loc_135760:
	movea.l	$8E(a4),a0
	addq.l	#$2,a0
	move.w	$8C(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_13578C
loc_13577A:
	clr.w	$6C(a4)
	lea.l	sub_13570A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_13578C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
