; ---------------------------------------------------------------------------
; XClone_Move - vtable +$4E: integrate velocity n times and clamp x to [+$A0, +$A2] and y to [+$A4, +$A6] (the arena)
; Evidence: TAS 52266-57465
; ---------------------------------------------------------------------------
XClone_Move:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	move.w	$E(a6),d5
	movea.l	$8(a6),a4
loc_095628:
	move.w	$16(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	move.w	$18(a4),d0
	ext.l	d0
	add.l	d0,$C(a4)
	move.w	$1E(a4),d0
	add.w	d0,$16(a4)
	move.w	$20(a4),d0
	add.w	d0,$18(a4)
	move.w	d5,d0
	subq.w	#$1,d5
	tst.w	d5
	bgt.s	loc_095628
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.l	$C(a4),d7
	asr.l	#$8,d7
	cmp.w	$A0(a4),d6
	bge.s	loc_09567C
	clr.w	$1E(a4)
	clr.w	$16(a4)
	move.w	$A0(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	bra.s	loc_095696
loc_09567C:
	cmp.w	$A2(a4),d6
	ble.s	loc_095696
	clr.w	$1E(a4)
	clr.w	$16(a4)
	move.w	$A2(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
loc_095696:
	cmp.w	$A6(a4),d7
	ble.s	loc_0956B2
	clr.w	$18(a4)
	clr.w	$20(a4)
	move.w	$A6(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	bra.s	loc_0956C8
loc_0956B2:
	cmp.w	$A4(a4),d7
	bge.s	loc_0956C8
	clr.w	$18(a4)
	move.w	$A4(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
loc_0956C8:
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
