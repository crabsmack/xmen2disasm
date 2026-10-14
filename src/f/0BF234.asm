; ---------------------------------------------------------------------------
; sub_0BF234	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BF234:
	link.w	a6,#$0
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$20(a4),a3
	move.w	$4E(a3),d0
	ext.l	d0
	move.l	d0,d4
	moveq	#$50,d0
	sub.l	d0,d4
	move.w	$4C(a3),d1
	ext.l	d1
	move.l	d1,d5
	moveq	#$28,d1
	sub.l	d1,d5
	move.w	$52(a3),d2
	ext.l	d2
	move.l	d2,d6
	add.l	d0,d6
	move.w	$50(a3),d2
	ext.l	d2
	move.l	d2,d7
	add.l	d1,d7
	cmp.w	$4(a4),d4
	bgt.s	loc_0BF296
	cmp.w	$4(a4),d6
	blt.s	loc_0BF296
	cmp.w	$6(a4),d5
	bgt.s	loc_0BF296
	cmp.w	$6(a4),d7
	blt.s	loc_0BF296
	lea.l	sub_0BF2B2(pc),a0
	move.l	a0,$18(a4)
	clr.w	$1C(a4)
	bra.s	loc_0BF2A8
loc_0BF296:
	tst.w	$1E(a4)
	bne.s	loc_0BF2A8
	lea.l	sub_0BF1FA(pc),a0
	move.l	a0,$18(a4)
	clr.w	$1C(a4)
loc_0BF2A8:
	movem.l	-$18(a6),d4-d7/a3-a4
	unlk	a6
	rts
