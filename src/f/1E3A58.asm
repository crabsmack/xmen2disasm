; ---------------------------------------------------------------------------
; Cyclops_AirSpecial - CYCLOPS slot +$C6: A in the air: hold to charge, release to fire (Cyclops_AirCharge)
; In:  8(a6) = player
; Out: none
; Evidence: +$5C = Cyclops_AirCharge; identical to the Up/Down variants
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
