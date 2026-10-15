; ---------------------------------------------------------------------------
; sub_1F84BE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F84BE:
	link.w	a6,#$FFF8
	movem.l	d2-d3/d5-d7/a2-a4,-(a7)
	move.l	g_HeapTop(a5),-$347C(a5)
	movea.l	-$347C(a5),a3
	move.w	-$3482(a5),d0
	mulu.w	-$3484(a5),d0
	add.l	d0,d0
	add.l	d0,g_HeapTop(a5)
	move.l	g_HeapTop(a5),-$3478(a5)
	movea.l	-$3478(a5),a4
	move.w	-$3484(a5),d6
	bra.w	loc_1F859C
loc_1F84F0:
	moveq	#$0,d3
	move.w	-$3480(a5),d1
	move.w	-$3484(a5),d3
	sub.w	d6,d3
	move.l	d3,d2
	subq.w	#$1,d2
	lsl.w	d1,d2
	subi.w	#$80,d2
	lsl.w	d1,d3
	addi.w	#$80,d3
	move.w	d2,-$6(a6)
	move.w	d3,-$8(a6)
	move.w	-$3482(a5),d7
	bra.w	loc_1F8598
loc_1F851C:
	move.l	a4,d0
	sub.l	-$3478(a5),d0
	move.w	d0,(a3)+
	moveq	#$0,d3
	move.w	-$347E(a5),d1
	move.w	-$3482(a5),d3
	sub.w	d7,d3
	move.l	d3,d2
	subq.w	#$1,d2
	lsl.w	d1,d2
	subi.w	#$80,d2
	lsl.w	d1,d3
	addi.w	#$80,d3
	move.w	d2,-$2(a6)
	move.w	d3,-$4(a6)
	lea.l	-$33D2(a5),a2
	clr.w	d5
	bra.w	loc_1F858E
loc_1F8552:
	move.w	$8(a2),d2
	move.w	$C(a2),d3
	cmp.w	d2,d3
	bgt.s	loc_1F8560
	exg.l	d2,d3
loc_1F8560:
	cmp.w	-$4(a6),d2
	bge.s	loc_1F8588
	cmp.w	-$2(a6),d3
	ble.s	loc_1F8588
	move.w	$A(a2),d2
	move.w	$E(a2),d3
	cmp.w	d2,d3
	bgt.s	loc_1F857A
	exg.l	d2,d3
loc_1F857A:
	cmp.w	-$8(a6),d2
	bge.s	loc_1F8588
	cmp.w	-$6(a6),d3
	ble.s	loc_1F8588
	move.b	d5,(a4)+
loc_1F8588:
	addq.w	#$1,d5
	lea.l	$14(a2),a2
loc_1F858E:
	cmp.w	-$3470(a5),d5
	blt.s	loc_1F8552
	moveq	#-$1,d0
	move.b	d0,(a4)+
loc_1F8598:
	dbra	d7,loc_1F851C
loc_1F859C:
	dbra	d6,loc_1F84F0
	moveq	#$1,d0
	move.l	a4,d1
	and.l	d1,d0
	add.l	d0,d1
	move.l	d1,g_HeapTop(a5)
	movem.l	-$28(a6),d2-d3/d5-d7/a2-a4
	unlk	a6
	rts
