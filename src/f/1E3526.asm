; ---------------------------------------------------------------------------
; Cyclops_StateAirCharge - air special held: steer in the air while A stays held; on release go to Cyclops_StateAirBeamBrake
; In:  8(a6) = player
; Out: d0
; Evidence: grounded -> StateControl; calls +$8A AirSteer; A not held -> +$5C = Cyclops_StateAirBeamBrake
; ---------------------------------------------------------------------------
Cyclops_StateAirCharge:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_1E3550
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.s	loc_1E358A
loc_1E3550:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$8A(a0),a1
	jsr	(a1)
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1E356E
	move.w	g_PadMaskA(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1E3576
loc_1E356E:
	move.w	g_PadMaskA(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1E3576:
	addq.w	#$4,a7
	bne.s	loc_1E358A
	lea.l	Cyclops_StateAirBeamBrake(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Cyclops_StateAirBeamBrake(pc)
	addq.w	#$4,a7
loc_1E358A:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
