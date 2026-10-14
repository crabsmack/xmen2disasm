; ---------------------------------------------------------------------------
; sub_017A72	[jt 98]
; ---------------------------------------------------------------------------
sub_017A72:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a0
	lea.l	$A4(a0),a4
	lea.l	$94(a0),a3
	move.w	$8(a4),d0
	ext.l	d0
	add.l	d0,(a4)
	move.w	$A(a4),d0
	ext.l	d0
	add.l	d0,$4(a4)
	move.l	(a3),d6
	sub.l	(a4),d6
	move.l	$4(a3),d7
	sub.l	$4(a4),d7
	moveq	#$6,d0
	cmp.w	$C(a4),d0
	ble.s	loc_017ABC
	subq.w	#$1,$E(a4)
	bne.s	loc_017ABC
	move.w	#$4,$E(a4)
	addq.w	#$1,$C(a4)
loc_017ABC:
	tst.l	d6
	sge.b	d3
	neg.b	d3
	beq.s	loc_017AC8
	move.l	d6,d0
	bra.s	loc_017ACC
loc_017AC8:
	move.l	d6,d0
	neg.l	d0
loc_017ACC:
	tst.l	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_017AD8
	move.l	d7,d1
	bra.s	loc_017ADC
loc_017AD8:
	move.l	d7,d1
	neg.l	d1
loc_017ADC:
	add.l	d0,d1
	cmpi.l	#$A00,d1
	slt.b	d3
	neg.b	d3
	move.b	d3,d0
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
