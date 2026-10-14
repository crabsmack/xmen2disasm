; ---------------------------------------------------------------------------
; sub_05D738	[link-after-rts]
; ---------------------------------------------------------------------------
sub_05D738:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$10(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	$8(a4),d7
	sub.l	d0,d7
	tst.l	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_05D75E
	move.l	d7,d0
	bra.s	loc_05D762
loc_05D75E:
	move.l	d7,d0
	neg.l	d0
loc_05D762:
	cmpi.l	#$8000,d0
	ble.s	loc_05D77C
	clr.w	$6C(a4)
	lea.l	sub_05D786(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_05D77C:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
