; ---------------------------------------------------------------------------
; sub_1F364E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F364E:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F366E
	move.w	-$3B9A(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1F3676
loc_1F366E:
	move.w	-$3B9A(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1F3676:
	beq.s	loc_1F3680
	andi.b	#$EF,$2E(a4)
	bra.s	loc_1F36A4
loc_1F3680:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F3694
	move.w	-$3B98(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1F369C
loc_1F3694:
	move.w	-$3B98(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1F369C:
	beq.s	loc_1F36A4
	ori.b	#$10,$2E(a4)
loc_1F36A4:
	tst.w	$A6(a4)
	bgt.s	loc_1F36FC
	movea.l	-$35B6(a5),a0
	moveq	#$8,d0
	and.w	$4A(a0),d0
	bne.s	loc_1F36FC
	moveq	#$0,d0
	move.b	$3A(a4),d0
	cmpi.w	#$FF,d0
	bne.s	loc_1F36FC
	move.l	#$200000,d0
	and.l	$90(a4),d0
	bne.s	loc_1F36FC
	ori.l	#$40000,$90(a4)
	movea.l	-$35B6(a5),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$2A(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	clr.w	$6C(a4)
	lea.l	sub_1F35DC(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1F37E8
loc_1F36FC:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F3710
	move.w	-$3BA6(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1F3718
loc_1F3710:
	move.w	-$3BA6(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1F3718:
	bne.w	loc_1F37A6
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F3730
	move.w	-$3BA4(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1F3738
loc_1F3730:
	move.w	-$3BA4(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1F3738:
	bne.s	loc_1F37A6
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F374E
	move.w	-$3BA0(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1F3756
loc_1F374E:
	move.w	-$3BA0(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1F3756:
	beq.s	loc_1F37A6
	moveq	#$10,d0
	and.l	$90(a4),d0
	beq.s	loc_1F377E
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F3774
	move.w	-$3BA8(a5),d0
	and.w	g_Pad1Released(a5),d0
	bra.s	loc_1F379A
loc_1F3774:
	move.w	-$3BA8(a5),d0
	and.w	g_Pad2Released(a5),d0
	bra.s	loc_1F379A
loc_1F377E:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F3792
	move.w	-$3BA8(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1F379A
loc_1F3792:
	move.w	-$3BA8(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1F379A:
	bne.s	loc_1F37A6
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_1F37E8
loc_1F37A6:
	andi.l	#$FFDFFFFF,$90(a4)
	clr.w	$A6(a4)
	tst.b	$9D(a4)
	bne.s	loc_1F37C8
	move.w	-$3B9C(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1F37D6
loc_1F37C8:
	move.w	-$3B9C(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1F37D6:
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_1F37E8:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
