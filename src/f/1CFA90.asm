; ---------------------------------------------------------------------------
; Gambit_AirThrow - air throw: throw the cards now and wait in Gambit_StateAirThrowEnd (if he already landed, aim on the ground instead)
; In:  8(a6) = player
; Out: d0 = +4 & 8
; Evidence: grounded -> Gambit_GroundAim; else Gambit_ThrowCards, +$6C = 0, +$5C = Gambit_StateAirThrowEnd
; ---------------------------------------------------------------------------
Gambit_AirThrow:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_1CFAB6
	lea.l	Gambit_GroundAim(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Gambit_GroundAim(pc)
	addq.w	#$4,a7
	bra.s	loc_1CFAD0
loc_1CFAB6:
	move.l	a4,-(a7)
	jsr	Gambit_ThrowCards(pc)
	addq.w	#$4,a7
	clr.w	$6C(a4)
	lea.l	Gambit_StateAirThrowEnd(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1CFAD0:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
