; ---------------------------------------------------------------------------
; Pop_StateWait_Case5 - cases 5..1 of Pop_StateWait: install the matching Pop_Fx* state
; In:  a4 = this
; Out: d0 = flags & 8
; Evidence: switch table Sw_13F114 entries 5 (this label), 4 loc_13F15E, 3 loc_13F172, 2 loc_13F186, 1 loc_13F19A
; ---------------------------------------------------------------------------
Pop_StateWait_Case5:
	clr.w	$6C(a4)
	lea.l	Pop_FxChainSpiral(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_13F1D4
loc_13F15E:
	clr.w	$6C(a4)
	lea.l	Pop_FxChainPath(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_13F1D4
loc_13F172:
	clr.w	$6C(a4)
	lea.l	Pop_FxBurstSmall(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_13F1D4
loc_13F186:
	clr.w	$6C(a4)
	lea.l	Pop_FxTrailArc(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_13F1D4
loc_13F19A:
	clr.w	$6C(a4)
	lea.l	Pop_FxBounce(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_13F1D4
