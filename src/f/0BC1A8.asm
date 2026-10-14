; ---------------------------------------------------------------------------
; sub_0BC1A8	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BC1A8:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d7
	asr.l	#$8,d7
	cmp.w	$9E(a4),d7
	beq.s	loc_0BC1C6
	cmp.w	$A0(a4),d7
	bne.s	loc_0BC216
loc_0BC1C6:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	tst.l	$98(a4)
	bne.s	loc_0BC1E6
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.w	loc_0BC2C8
loc_0BC1E6:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0BC1FA
	clr.w	$96(a4)
loc_0BC1FA:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.w	loc_0BC2C8
loc_0BC216:
	ext.l	d7
	move.w	$AA(a4),d0
	ext.l	d0
	move.l	d7,d1
	sub.l	d0,d1
	sge.b	d3
	neg.b	d3
	beq.s	loc_0BC236
	ext.l	d7
	move.w	$AA(a4),d0
	ext.l	d0
	move.l	d7,d1
	sub.l	d0,d1
	bra.s	loc_0BC244
loc_0BC236:
	ext.l	d7
	move.w	$AA(a4),d0
	ext.l	d0
	move.l	d7,d1
	sub.l	d0,d1
	neg.l	d1
loc_0BC244:
	moveq	#$F,d0
	cmp.l	d1,d0
	bgt.s	loc_0BC26A
	tst.w	$16(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_0BC25C
	move.w	$16(a4),d0
	ext.l	d0
	bra.s	loc_0BC264
loc_0BC25C:
	move.w	$16(a4),d0
	ext.l	d0
	neg.l	d0
loc_0BC264:
	moveq	#$8,d1
	cmp.l	d0,d1
	ble.s	loc_0BC2B6
loc_0BC26A:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	tst.l	$98(a4)
	bne.s	loc_0BC288
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0BC2C8
loc_0BC288:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0BC29C
	clr.w	$96(a4)
loc_0BC29C:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0BC2C8
loc_0BC2B6:
	clr.w	$6C(a4)
	lea.l	sub_0BC1A8(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BC2C8:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
