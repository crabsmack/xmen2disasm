; ---------------------------------------------------------------------------
; Magneto_GroundAttackDown - MAGNETO slot +$DA: Down+B: crouch and aim low
; In:  8(a6) = player
; Out: none
; Evidence: stop, crouch-aim animation (Tbl_MagnetoAnim26, jt $46C2), state Magneto_StateCrouchAim
; ---------------------------------------------------------------------------
Magneto_GroundAttackDown:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$1E(a4)
	clr.w	$16(a4)
	lea.l	$46C2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	Magneto_StateCrouchAim(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Magneto_StateCrouchAim(pc)
	lea.l	$C(a7),a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
