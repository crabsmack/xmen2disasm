; ---------------------------------------------------------------------------
; sub_1D0058	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1D0058:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_1D0084
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1D0114
loc_1D0084:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1D0098
	move.w	-$3B98(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1D00A0
loc_1D0098:
	move.w	-$3B98(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1D00A0:
	beq.s	loc_1D00AA
	ori.b	#$10,$2E(a4)
	bra.s	loc_1D00CE
loc_1D00AA:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1D00BE
	move.w	-$3B9A(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1D00C6
loc_1D00BE:
	move.w	-$3B9A(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1D00C6:
	beq.s	loc_1D00CE
	andi.b	#$EF,$2E(a4)
loc_1D00CE:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1D00E2
	move.w	-$3BA8(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1D00EA
loc_1D00E2:
	move.w	-$3BA8(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1D00EA:
	bne.s	loc_1D0114
	lea.l	$48AA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	move.b	#$4,$C2(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_1CFB14(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1D0114:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
