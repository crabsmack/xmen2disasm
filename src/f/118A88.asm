; ---------------------------------------------------------------------------
; RThetaObject_Move_Case2 - RThetaObject_Move speed cases 2-3
; In:  inside RThetaObject_Move
; Out: -
; Evidence: Sw_11893C targets
; ---------------------------------------------------------------------------
RThetaObject_Move_Case2:
	move.l	d6,d0
	lsl.l	#$1,d0
	move.w	d0,$16(a4)
	move.l	d7,d0
	lsl.l	#$1,d0
	move.w	d0,$18(a4)
	bra.w	$118C3E
loc_118A9C:
	move.l	d6,d0
	lsl.l	#$1,d0
	add.w	d6,d0
	move.w	d0,$16(a4)
	move.l	d7,d0
	lsl.l	#$1,d0
	add.w	d7,d0
	move.w	d0,$18(a4)
	bra.w	$118C3E
