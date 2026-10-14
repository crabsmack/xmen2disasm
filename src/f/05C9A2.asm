; ---------------------------------------------------------------------------
; sub_05C9A2	[link-after-rts]
; ---------------------------------------------------------------------------
sub_05C9A2:
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
	beq.s	loc_05C9C8
	move.l	d7,d0
	bra.s	loc_05C9CC
loc_05C9C8:
	move.l	d7,d0
	neg.l	d0
loc_05C9CC:
	cmpi.l	#$4300,d0
	ble.s	loc_05CA08
	clr.w	$1E(a4)
	clr.w	$16(a4)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_05C9EC
	move.l	#$FFFFFCE0,d0
	bra.s	loc_05C9F2
loc_05C9EC:
	move.l	#$320,d0
loc_05C9F2:
	neg.w	d0
	move.w	d0,$16(a4)
	lea.l	sub_05CA12(pc),a0
	move.l	a0,$5C(a4)
	move.w	#$7,$6C(a4)
	moveq	#$0,d0
loc_05CA08:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
