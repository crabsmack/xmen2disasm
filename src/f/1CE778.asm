; ---------------------------------------------------------------------------
; sub_1CE778	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1CE778:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_1CE7B0
	movea.l	$BE(a4),a0
	clr.b	$FE(a0)
	moveq	#$0,d0
	move.l	d0,$BE(a4)
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1CE81C
loc_1CE7B0:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CE7C4
	move.w	-$3BA8(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CE7CC
loc_1CE7C4:
	move.w	-$3BA8(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CE7CC:
	bne.s	loc_1CE80A
	movea.l	$BE(a4),a0
	clr.b	$FE(a0)
	moveq	#$0,d0
	move.l	d0,$BE(a4)
	tst.l	$44(a4)
	bne.s	loc_1CE7EA
	move.w	#$FFFF,$6C(a4)
	bra.s	loc_1CE7F0
loc_1CE7EA:
	move.w	#$FF,$6C(a4)
loc_1CE7F0:
	tst.w	$10(a4)
	beq.s	loc_1CE800
	lea.l	$4CD2(a5),a0
	move.l	a0,$5C(a4)
	bra.s	loc_1CE81C
loc_1CE800:
	lea.l	$4CCA(a5),a0
	move.l	a0,$5C(a4)
	bra.s	loc_1CE81C
loc_1CE80A:
	clr.w	$6C(a4)
	lea.l	sub_1CE778(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1CE81C:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
