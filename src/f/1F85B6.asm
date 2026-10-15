; ---------------------------------------------------------------------------
; sub_1F85B6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F85B6:
	link.w	a6,#$0
	movem.l	d4-d7/a2-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$C(a6),a2
	move.w	$4E(a4),d5
	add.w	$52(a4),d5
	bpl.s	loc_1F85D4
	moveq	#$0,d5
	bra.s	loc_1F85E8
loc_1F85D4:
	move.w	-$347E(a5),d1
	addq.w	#$1,d1
	asr.w	d1,d5
	cmp.w	-$3482(a5),d5
	blt.s	loc_1F85E8
	move.w	-$3482(a5),d5
	subq.w	#$1,d5
loc_1F85E8:
	move.w	$4C(a4),d4
	add.w	$50(a4),d4
	bpl.s	loc_1F85F6
	moveq	#$0,d4
	bra.s	loc_1F860A
loc_1F85F6:
	move.w	-$3480(a5),d1
	addq.w	#$1,d1
	asr.w	d1,d4
	cmp.w	-$3484(a5),d4
	blt.s	loc_1F860A
	move.w	-$3484(a5),d4
	subq.w	#$1,d4
loc_1F860A:
	mulu.w	-$3482(a5),d4
	add.w	d5,d4
	add.w	d4,d4
	movea.l	-$347C(a5),a0
	move.w	(a0,d4.w),d7
	movea.l	-$3478(a5),a1
	adda.w	d7,a1
	lea.l	g_Segs(a5),a0
	move.l	a0,d7
	bra.s	loc_1F868E
loc_1F8628:
	movea.l	d7,a3
	moveq	#$0,d0
	move.b	d6,d0
	add.w	d0,d0
	add.w	d0,d0
	adda.w	d0,a3
	add.w	d0,d0
	add.w	d0,d0
	adda.w	d0,a3
	move.w	$A(a3),d5
	move.w	$E(a3),d4
	cmp.w	d5,d4
	bge.s	loc_1F8648
	exg.l	d5,d4
loc_1F8648:
	moveq	#$40,d2
	move.w	$C(a3),d1
	add.w	d2,d1
	cmp.w	$4E(a4),d1
	blt.s	loc_1F868E
	move.w	$8(a3),d1
	sub.w	d2,d1
	cmp.w	$52(a4),d1
	bge.s	loc_1F868E
	sub.w	d2,d5
	cmp.w	$50(a4),d5
	bge.s	loc_1F868E
	add.w	d2,d4
	cmp.w	$4C(a4),d4
	blt.s	loc_1F868E
	move.b	(a3),d0
	andi.w	#$C0,d0
	cmpi.w	#$80,d0
	bne.s	loc_1F868E
	cmpa.l	$76(a4),a3
	beq.s	loc_1F868E
	moveq	#$0,d0
	move.l	d0,(a2)+
	move.l	d0,(a2)+
	move.b	d6,-$6(a2)
loc_1F868E:
	move.b	(a1)+,d6
	cmpi.b	#$FF,d6
	bne.s	loc_1F8628
	movea.l	d7,a3
	move.w	-$3472(a5),d6
	move.w	d6,d0
	add.w	d0,d0
	add.w	d0,d0
	adda.w	d0,a3
	add.w	d0,d0
	add.w	d0,d0
	adda.w	d0,a3
	move.w	g_SegHighWater(a5),d7
	sub.w	d6,d7
	bmi.w	loc_1F87A2
loc_1F86B4:
	move.w	$A(a3),d5
	move.w	$E(a3),d4
	cmp.w	d5,d4
	bge.s	loc_1F86C2
	exg.l	d5,d4
loc_1F86C2:
	moveq	#$40,d2
	move.w	$C(a3),d1
	add.w	d2,d1
	cmp.w	$4E(a4),d1
	ble.w	loc_1F8798
	move.w	$8(a3),d1
	sub.w	d2,d1
	cmp.w	$52(a4),d1
	bge.w	loc_1F8798
	sub.w	d2,d5
	cmp.w	$50(a4),d5
	bge.w	loc_1F8798
	add.w	d2,d4
	cmp.w	$4C(a4),d4
	blt.w	loc_1F8798
	move.b	(a3),d0
	andi.w	#$C0,d0
	cmpi.w	#$80,d0
	bne.w	loc_1F8798
	moveq	#$0,d0
	move.l	d0,(a2)+
	move.l	d0,(a2)+
	move.b	d6,-$6(a2)
	move.b	$12(a3),d1
	moveq	#-$2,d0
	cmp.b	d0,d1
	beq.w	loc_1F8798
	cmp.b	$15(a4),d1
	beq.s	loc_1F877C
	cmpi.b	#$2,$15(a4)
	bge.s	loc_1F872C
	tst.b	$3(a3)
	bgt.s	loc_1F877C
loc_1F872C:
	moveq	#$0,d0
	move.b	$12(a3),d0
	cmpi.w	#$FF,d0
	beq.w	loc_1F8748
	add.w	d0,d0
	add.w	d0,d0
	movea.l	g_ObjTable(a5),a0
	move.l	(a0,d0.w),d0
	bra.s	loc_1F874A
loc_1F8748:
	moveq	#$0,d0
loc_1F874A:
	beq.s	loc_1F8798
	movea.l	d0,a0
	move.b	$15(a4),d1
loc_1F8752:
	cmp.b	$15(a0),d1
	beq.s	loc_1F877C
	moveq	#$0,d0
	move.b	$3A(a0),d0
	cmpi.w	#$FF,d0
	beq.w	loc_1F8774
	add.w	d0,d0
	add.w	d0,d0
	movea.l	g_ObjTable(a5),a0
	move.l	(a0,d0.w),d0
	bra.s	loc_1F8776
loc_1F8774:
	moveq	#$0,d0
loc_1F8776:
	beq.s	loc_1F8798
	movea.l	d0,a0
	bra.s	loc_1F8752
loc_1F877C:
	move.w	#$4,-$8(a2)
	ori.b	#$40,(a3)
	cmpi.b	#$2,$15(a4)
	bge.s	loc_1F8798
	tst.b	$3(a3)
	beq.s	loc_1F8798
	subq.b	#$1,$3(a3)
loc_1F8798:
	addq.w	#$1,d6
	lea.l	$14(a3),a3
	dbra	d7,loc_1F86B4
loc_1F87A2:
	moveq	#$1,d0
	swap	d0
	move.l	d0,(a2)
	movem.l	-$1C(a6),d4-d7/a2-a4
	unlk	a6
	rts
