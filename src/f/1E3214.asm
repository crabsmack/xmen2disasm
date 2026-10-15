; ---------------------------------------------------------------------------
; Cyclops_StateGroundBeam - standing beam in progress: when the timer ends, end it and recover
; In:  8(a6) = player
; Out: none
; Evidence: Cyclops_BeamTimeUp -> Cyclops_EndBeam, +$5C = XPlayer_AttackRecover, +$6C = 0
; ---------------------------------------------------------------------------
Cyclops_StateGroundBeam:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	Cyclops_BeamTimeUp(pc)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_1E323E
	move.l	a4,-(a7)
	jsr	Cyclops_EndBeam(pc)
	lea.l	$4CCA(a5),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	addq.w	#$4,a7
loc_1E323E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
