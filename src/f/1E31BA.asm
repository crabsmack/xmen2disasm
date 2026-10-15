; ---------------------------------------------------------------------------
; Cyclops_StateAirBeam	[link-after-rts]
; ---------------------------------------------------------------------------
Cyclops_StateAirBeam:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_1E31E6
	move.l	a4,-(a7)
	jsr	Cyclops_EndBeam(pc)
	lea.l	Cyclops_GroundAim(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Cyclops_GroundAim(pc)
	addq.w	#$8,a7
	bra.s	loc_1E320C
loc_1E31E6:
	move.l	a4,-(a7)
	jsr	Cyclops_BeamTimeUp(pc)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_1E320C
	move.l	a4,-(a7)
	jsr	Cyclops_EndBeam(pc)
	addq.w	#$4,a7
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1E320C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
