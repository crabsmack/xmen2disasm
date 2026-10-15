; ---------------------------------------------------------------------------
; Cyclops_StateAirBeamBrake	[link-after-rts]
; ---------------------------------------------------------------------------
Cyclops_StateAirBeamBrake:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$18(a4),d7
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_1E34E6
	lea.l	Cyclops_GroundAim(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Cyclops_GroundAim(pc)
	addq.w	#$4,a7
	bra.s	loc_1E351C
loc_1E34E6:
	cmpi.w	#$FD00,d7
	bge.s	loc_1E34F4
	addi.w	#$100,$18(a4)
	bra.s	loc_1E351C
loc_1E34F4:
	cmpi.w	#$100,d7
	ble.s	loc_1E3502
	subi.w	#$100,$18(a4)
	bra.s	loc_1E351C
loc_1E3502:
	movea.l	$8C(a4),a0
	move.w	$E(a0),$20(a4)
	lea.l	Cyclops_AirBeamAim(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Cyclops_AirBeamAim(pc)
	addq.w	#$4,a7
loc_1E351C:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
