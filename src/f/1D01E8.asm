; ---------------------------------------------------------------------------
; Gambit_GroundSpecialDown - GAMBIT slot +$E2: Down+A on the ground: crouched card throw (Gambit_CrouchAim)
; In:  8(a6) = player
; Out: none
; Evidence: +$5C = Gambit_CrouchAim
; ---------------------------------------------------------------------------
Gambit_GroundSpecialDown:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	Gambit_CrouchAim(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Gambit_CrouchAim(pc)
	addq.w	#$4,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
