; ---------------------------------------------------------------------------
; Beast_StateRoll - rolling leap: keep rolling forward at $1E0 until the time ends or a landing
; In:  8(a6) = player
; Out: d0
; Evidence: roll animation (Tbl_Anim_1829F8, jt $4292), vx +/-$1E0 by facing; grounded during the roll -> Beast_RollLand; frame $97 once falling (vy > $96)
; ---------------------------------------------------------------------------
Beast_StateRoll:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$100,d0
	and.w	$4(a4),d0
	beq.s	loc_183976
	lea.l	$4292(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	Beast_StateRollEnd(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_183A1C
loc_183976:
	tst.w	$6E(a4)
	bgt.s	loc_1839BA
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_18398C
	move.l	#$FFFFFE20,d0
	bra.s	loc_183992
loc_18398C:
	move.l	#$1E0,d0
loc_183992:
	move.w	d0,$16(a4)
	lea.l	$4292(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	Beast_StateRollEnd(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_183A1C
loc_1839BA:
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_1839DE
	cmpi.w	#$96,$18(a4)
	ble.s	loc_183A1C
	pea.l	($97).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	loc_183A1C
loc_1839DE:
	lea.l	$4292(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_1839FC
	move.l	#$FFFFFE20,d0
	bra.s	loc_183A02
loc_1839FC:
	move.l	#$1E0,d0
loc_183A02:
	move.w	d0,$16(a4)
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	Beast_RollLand(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_183A1C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
