; ---------------------------------------------------------------------------
; loc_0366E6
; ---------------------------------------------------------------------------
loc_0366E6:
	moveq	#$0,d0
	move.b	$9B(a4),d0
	moveq	#$2,d1
	and.b	d0,d1
	beq.s	loc_036726
	move.w	$A6(a4),d0
	ext.l	d0
	move.l	d0,d4
	lsl.l	#$8,d4
	move.w	$A8(a4),d0
	ext.l	d0
	move.l	d0,d6
	lsl.l	#$8,d6
	cmp.l	$8(a4),d4
	ble.s	loc_036716
	move.l	d4,$8(a4)
	ori.b	#$4,$9B(a4)
loc_036716:
	cmp.l	$8(a4),d6
	bge.s	loc_036726
	move.l	d6,$8(a4)
	ori.b	#$8,$9B(a4)
loc_036726:
	movem.l	-$20(a6),d3-d7/a3-a4
	unlk	a6
	rts
