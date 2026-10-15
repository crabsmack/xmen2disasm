; ---------------------------------------------------------------------------
; Gambit_GroundSpecialUp - GAMBIT slot +$E6: Up+A on the ground: same as Gambit_GroundSpecial (the aim state reads Up)
; In:  8(a6) = player
; Out: none
; Evidence: +$5C = Gambit_GroundAim
; ---------------------------------------------------------------------------
Gambit_GroundSpecialUp:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	Gambit_GroundAim(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Gambit_GroundAim(pc)
	addq.w	#$4,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
