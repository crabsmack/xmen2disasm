; ---------------------------------------------------------------------------
; sub_1CE674	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1CE674:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_1CE6A0
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1CE734
loc_1CE6A0:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CE6B4
	move.w	-$3B98(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CE6BC
loc_1CE6B4:
	move.w	-$3B98(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CE6BC:
	beq.s	loc_1CE6C6
	ori.b	#$10,$2E(a4)
	bra.s	loc_1CE6EA
loc_1CE6C6:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CE6DA
	move.w	-$3B9A(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CE6E2
loc_1CE6DA:
	move.w	-$3B9A(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CE6E2:
	beq.s	loc_1CE6EA
	andi.b	#$EF,$2E(a4)
loc_1CE6EA:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CE6FE
	move.w	-$3BA6(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1CE706
loc_1CE6FE:
	move.w	-$3BA6(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1CE706:
	bne.s	loc_1CE734
	move.w	#$1,$10(a4)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_1CE71E
	move.w	#$7,$BC(a4)
	bra.s	loc_1CE724
loc_1CE71E:
	move.w	#$2,$BC(a4)
loc_1CE724:
	lea.l	sub_1CE2CE(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_1CE2CE(pc)
	addq.w	#$4,a7
loc_1CE734:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
