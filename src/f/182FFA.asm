; ---------------------------------------------------------------------------
; Beast_StateDive - diving after B was released: on landing impact, else when the dive time ends resume normal falling
; In:  8(a6) = player
; Out: d0
; Evidence: grounded -> Beast_DiveImpact; +$6E < 1 -> normal gravity/max speed, +$90 |= 2, y -= $F px, control
; ---------------------------------------------------------------------------
Beast_StateDive:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_18301A
	move.l	a4,-(a7)
	jsr	Beast_DiveImpact(pc)
	addq.w	#$4,a7
	bra.w	loc_1830B6
loc_18301A:
	tst.w	$6E(a4)
	bgt.w	loc_1830A4
	movea.l	$8C(a4),a0
	move.w	$E(a0),$20(a4)
	clr.w	$1E(a4)
	movea.l	$8C(a4),a0
	move.w	$12(a0),$22(a4)
	move.w	$18(a0),$24(a4)
	tst.b	$9D(a4)
	bne.s	loc_183056
	move.w	g_PadMaskB(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_183064
loc_183056:
	move.w	g_PadMaskB(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_183064:
	moveq	#$0,d0
	move.l	d0,$44(a4)
	bclr	#$0,$93(a4)
	ori.l	#$2,$90(a4)
	move.w	#$1000,d1
	and.w	$4(a4),d1
	beq.s	loc_183090
	subi.l	#$F00,$C(a4)
	move.b	#$1,g_CamModeSwitched(a5)
loc_183090:
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.s	loc_1830B6
loc_1830A4:
	clr.w	$6C(a4)
	lea.l	Beast_StateDive(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1830B6:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
