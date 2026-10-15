; ---------------------------------------------------------------------------
; loc_02E026	[runtime: executed in tas]
; ---------------------------------------------------------------------------
loc_02E026:
	clr.w	$6C(a4)
	lea.l	sub_02E0B8(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_02E0B0
loc_02E03A:
	clr.w	$6C(a4)
	lea.l	sub_02E128(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_02E0B0
