; ---------------------------------------------------------------------------
; sub_1F1D88	[jt 2431]
; ---------------------------------------------------------------------------
sub_1F1D88:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$12(a6),d0
	ext.l	d0
	move.l	d0,d6
	lsl.l	#$8,d6
	tst.w	d6
	beq.s	loc_1F1DD8
	move.w	$68(a4),d0
	ext.l	d0
	ext.l	d6
	move.l	d0,d7
	add.l	d6,d7
	cmpi.w	#$1,d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_1F1DBC
	moveq	#$1,d0
	bra.s	loc_1F1DCE
loc_1F1DBC:
	cmpi.w	#$900,d7
	sgt.b	d3
	neg.b	d3
	beq.s	loc_1F1DCC
	move.w	#$900,d0
	bra.s	loc_1F1DCE
loc_1F1DCC:
	move.w	d7,d0
loc_1F1DCE:
	move.w	d0,$68(a4)
	move.b	#$1,-$38B2(a5)
loc_1F1DD8:
	movem.l	-$10(a6),d3/d6-d7/a4
	unlk	a6
	rts
