; ---------------------------------------------------------------------------
; sub_11F4C0	[jt 1649]
; ---------------------------------------------------------------------------
sub_11F4C0:
	link.w	a6,#$0
	movem.l	d5-d7/a3-a4,-(a7)
	clr.b	d6
	movea.l	$8(a6),a0
	movea.l	$92(a0),a4
	addq.w	#$2,a4
	movea.l	$92(a0),a0
	move.w	(a0),d5
	movea.l	a4,a3
	tst.w	(a3)
	bge.s	loc_11F500
	tst.w	$2(a3)
	bge.s	loc_11F500
	movea.l	$8(a6),a0
	move.l	$8(a0),d0
	asr.l	#$8,d0
	move.w	d0,(a3)
	movea.l	$8(a6),a0
	move.l	$C(a0),d0
	asr.l	#$8,d0
	move.w	d0,$2(a3)
loc_11F500:
	addq.w	#$6,a4
	moveq	#$1,d7
	bra.s	loc_11F524
loc_11F506:
	tst.b	d6
	bne.s	loc_11F516
	tst.w	(a4)
	bge.s	loc_11F51E
	tst.w	$2(a4)
	bge.s	loc_11F51E
	moveq	#$1,d6
loc_11F516:
	movea.l	a4,a0
	movea.l	a3,a1
	move.l	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
loc_11F51E:
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$6,a4
loc_11F524:
	moveq	#$0,d0
	move.w	d7,d0
	ext.l	d5
	cmp.l	d0,d5
	bgt.s	loc_11F506
	movem.l	-$14(a6),d5-d7/a3-a4
	unlk	a6
	rts
