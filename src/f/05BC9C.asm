; ---------------------------------------------------------------------------
; sub_05BC9C	[jt 411]
; ---------------------------------------------------------------------------
sub_05BC9C:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	move.w	$E(a6),d6
	movea.l	$8(a6),a3
	bra.s	loc_05BD26
loc_05BCAE:
	move.w	d6,d0
	subq.w	#$1,d6
	tst.w	$6A(a3)
	ble.s	loc_05BCF4
	lea.l	$8C(a3),a4
	clr.w	d7
	moveq	#$3,d3
loc_05BCC0:
	move.b	$4(a4),d0
	ext.w	d0
	add.w	d0,(a4)
	move.b	$5(a4),d0
	ext.w	d0
	add.w	d0,$2(a4)
	addq.b	#$2,$5(a4)
	move.b	$5(a4),d0
	ext.w	d0
	cmpi.w	#$800,d0
	ble.s	loc_05BCE8
	move.b	#$8,$5(a4)
loc_05BCE8:
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$8,a4
	cmp.w	d7,d3
	bgt.s	loc_05BCC0
	bra.s	loc_05BD26
loc_05BCF4:
	move.w	$16(a3),d0
	ext.l	d0
	add.l	d0,$8(a3)
	move.w	$18(a3),d0
	ext.l	d0
	add.l	d0,$C(a3)
	move.w	$1E(a3),d0
	add.w	d0,$16(a3)
	move.w	$20(a3),d0
	add.w	d0,$18(a3)
	cmpi.w	#$800,$18(a3)
	ble.s	loc_05BD26
	move.w	#$800,$18(a3)
loc_05BD26:
	tst.w	d6
	bne.s	loc_05BCAE
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
