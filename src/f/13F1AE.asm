; ---------------------------------------------------------------------------
; Pop_StateWait_CaseDefault - case 0/default of Pop_StateWait: +$5C = Pop_FxBurstMedium
; In:  a4 = this
; Out: d0 = flags & 8
; Evidence: switch table Sw_13F114 entry 0 and the out-of-range branch
; ---------------------------------------------------------------------------
Pop_StateWait_CaseDefault:
	clr.w	$6C(a4)
	lea.l	Pop_FxBurstMedium(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_13F1D4
loc_13F1C2:
	clr.w	$6C(a4)
	lea.l	Pop_StateWait(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_13F1D4:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
