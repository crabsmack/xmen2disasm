; ---------------------------------------------------------------------------
; sub_15DBF2	[jt 2051]
; ---------------------------------------------------------------------------
sub_15DBF2:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$4000,d0
	and.w	$4(a4),d0
	bne.s	loc_15DC0C
	moveq	#$0,d0
	bra.s	loc_15DC6E
loc_15DC0C:
	movea.l	$C(a6),a0
	moveq	#$0,d0
	move.b	$4(a0),d0
	moveq	#$8,d1
	and.b	d0,d1
	beq.s	loc_15DC20
	moveq	#$0,d0
	bra.s	loc_15DC6E
loc_15DC20:
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	-$348E(a5),d1
	ext.l	d1
	move.l	d0,d6
	sub.l	d1,d6
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	-$3490(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	cmp.w	-$35AE(a5),d6
	bge.s	loc_15DC4A
	moveq	#$1,d0
	bra.s	loc_15DC6E
loc_15DC4A:
	cmp.w	-$35B0(a5),d6
	ble.s	loc_15DC54
	moveq	#$1,d0
	bra.s	loc_15DC6E
loc_15DC54:
	cmp.w	-$35AC(a5),d7
	bge.s	loc_15DC5E
	moveq	#$1,d0
	bra.s	loc_15DC6E
loc_15DC5E:
	cmp.w	-$35B2(a5),d7
	sgt.b	d3
	neg.b	d3
	subq.b	#$1,d3
	subx.b	d3,d3
	addq.b	#$1,d3
	move.b	d3,d0
loc_15DC6E:
	movem.l	-$10(a6),d3/d6-d7/a4
	unlk	a6
	rts
