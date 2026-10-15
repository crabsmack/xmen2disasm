; ---------------------------------------------------------------------------
; Cyclops_StateCrouchAim - crouched beam aim: turn with Left/Right while A is held; on release fire a low level beam
; In:  8(a6) = player
; Out: d0
; Evidence: airborne -> StateControl; A latch clear -> Cyclops_StartBeam(jt $4C72, 0), animation jt $4C1A, +$5C = Cyclops_StateCrouchBeam
; ---------------------------------------------------------------------------
Cyclops_StateCrouchAim:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_1E38BE
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1E395C
loc_1E38BE:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1E38D2
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1E38DA
loc_1E38D2:
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1E38DA:
	beq.s	loc_1E38E4
	ori.b	#$10,$2E(a4)
	bra.s	loc_1E3908
loc_1E38E4:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1E38F8
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1E3900
loc_1E38F8:
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1E3900:
	beq.s	loc_1E3908
	andi.b	#$EF,$2E(a4)
loc_1E3908:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1E391C
	move.w	g_PadMaskA(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1E3924
loc_1E391C:
	move.w	g_PadMaskA(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1E3924:
	bne.s	loc_1E395C
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$4A72(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	Cyclops_StartBeam(pc)
	lea.l	$4A1A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	$14(a7),a7
	clr.w	$6C(a4)
	lea.l	Cyclops_StateCrouchBeam(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1E395C:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
