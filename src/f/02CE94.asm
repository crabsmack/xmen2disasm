; ---------------------------------------------------------------------------
; loc_02CE94	[runtime: executed in tas]
; ---------------------------------------------------------------------------
loc_02CE94:
	tst.w	$6(a4)
	beq.s	loc_02CEA0
	move.w	$6(a4),d0
	bra.s	loc_02CEA2
loc_02CEA0:
	moveq	#$2,d0
loc_02CEA2:
	move.b	d0,$A8(a3)
	bra.s	loc_02CEF6
loc_02CEA8:
	tst.w	$8(a4)
	beq.s	loc_02CEB4
	move.w	$8(a4),d0
	bra.s	loc_02CEB6
loc_02CEB4:
	moveq	#$3,d0
loc_02CEB6:
	move.b	d0,$A8(a3)
	bra.s	loc_02CEF6
