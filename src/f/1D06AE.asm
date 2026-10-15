; ---------------------------------------------------------------------------
; sub_1D06AE	[jt 2348]
; ---------------------------------------------------------------------------
sub_1D06AE:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$18(a4),d7
	movea.l	$8C(a4),a0
	move.w	$E(a0),$20(a4)
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_1D06DA
	moveq	#$2,d0
	and.l	$90(a4),d0
	beq.s	loc_1D0712
loc_1D06DA:
	tst.b	$9D(a4)
	bne.s	loc_1D06F0
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1D06FE
loc_1D06F0:
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1D06FE:
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.s	loc_1D0732
loc_1D0712:
	cmpi.w	#$FD00,d7
	bge.s	loc_1D0720
	addi.w	#$100,$18(a4)
	bra.s	loc_1D0732
loc_1D0720:
	clr.w	$6C(a4)
	lea.l	sub_1D059C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1D0732:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
