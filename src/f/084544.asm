; ---------------------------------------------------------------------------
; SmallBrood_Move - vtable +$4E: per-frame movement of a SMALLBROOD
; In:  8(a6) = this
; Evidence: slot +$4E of the SMALLBROOD descriptor $0840FE; TAS frames 46167-57140 (1288 frames active); calls parent BIONPC slot +$4E
; ---------------------------------------------------------------------------
SmallBrood_Move:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	lea.l	$1242(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$4E(a0),a1
	jsr	(a1)
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.l	$C(a4),d7
	asr.l	#$8,d7
	cmp.w	$A2(a4),d6
	bge.s	loc_084594
	move.w	$A2(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
	bra.s	loc_0845AE
loc_084594:
	cmp.w	$A4(a4),d6
	ble.s	loc_0845AE
	move.w	$A4(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
loc_0845AE:
	cmp.w	$AA(a4),d7
	bge.s	loc_0845CA
	move.w	$AA(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	clr.w	$18(a4)
	clr.w	$20(a4)
	bra.s	loc_0845E4
loc_0845CA:
	cmp.w	$A8(a4),d7
	ble.s	loc_0845E4
	move.w	$A8(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	clr.w	$18(a4)
	clr.w	$20(a4)
loc_0845E4:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
