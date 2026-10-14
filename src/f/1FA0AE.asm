; ---------------------------------------------------------------------------
; sub_1FA0AE	[jt 2555]
; ---------------------------------------------------------------------------
sub_1FA0AE:
	link.w	a6,#$0
	movem.l	d4-d7/a3-a4,-(a7)
	move.b	$1B(a6),d4
	movea.l	$10(a6),a3
	move.w	$E(a6),d6
	move.w	$A(a6),d7
	clr.b	d5
	bra.s	loc_1FA114
loc_1FA0CA:
	movea.l	$8(a3),a4
	cmp.w	$56(a4),d7
	blt.s	loc_1FA112
	cmp.w	$5A(a4),d7
	bgt.s	loc_1FA112
	cmp.w	$54(a4),d6
	blt.s	loc_1FA112
	cmp.w	$58(a4),d6
	bgt.s	loc_1FA112
	tst.b	d4
	bne.s	loc_1FA0F0
	tst.w	$6A(a4)
	bne.s	loc_1FA112
loc_1FA0F0:
	moveq	#$1,d5
	move.l	$1C(a6),-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	movea.l	$14(a6),a0
	jsr	(a0)
	tst.b	d0
	lea.l	$10(a7),a7
	beq.s	loc_1FA112
	moveq	#$1,d0
	bra.s	loc_1FA11A
loc_1FA112:
	movea.l	(a3),a3
loc_1FA114:
	move.l	a3,d0
	bne.s	loc_1FA0CA
	move.b	d5,d0
loc_1FA11A:
	movem.l	-$18(a6),d4-d7/a3-a4
	unlk	a6
	rts
