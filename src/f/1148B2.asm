; ---------------------------------------------------------------------------
; sub_1148B2	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1148B2:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.b	$91(a4),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,d7
	lsl.l	#$8,d7
	move.w	#$20,$20(a4)
	move.w	#$400,$16(a4)
	tst.l	d7
	bge.s	loc_1148E6
	move.w	$16(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$16(a4)
loc_1148E6:
	clr.w	$1E(a4)
	tst.l	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_1148F6
	move.l	d7,d0
	bra.s	loc_1148FA
loc_1148F6:
	move.l	d7,d0
	neg.l	d0
loc_1148FA:
	move.l	d0,d7
	neg.l	d0
	asr.l	#$6,d0
	move.w	d0,$18(a4)
	ori.w	#$5080,$6(a4)
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
