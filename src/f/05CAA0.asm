; ---------------------------------------------------------------------------
; sub_05CAA0	[link-after-rts]
; ---------------------------------------------------------------------------
sub_05CAA0:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$10(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,d7
	sub.l	$8(a4),d7
	tst.l	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_05CAC6
	move.l	d7,d0
	bra.s	loc_05CACA
loc_05CAC6:
	move.l	d7,d0
	neg.l	d0
loc_05CACA:
	tst.w	$16(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_05CADC
	move.w	$16(a4),d1
	ext.l	d1
	bra.s	loc_05CAE4
loc_05CADC:
	move.w	$16(a4),d1
	ext.l	d1
	neg.l	d1
loc_05CAE4:
	cmp.l	d0,d1
	ble.s	loc_05CAFA
	clr.w	$1E(a4)
	clr.w	$16(a4)
	lea.l	sub_05CB04(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
loc_05CAFA:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
