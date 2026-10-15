; ---------------------------------------------------------------------------
; loc_0BE328	[runtime: executed in tas]
; ---------------------------------------------------------------------------
loc_0BE328:
	clr.w	$6C(a4)
	lea.l	sub_0BE3B4(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0BE376
loc_0BE33C:
	clr.w	$6C(a4)
	lea.l	sub_0BE3EA(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0BE376
loc_0BE350:
	clr.w	$6C(a4)
	lea.l	sub_0BE420(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0BE376
