; ---------------------------------------------------------------------------
; sub_1CEA2E	[jt 2304]
; ---------------------------------------------------------------------------
sub_1CEA2E:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$10(a4)
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CEA52
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CEA5A
loc_1CEA52:
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CEA5A:
	beq.s	loc_1CEA74
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_1CEA6C
	move.w	#$6,$BC(a4)
	bra.s	loc_1CEAC0
loc_1CEA6C:
	move.w	#$3,$BC(a4)
	bra.s	loc_1CEAC0
loc_1CEA74:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CEA88
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CEA90
loc_1CEA88:
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CEA90:
	beq.s	loc_1CEAAA
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_1CEAA2
	move.w	#$6,$BC(a4)
	bra.s	loc_1CEAC0
loc_1CEAA2:
	move.w	#$3,$BC(a4)
	bra.s	loc_1CEAC0
loc_1CEAAA:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_1CEABA
	move.w	#$5,$BC(a4)
	bra.s	loc_1CEAC0
loc_1CEABA:
	move.w	#$4,$BC(a4)
loc_1CEAC0:
	lea.l	sub_1CE902(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_1CE902(pc)
	addq.w	#$4,a7
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
