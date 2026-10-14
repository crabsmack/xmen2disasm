; ---------------------------------------------------------------------------
; loc_13F1AE
; ---------------------------------------------------------------------------
loc_13F1AE:
	clr.w	$6C(a4)
	lea.l	sub_13F1DC(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_13F1D4
loc_13F1C2:
	clr.w	$6C(a4)
	lea.l	sub_13F114(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_13F1D4:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
