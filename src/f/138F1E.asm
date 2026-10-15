; ---------------------------------------------------------------------------
; MaintRobot_StateChase - MaintRobot state: steer along its segment toward the nearest player; stop to fire when the cooldown is over and the player is in range
; In:  8(a6) = this
; Out: d0 = misc
; Evidence: +$6E < 1 and MaintRobot_TargetInRange -> MaintRobot_StateStop; flags bit $100 set with the cooldown over -> clear it, stop; else switch on segment type (+$76)+1 - $21: velocity +$16 = +/-speed +$9C or 0 by the player's box (x for types $21/$22, y for $23/$24)
; ---------------------------------------------------------------------------
MaintRobot_StateChase:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	move.w	$9C(a4),d7
	tst.w	$6E(a4)
	addq.w	#$4,a7
	bgt.s	loc_138F62
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	MaintRobot_TargetInRange(pc)
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_138F62
	clr.w	$6C(a4)
	lea.l	MaintRobot_StateStop(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	MaintRobot_StateChase_End
loc_138F62:
	move.w	#$100,d0
	and.w	$4(a4),d0
	beq.s	loc_138F8E
	tst.w	$6E(a4)
	bgt.s	loc_138F8E
	andi.w	#$FEFF,$4(a4)
	clr.w	$6C(a4)
	lea.l	MaintRobot_StateStop(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	MaintRobot_StateChase_End
loc_138F8E:
	movea.l	$76(a4),a0
	move.b	$1(a0),d0
	subi.b	#$21,d0
	bmi.w	MaintRobot_StateChase_End
	cmpi.b	#$3,d0
	bgt.w	MaintRobot_StateChase_End
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_138F1E(pc,d1.w),d1
	jmp	Sw_138F1E-2(pc,d1.w)
