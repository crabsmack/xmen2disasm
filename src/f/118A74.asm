; ---------------------------------------------------------------------------
; RThetaObject_Move_Case0 - RThetaObject_Move speed cases 0-1 and the shared tail (half/quarter bits, apply velocity)
; In:  inside RThetaObject_Move
; Out: -
; Evidence: Sw_11893C targets loc_118A74/118A7C
; ---------------------------------------------------------------------------
RThetaObject_Move_Case0:
	clr.l	$16(a4)
	bra.w	$118C3E
loc_118A7C:
	move.w	d6,$16(a4)
	move.w	d7,$18(a4)
	bra.w	$118C3E
