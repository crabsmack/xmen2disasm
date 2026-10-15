; ---------------------------------------------------------------------------
; Gambit_AirSpecialUp - GAMBIT slot +$CA: Up+A in the air: same as Gambit_AirSpecial
; In:  8(a6) = player
; Out: none
; Evidence: +$5C = Gambit_AirCharge
; ---------------------------------------------------------------------------
Gambit_AirSpecialUp:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	Gambit_AirCharge(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Gambit_AirCharge(pc)
	addq.w	#$4,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
