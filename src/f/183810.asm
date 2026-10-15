; ---------------------------------------------------------------------------
; Beast_RollLand - roll landed: stop, upright frame, back to control
; In:  8(a6) = player
; Out: none
; Evidence: velocities 0, Beast_SetFrameKeepCenterX(6), clears C latch, state +$A6
; ---------------------------------------------------------------------------
Beast_RollLand:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	moveq	#$6,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	Beast_SetFrameKeepCenterX(pc)
	tst.b	$9D(a4)
	addq.w	#$8,a7
	bne.s	loc_183848
	move.w	g_PadMaskC(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_183856
loc_183848:
	move.w	g_PadMaskC(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_183856:
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
