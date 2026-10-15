; ---------------------------------------------------------------------------
; XPlayer_Crouch - XPLAYER slot +$B2: crouch: stop and play the crouch animation
; In:  8(a6) = player
; Out: none
; Evidence: velocities/gravity 0, Obj_ChangeAnim(char +$46), +$A6 = 60 (look-down delay), state XPlayer_StateCrouch
; ---------------------------------------------------------------------------
XPlayer_Crouch:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	movea.l	$8C(a4),a0
	movea.l	a0,a1
	adda.w	$46(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	move.w	#$3C,$A6(a4)
	lea.l	XPlayer_StateCrouch(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	XPlayer_StateCrouch(pc)
	lea.l	$C(a7),a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
