; ---------------------------------------------------------------------------
; Psylocke_StateCrouchCombo - first crouching attack in progress: another B press queues the second hit
; In:  8(a6) = player
; Out: none
; Evidence: anim done -> XPlayer_CrouchAttackRecover; B latched -> Psylocke_CrouchCombo2 after the remaining combo delay +$6E
; ---------------------------------------------------------------------------
Psylocke_StateCrouchCombo:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$44(a4)
	bne.s	loc_1B91BA
	lea.l	$4CD2(a5),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	bra.w	loc_1B923E
loc_1B91BA:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1B91CE
	move.w	g_PadMaskB(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1B91D6
loc_1B91CE:
	move.w	g_PadMaskB(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1B91D6:
	beq.s	loc_1B922C
	tst.b	$9D(a4)
	bne.s	loc_1B91EE
	move.w	g_PadMaskB(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1B91FC
loc_1B91EE:
	move.w	g_PadMaskB(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1B91FC:
	moveq	#-$1,d0
	cmp.w	$6E(a4),d0
	bne.s	loc_1B9216
	lea.l	Psylocke_CrouchCombo2(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Psylocke_CrouchCombo2(pc)
	addq.w	#$4,a7
	bra.s	loc_1B923E
loc_1B9216:
	move.w	$6E(a4),$6C(a4)
	lea.l	Psylocke_CrouchCombo2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1B923E
loc_1B922C:
	clr.w	$6C(a4)
	lea.l	Psylocke_StateCrouchCombo(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1B923E:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
