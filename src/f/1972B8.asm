; ---------------------------------------------------------------------------
; Wolverine_StateDive - dive finished or landed: restore normal gravity and return to control
; In:  8(a6) = player
; Out: d0
; Evidence: grounded or +$6E < 1 -> gravity char +$E, max speeds char +$12/+$18, clear B latch, control
; ---------------------------------------------------------------------------
Wolverine_StateDive:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_1972D2
	tst.w	$6E(a4)
	bgt.s	loc_19732E
loc_1972D2:
	movea.l	$8C(a4),a0
	move.w	$E(a0),$20(a4)
	clr.w	$1E(a4)
	movea.l	$8C(a4),a0
	move.w	$12(a0),$22(a4)
	move.w	$18(a0),$24(a4)
	tst.b	$9D(a4)
	bne.s	loc_197306
	move.w	g_PadMaskB(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_197314
loc_197306:
	move.w	g_PadMaskB(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_197314:
	moveq	#$0,d0
	move.l	d0,$44(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.s	loc_197340
loc_19732E:
	clr.w	$6C(a4)
	lea.l	Wolverine_StateDive(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_197340:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
