; ---------------------------------------------------------------------------
; ChildShip_Move - vtable +$4E: per-frame movement of a CHILDSHIP
; In:  8(a6) = this
; Evidence: slot +$4E of the CHILDSHIP descriptor $0B7C3A; TAS frames 33389-33550 (155 frames active)
; ---------------------------------------------------------------------------
ChildShip_Move:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	move.w	$E(a6),d5
	movea.l	$8(a6),a4
	move.l	$A6(a4),$C(a4)
loc_0B72AE:
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
	bgt.s	loc_0B72AE
	move.l	$C(a4),$A6(a4)
	move.l	$8(a4),d6
	asr.l	#$8,d6
	cmp.w	$9E(a4),d6
	bge.s	loc_0B7302
	move.w	$9E(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
	bra.s	loc_0B731C
loc_0B7302:
	cmp.w	$A0(a4),d6
	ble.s	loc_0B731C
	move.w	$A0(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
loc_0B731C:
	move.l	$A6(a4),d7
	asr.l	#$8,d7
	cmp.w	$A4(a4),d7
	bge.s	loc_0B733E
	move.w	$A4(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$A6(a4)
	clr.w	$18(a4)
	clr.w	$20(a4)
	bra.s	loc_0B7358
loc_0B733E:
	cmp.w	$A2(a4),d7
	ble.s	loc_0B7358
	move.w	$A2(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$A6(a4)
	clr.w	$18(a4)
	clr.w	$20(a4)
loc_0B7358:
	move.l	$A6(a4),$C(a4)
	tst.l	$AA(a4)
	beq.s	loc_0B738A
	movea.l	$AA(a4),a0
	cmpi.w	#$6400,(a0)
	blt.s	loc_0B7378
	lea.l	$2FDA(a5),a0
	move.l	$2(a0),$AA(a4)
loc_0B7378:
	movea.l	$AA(a4),a0
	move.w	$2(a0),d0
	ext.l	d0
	add.l	d0,$C(a4)
	addq.l	#$4,$AA(a4)
loc_0B738A:
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
