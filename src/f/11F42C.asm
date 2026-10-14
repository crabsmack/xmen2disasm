; ---------------------------------------------------------------------------
; sub_11F42C	[jt 1648]
; ---------------------------------------------------------------------------
sub_11F42C:
	link.w	a6,#$0
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$C(a6),a3
	movea.l	$8(a6),a0
	move.l	$8(a0),d4
	asr.l	#$8,d4
	move.l	$C(a0),d5
	asr.l	#$8,d5
	movea.l	$92(a0),a0
	move.w	(a0),d6
	movea.l	$8(a6),a0
	andi.w	#$FFFE,$98(a0)
	movea.l	$8(a6),a0
	movea.l	$92(a0),a4
	addq.w	#$2,a4
	move.l	a3,$9A(a0)
	movea.l	$8(a6),a0
	andi.w	#$FFF1,$98(a0)
	movea.l	$8(a6),a0
	clr.w	$9E(a0)
	movea.l	$8(a6),a0
	clr.w	$A0(a0)
	clr.w	d7
	bra.s	loc_11F498
loc_11F484:
	cmpi.w	#$3E8,(a3)
	bge.s	loc_11F4A2
	move.w	d4,(a4)
	move.w	d5,$2(a4)
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$6,a4
	addq.w	#$8,a3
loc_11F498:
	moveq	#$0,d0
	move.w	d7,d0
	ext.l	d6
	cmp.l	d0,d6
	bgt.s	loc_11F484
loc_11F4A2:
	moveq	#$0,d0
	move.w	d7,d0
	ext.l	d6
	cmp.l	d0,d6
	ble.s	loc_11F4B6
	move.w	#$FFFF,(a4)
	move.w	#$FFFF,$2(a4)
loc_11F4B6:
	movem.l	-$18(a6),d4-d7/a3-a4
	unlk	a6
	rts
