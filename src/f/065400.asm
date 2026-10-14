; ---------------------------------------------------------------------------
; sub_065400	[link-after-rts]
; ---------------------------------------------------------------------------
sub_065400:
	link.w	a6,#$0
	movem.l	d6-d7,-(a7)
	move.w	-$3C58(a5),d6
	bra.s	loc_065478
loc_06540E:
	ext.l	d6
	move.l	d6,d0
	lsl.l	#$7,d0
	add.l	#$E000,d0
	move.w	-$3C56(a5),d1
	ext.l	d1
	lsl.l	#$1,d1
	add.l	d0,d1
	move.l	#$3FFF,d0
	and.l	d1,d0
	swap	d0
	clr.w	d0
	add.l	#$40000000,d0
	ext.l	d6
	move.l	d6,d1
	lsl.l	#$7,d1
	add.l	#$E000,d1
	move.w	-$3C56(a5),d2
	ext.l	d2
	lsl.l	#$1,d2
	add.l	d1,d2
	move.l	#$C000,d1
	and.l	d2,d1
	moveq	#$E,d2
	lsr.l	d2,d1
	add.l	d0,d1
	move.l	d1,($C00004).l
	move.w	-$3C56(a5),d7
	bra.s	loc_065470
loc_065466:
	move.w	#$86C0,($C00000).l
	addq.w	#$1,d7
loc_065470:
	cmp.w	-$3C5A(a5),d7
	ble.s	loc_065466
	addq.w	#$1,d6
loc_065478:
	cmp.w	-$3C5C(a5),d6
	ble.s	loc_06540E
	move.w	-$3C58(a5),-$3B04(a5)
	move.w	-$3C56(a5),-$3B06(a5)
	movem.l	-$8(a6),d6-d7
	unlk	a6
	rts
