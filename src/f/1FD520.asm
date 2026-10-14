; ---------------------------------------------------------------------------
; sub_1FD520	[jt 2580]
; ---------------------------------------------------------------------------
sub_1FD520:
	link.w	a6,#$FFFC
	movem.l	d2-d7/a2-a3,-(a7)
	clr.w	-$2(a6)
	move.w	$12(a6),d7
	andi.w	#$3,d7
	ror.w	#$3,d7
	move.w	-$C64(a5),d0
	lsr.w	#$5,d0
	add.w	d0,d7
	tst.b	$17(a6)
	beq.s	loc_1FD548
	bset	#$F,d7
loc_1FD548:
	move.w	-$C88(a5),d3
	movea.w	#$80,a1
loc_1FD550:
	move.w	d3,d0
	cmpi.w	#$4,d0
	ble.s	loc_1FD55A
	moveq	#$4,d0
loc_1FD55A:
	subq.w	#$1,d0
	movea.w	d0,a3
	move.w	-$C8A(a5),d4
	movea.w	#$80,a2
loc_1FD566:
	move.w	d4,d2
	cmpi.w	#$4,d2
	ble.s	loc_1FD570
	moveq	#$4,d2
loc_1FD570:
	subq.w	#$1,d2
	move.w	a3,d1
	move.w	$A(a6),d6
	move.w	$E(a6),d5
	add.w	a2,d6
	add.w	a1,d5
	or.b	$1FD58C(pc,d2.w),d1
	move.b	$1FD590(pc,d1.w),d2
	lsl.w	#$8,d1
	bra.s	loc_1FD5A0
