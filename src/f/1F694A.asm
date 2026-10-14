; ---------------------------------------------------------------------------
; sub_1F694A	[jt 2513]
; ---------------------------------------------------------------------------
sub_1F694A:
	link.w	a6,#$FFF4
	movem.l	d3-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d4
	move.l	$C(a4),d5
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	beq.s	loc_1F6980
	lea.l	-$1848(a5),a0
	move.l	a0,d0
	bra.w	loc_1F6A28
loc_1F6980:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	beq.s	loc_1F69A2
	lea.l	-$1758(a5),a0
	move.l	a0,d0
	bra.w	loc_1F6A28
loc_1F69A2:
	move.l	d4,-$8(a6)
	move.l	-$1750(a5),d6
	sub.l	-$8(a6),d6
	move.l	d5,-$4(a6)
	move.l	-$174C(a5),d7
	sub.l	-$4(a6),d7
	tst.l	d6
	sge.b	d3
	neg.b	d3
	beq.s	loc_1F69C6
	move.l	d6,d0
	bra.s	loc_1F69CA
loc_1F69C6:
	move.l	d6,d0
	neg.l	d0
loc_1F69CA:
	tst.l	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_1F69D6
	move.l	d7,d1
	bra.s	loc_1F69DA
loc_1F69D6:
	move.l	d7,d1
	neg.l	d1
loc_1F69DA:
	add.l	d0,d1
	move.l	d1,-$C(a6)
	move.l	-$1840(a5),d6
	sub.l	-$8(a6),d6
	move.l	-$183C(a5),d7
	sub.l	-$4(a6),d7
	tst.l	d6
	sge.b	d3
	neg.b	d3
	beq.s	loc_1F69FC
	move.l	d6,d0
	bra.s	loc_1F6A00
loc_1F69FC:
	move.l	d6,d0
	neg.l	d0
loc_1F6A00:
	tst.l	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_1F6A0C
	move.l	d7,d1
	bra.s	loc_1F6A10
loc_1F6A0C:
	move.l	d7,d1
	neg.l	d1
loc_1F6A10:
	move.l	d1,d5
	add.l	d0,d5
	cmp.l	-$C(a6),d5
	ble.s	loc_1F6A22
	lea.l	-$1758(a5),a0
	move.l	a0,d0
	bra.s	loc_1F6A28
loc_1F6A22:
	lea.l	-$1848(a5),a0
	move.l	a0,d0
loc_1F6A28:
	movem.l	-$24(a6),d3-d7/a4
	unlk	a6
	rts
