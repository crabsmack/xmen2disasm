; ---------------------------------------------------------------------------
; sub_1F2736	[jt 2447]
; ---------------------------------------------------------------------------
sub_1F2736:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$44(a4)
	beq.s	loc_1F2750
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_1F27AC
loc_1F2750:
	tst.b	$9D(a4)
	bne.s	loc_1F2766
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1F2774
loc_1F2766:
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1F2774:
	tst.b	$9D(a4)
	bne.s	loc_1F278A
	move.w	-$3BA8(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1F2798
loc_1F278A:
	move.w	-$3BA8(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1F2798:
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.s	loc_1F27E2
loc_1F27AC:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$96(a0),a1
	jsr	(a1)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_1F27D0
	movea.l	(a4),a0
	move.l	$AA(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$AA(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.s	loc_1F27E2
loc_1F27D0:
	clr.w	$6C(a4)
	lea.l	sub_1F2736(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1F27E2:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
