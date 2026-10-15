; ---------------------------------------------------------------------------
; MaintRobot_StateResume - MaintRobot state (Init's +$5C/+$64): move animation, reset the fire cooldown, then chase or patrol
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: Obj_SetAnim(Tbl_MaintRobotAnimMove), +$6E = cooldown +$9E (spawn +8, default 60); +$A7 = 0 -> MaintRobot_StateChase, else +$16 = +$9A and MaintRobot_StatePatrol; TAS 2524-47244
; ---------------------------------------------------------------------------
MaintRobot_StateResume:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$396A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	move.w	$9E(a4),$6E(a4)
	tst.b	$A7(a4)
	addq.w	#$8,a7
	bne.s	loc_139142
	clr.w	$6C(a4)
	lea.l	MaintRobot_StateChase(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_13915A
loc_139142:
	move.w	$9A(a4),$16(a4)
	clr.w	$6C(a4)
	lea.l	MaintRobot_StatePatrol(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_13915A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
