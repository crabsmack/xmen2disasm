; ---------------------------------------------------------------------------
; Tusk_StateChargeStop - TUSK: stop and idle for 20 frames
; In:  8(a6) = this
; Out: d0 = 0
; Evidence: Obj_ChangeAnim jt $5C154; next Tusk_StateReturnStart
; ---------------------------------------------------------------------------
Tusk_StateChargeStop:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$1E(a4)
	clr.w	$16(a4)
	lea.l	$D2A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	Tusk_StateReturnStart(pc),a0
	move.l	a0,$5C(a4)
	move.w	#$14,$6C(a4)
	moveq	#$0,d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
