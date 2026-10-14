; ---------------------------------------------------------------------------
; sub_03A69A	[jt 270]
; ---------------------------------------------------------------------------
sub_03A69A:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$6(a4),d0
	beq.s	loc_03A6B4
	moveq	#$0,d0
	bra.s	loc_03A70A
loc_03A6B4:
	move.w	$10(a4),d0
	ext.l	d0
	move.w	-$348E(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	moveq	#-$40,d0
	cmp.l	d7,d0
	ble.s	loc_03A6CE
	moveq	#$1,d0
	bra.s	loc_03A70A
loc_03A6CE:
	cmpi.l	#$180,d7
	ble.s	loc_03A6DA
	moveq	#$1,d0
	bra.s	loc_03A70A
loc_03A6DA:
	move.w	$12(a4),d0
	ext.l	d0
	move.w	-$3490(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,d7
	moveq	#$40,d0
	add.l	d0,d7
	moveq	#-$40,d1
	cmp.l	d7,d1
	ble.s	loc_03A6F8
	moveq	#$1,d0
	bra.s	loc_03A70A
loc_03A6F8:
	cmpi.l	#$120,d7
	sgt.b	d3
	neg.b	d3
	subq.b	#$1,d3
	subx.b	d3,d3
	addq.b	#$1,d3
	move.b	d3,d0
loc_03A70A:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
