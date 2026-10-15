; ---------------------------------------------------------------------------
; XPlayer_StateAttackCombo - first ground attack in progress: a second B press queues the follow-up hit
; In:  8(a6) = player
; Out: d0 = +4 flag 8
; Evidence: anim ended -> XPlayer_AttackRecover; B latched -> XPlayer_AttackCombo2 after the remaining combo delay +$6E (immediately if -1)
; ---------------------------------------------------------------------------
XPlayer_StateAttackCombo:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$44(a4)
	bne.s	loc_1F2E7E
	clr.w	$6C(a4)
	lea.l	XPlayer_AttackRecover(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1F2F02
loc_1F2E7E:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F2E92
	move.w	g_PadMaskB(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1F2E9A
loc_1F2E92:
	move.w	g_PadMaskB(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1F2E9A:
	beq.s	loc_1F2EF0
	tst.b	$9D(a4)
	bne.s	loc_1F2EB2
	move.w	g_PadMaskB(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1F2EC0
loc_1F2EB2:
	move.w	g_PadMaskB(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1F2EC0:
	moveq	#-$1,d0
	cmp.w	$6E(a4),d0
	bne.s	loc_1F2EDA
	lea.l	XPlayer_AttackCombo2(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	XPlayer_AttackCombo2(pc)
	addq.w	#$4,a7
	bra.s	loc_1F2F02
loc_1F2EDA:
	move.w	$6E(a4),$6C(a4)
	lea.l	XPlayer_AttackCombo2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1F2F02
loc_1F2EF0:
	clr.w	$6C(a4)
	lea.l	XPlayer_StateAttackCombo(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1F2F02:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
