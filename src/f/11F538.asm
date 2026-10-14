; ---------------------------------------------------------------------------
; sub_11F538	[jt 1650]
; ---------------------------------------------------------------------------
sub_11F538:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$92(a4)
	beq.s	loc_11F57E
	movea.l	$92(a4),a0
	tst.w	(a0)
	ble.s	loc_11F57E
	movea.l	a0,a3
	addq.w	#$2,a3
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	d0,(a3)
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	d0,$2(a3)
	movea.l	$92(a4),a0
	moveq	#$1,d0
	cmp.w	(a0),d0
	bge.s	loc_11F57E
	addq.w	#$6,a3
	move.w	#$FFFF,(a3)
	move.w	#$FFFF,$2(a3)
loc_11F57E:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
