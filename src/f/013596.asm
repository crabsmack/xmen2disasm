; ---------------------------------------------------------------------------
; CapedAcolyte_Move - vtable +$4E: per-frame movement of a CAPEDACOLYTE
; In:  8(a6) = this (CAPEDACOLYTE object)
; Out: none
; Evidence: class descriptor CAPEDACOLYTE slot +$4E (tools/classes.py); TAS frames 10849-11459 (283 active)
; ---------------------------------------------------------------------------
CapedAcolyte_Move:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	move.w	$E(a6),d5
	movea.l	$8(a6),a4
loc_0135A6:
	move.w	$16(a4),d0
	ext.l	d0
	add.l	d0,$9C(a4)
	move.w	$18(a4),d0
	ext.l	d0
	add.l	d0,$A0(a4)
	move.w	d5,d0
	subq.w	#$1,d5
	tst.w	d5
	ble.s	loc_0135DC
	addq.l	#$4,$B4(a4)
	movea.l	$B4(a4),a0
	cmpi.w	#$6400,(a0)
	blt.s	loc_0135A6
	lea.l	$342(a5),a0
	move.l	$2(a0),$B4(a4)
	bra.s	loc_0135A6
loc_0135DC:
	move.l	$9C(a4),d6
	asr.l	#$8,d6
	cmp.w	$A4(a4),d6
	bge.s	loc_0135FE
	move.w	$A4(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$9C(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
	bra.s	loc_013618
loc_0135FE:
	cmp.w	$A6(a4),d6
	ble.s	loc_013618
	move.w	$A6(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$9C(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
loc_013618:
	move.l	$A0(a4),d7
	asr.l	#$8,d7
	cmp.w	$AA(a4),d7
	bge.s	loc_01363A
	move.w	$AA(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$A0(a4)
	clr.w	$18(a4)
	clr.w	$20(a4)
	bra.s	loc_013654
loc_01363A:
	cmp.w	$A8(a4),d7
	ble.s	loc_013654
	move.w	$A8(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$A0(a4)
	clr.w	$18(a4)
	clr.w	$20(a4)
loc_013654:
	move.l	$9C(a4),$8(a4)
	move.l	$A0(a4),$C(a4)
	movea.l	$B4(a4),a0
	move.w	(a0),d0
	ext.l	d0
	add.l	d0,$8(a4)
	move.w	$2(a0),d0
	ext.l	d0
	add.l	d0,$C(a4)
	addq.l	#$4,$B4(a4)
	movea.l	$B4(a4),a0
	cmpi.w	#$6400,(a0)
	blt.s	loc_01368E
	lea.l	$342(a5),a0
	move.l	$2(a0),$B4(a4)
loc_01368E:
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
