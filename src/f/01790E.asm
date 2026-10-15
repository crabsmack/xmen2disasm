; ---------------------------------------------------------------------------
; sub_01790E	[jt 96]
; ---------------------------------------------------------------------------
sub_01790E:
	link.w	a6,#$FFF4
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.l	a3,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	move.l	d0,-$C(a6)
	lea.l	$94(a3),a4
	movea.l	-$C(a6),a0
	move.w	$52(a0),d0
	ext.l	d0
	move.w	$4E(a0),d1
	ext.l	d1
	add.l	d0,d1
	lsl.l	#$7,d1
	move.l	d1,-$8(a6)
	move.w	$4C(a0),d0
	ext.l	d0
	move.w	$50(a0),d1
	ext.l	d1
	add.l	d0,d1
	lsl.l	#$7,d1
	move.l	d1,-$4(a6)
	move.l	(a4),d4
	move.l	$4(a4),d5
	move.l	-$8(a6),d7
	sub.l	d4,d7
	move.l	-$4(a6),d6
	sub.l	d5,d6
	move.l	d7,d0
	asr.l	#$4,d0
	move.w	d0,$8(a4)
	move.l	d6,d0
	asr.l	#$4,d0
	move.w	d0,$A(a4)
	move.w	$8(a4),d0
	ext.l	d0
	add.l	d0,(a4)
	move.w	$A(a4),d0
	ext.l	d0
	add.l	d0,$4(a4)
	move.l	(a4),d5
	asr.l	#$8,d5
	cmp.w	$8C(a3),d5
	addq.w	#$4,a7
	bge.s	loc_0179A0
	move.w	$8C(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,(a4)
	bra.s	loc_0179B0
loc_0179A0:
	cmp.w	$8E(a3),d5
	ble.s	loc_0179B0
	move.w	$8E(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,(a4)
loc_0179B0:
	move.w	$2(a4),d0
	sub.w	d4,d0
	move.w	d0,$8(a4)
	move.l	(a4),d7
	sub.l	-$8(a6),d7
	tst.l	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_0179CC
	move.l	d7,d0
	bra.s	loc_0179D0
loc_0179CC:
	move.l	d7,d0
	neg.l	d0
loc_0179D0:
	tst.l	d6
	sge.b	d3
	neg.b	d3
	beq.s	loc_0179DC
	move.l	d6,d1
	bra.s	loc_0179E0
loc_0179DC:
	move.l	d6,d1
	neg.l	d1
loc_0179E0:
	add.l	d0,d1
	cmpi.l	#$1000,d1
	slt.b	d3
	neg.b	d3
	move.b	d3,d0
	movem.l	-$28(a6),d3-d7/a3-a4
	unlk	a6
	rts
