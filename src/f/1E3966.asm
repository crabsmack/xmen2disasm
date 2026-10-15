; ---------------------------------------------------------------------------
; Cyclops_AirCharge - enter the air special hold state Cyclops_StateAirCharge
; In:  8(a6) = player
; Out: none
; Evidence: +$5C = Cyclops_StateAirCharge; shared by the three air special slots
; ---------------------------------------------------------------------------
Cyclops_AirCharge:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	Cyclops_StateAirCharge(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Cyclops_StateAirCharge(pc)
	addq.w	#$4,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
