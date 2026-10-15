; ---------------------------------------------------------------------------
; Gambit_GroundAim - stop and enter the standing aim state Gambit_StateGroundAim
; In:  8(a6) = player
; Out: none
; Evidence: ax = vx = 0, +$5C = Gambit_StateGroundAim; from the ground special slots and when an air throw finds him landed
; ---------------------------------------------------------------------------
Gambit_GroundAim:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$1E(a4)
	clr.w	$16(a4)
	lea.l	Gambit_StateGroundAim(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Gambit_StateGroundAim(pc)
	addq.w	#$4,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
