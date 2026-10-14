; ---------------------------------------------------------------------------
; sub_15A7C8	[jt 2009]
; ---------------------------------------------------------------------------
sub_15A7C8:
	link.w	a6,#$0
	movem.l	d5-d7,-(a7)
	move.w	-$347E(a5),d0
	move.l	$8(a6),d6
	asr.l	d0,d6
	tst.w	d6
	bge.s	loc_15A7E0
	clr.w	d6
loc_15A7E0:
	cmp.w	-$3482(a5),d6
	blt.s	loc_15A7EC
	move.w	-$3482(a5),d6
	subq.w	#$1,d6
loc_15A7EC:
	move.w	-$3480(a5),d0
	move.l	$C(a6),d7
	asr.l	d0,d7
	tst.w	d7
	bge.s	loc_15A7FC
	clr.w	d7
loc_15A7FC:
	cmp.w	-$3484(a5),d7
	blt.s	loc_15A808
	move.w	-$3484(a5),d7
	subq.w	#$1,d7
loc_15A808:
	move.w	-$3482(a5),d0
	muls.w	d7,d0
	ext.l	d6
	add.l	d6,d0
	movea.l	-$347C(a5),a0
	add.l	d0,d0
	move.w	(a0,d0.l),d5
	ext.l	d5
	move.l	d5,d0
	movem.l	-$C(a6),d5-d7
	unlk	a6
	rts
