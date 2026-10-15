; ---------------------------------------------------------------------------
; Cyclops_StateCrouchBeam	[link-after-rts]
; ---------------------------------------------------------------------------
Cyclops_StateCrouchBeam:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	Cyclops_BeamTimeUp(pc)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_1E3270
	move.l	a4,-(a7)
	jsr	Cyclops_EndBeam(pc)
	lea.l	$4CD2(a5),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	addq.w	#$4,a7
loc_1E3270:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
