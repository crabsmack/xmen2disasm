; ---------------------------------------------------------------------------
; sub_04C1D0	[link-after-rts]
; ---------------------------------------------------------------------------
sub_04C1D0:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a4),d7
	asr.l	#$8,d7
	cmpi.w	#$E0,d7
	ble.s	loc_04C236
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	tst.l	$A4(a4)
	bne.s	loc_04C208
	move.l	$64(a4),$5C(a4)
	move.w	#$FF,$6C(a4)
	bra.s	loc_04C236
loc_04C208:
	addq.w	#$1,$A2(a4)
	movea.l	$A4(a4),a0
	move.w	$A2(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_04C21C
	clr.w	$A2(a4)
loc_04C21C:
	movea.l	$A4(a4),a0
	addq.l	#$2,a0
	move.w	$A2(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$FF,$6C(a4)
loc_04C236:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
