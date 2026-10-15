; ---------------------------------------------------------------------------
; Cyclops_AirSpecial	[jt 2395]
; ---------------------------------------------------------------------------
Cyclops_AirSpecial:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	Cyclops_AirCharge(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Cyclops_AirCharge(pc)
	addq.w	#$4,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
