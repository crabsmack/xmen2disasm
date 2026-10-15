; ---------------------------------------------------------------------------
; SavageBioBase_Move - vtable +$4E: per-frame movement of a SAVAGEBIOBASE
; In:  8(a6) = this
; Evidence: slot +$4E of the SAVAGEBIOBASE descriptor $0BD27C; TAS frames 33560-34355 (704 frames active)
; ---------------------------------------------------------------------------
SavageBioBase_Move:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
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
	moveq	#$1,d0
	cmp.w	$E(a6),d0
	bge.s	loc_0BA2B4
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
loc_0BA2B4:
	move.l	$8(a4),d6
	asr.l	#$8,d6
	cmp.w	$9E(a4),d6
	bge.s	loc_0BA2D6
	move.w	$9E(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
	bra.s	loc_0BA2F0
loc_0BA2D6:
	cmp.w	$A0(a4),d6
	ble.s	loc_0BA2F0
	move.w	$A0(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
loc_0BA2F0:
	move.l	$C(a4),d6
	asr.l	#$8,d6
	move.w	$9C(a4),d0
	btst	#$0,d0
	beq.s	loc_0BA304
	move.w	d6,d7
	bra.s	loc_0BA31E
loc_0BA304:
	move.w	$4C(a4),d0
	cmp.w	$50(a4),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_0BA318
	move.w	$4C(a4),d0
	bra.s	loc_0BA31C
loc_0BA318:
	move.w	$50(a4),d0
loc_0BA31C:
	move.w	d0,d7
loc_0BA31E:
	cmp.w	$A4(a4),d7
	bge.s	loc_0BA33A
	move.w	$A4(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	clr.w	$18(a4)
	clr.w	$20(a4)
	bra.s	loc_0BA354
loc_0BA33A:
	cmp.w	$A2(a4),d6
	ble.s	loc_0BA354
	move.w	$A2(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	clr.w	$18(a4)
	clr.w	$20(a4)
loc_0BA354:
	movem.l	-$10(a6),d3/d6-d7/a4
	unlk	a6
	rts
