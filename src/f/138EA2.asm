; ---------------------------------------------------------------------------
; MaintRobot_StateStartVolley - MaintRobot state: back to the move animation and load the volley count, then fire
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: Obj_SetAnim(Tbl_MaintRobotAnimMove), +$A4 = shots +$A0 (spawn +$A, default 2), +$5C = MaintRobot_StateFire
; ---------------------------------------------------------------------------
MaintRobot_StateStartVolley:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$396A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	move.w	$A0(a4),$A4(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	MaintRobot_StateFire(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
