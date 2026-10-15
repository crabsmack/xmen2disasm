; ---------------------------------------------------------------------------
; Gambit_CrouchAim - stop, play the crouch-aim animation and enter Gambit_StateCrouchAim
; In:  8(a6) = player
; Out: none
; Evidence: ax = vx = 0, animation jt $4AFA, +$5C = Gambit_StateCrouchAim
; ---------------------------------------------------------------------------
Gambit_CrouchAim:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$1E(a4)
	clr.w	$16(a4)
	lea.l	$48FA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	Gambit_StateCrouchAim(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Gambit_StateCrouchAim(pc)
	lea.l	$C(a7),a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
