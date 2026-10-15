; ---------------------------------------------------------------------------
; Beast_StateDiveHold - diving with B held: keep diving until landing or B release
; In:  8(a6) = player
; Out: d0
; Evidence: grounded -> Beast_DiveImpact; B released or +4 $100 -> Beast_StateDive
; ---------------------------------------------------------------------------
Beast_StateDiveHold:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_1830DE
	move.l	a4,-(a7)
	jsr	Beast_DiveImpact(pc)
	addq.w	#$4,a7
	bra.s	loc_18312C
loc_1830DE:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1830F2
	move.w	g_PadMaskB(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1830FA
loc_1830F2:
	move.w	g_PadMaskB(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1830FA:
	beq.s	loc_183106
	move.w	#$100,d0
	and.w	$4(a4),d0
	beq.s	loc_18311A
loc_183106:
	clr.w	$6C(a4)
	lea.l	Beast_StateDive(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_18312C
loc_18311A:
	clr.w	$6C(a4)
	lea.l	Beast_StateDiveHold(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_18312C:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
