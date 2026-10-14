; ---------------------------------------------------------------------------
; sub_05DB4C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_05DB4C:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$12(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	$C(a4),d7
	sub.l	d0,d7
	tst.l	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_05DB72
	move.l	d7,d0
	bra.s	loc_05DB76
loc_05DB72:
	move.l	d7,d0
	neg.l	d0
loc_05DB76:
	cmpi.l	#$7700,d0
	ble.s	loc_05DB98
	clr.w	$18(a4)
	clr.w	$20(a4)
	clr.w	$6C(a4)
	lea.l	sub_05DBA2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_05DB98:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
