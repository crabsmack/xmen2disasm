; ---------------------------------------------------------------------------
; sub_11E420	[jt 1620]
; ---------------------------------------------------------------------------
sub_11E420:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	-$348E(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	cmp.w	-$35C2(a5),d7
	ble.s	loc_11E446
	moveq	#$1,d0
	bra.s	loc_11E476
loc_11E446:
	cmp.w	-$35C0(a5),d7
	bge.s	loc_11E450
	moveq	#$1,d0
	bra.s	loc_11E476
loc_11E450:
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	d0,d7
	sub.w	-$3490(a5),d7
	cmp.w	-$35C6(a5),d7
	ble.s	loc_11E466
	moveq	#$1,d0
	bra.s	loc_11E476
loc_11E466:
	cmp.w	-$35C4(a5),d7
	slt.b	d3
	neg.b	d3
	subq.b	#$1,d3
	subx.b	d3,d3
	addq.b	#$1,d3
	move.b	d3,d0
loc_11E476:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
