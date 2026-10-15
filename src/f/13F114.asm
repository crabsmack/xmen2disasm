; ---------------------------------------------------------------------------
; Pop_StateWait - POP state: wait the +$6E delay, then replace itself with the death effect chosen by +$8C
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: +$6E (spawn word +8, default 60) < 1 -> switch +$8C (spawn word +6): 0/other Pop_FxBurstMedium, 1 Pop_FxBounce, 2 Pop_FxTrailArc, 3 Pop_FxBurstSmall, 4 Pop_FxChainPath, 5 Pop_FxChainSpiral; POP = invisible placed actor (SetFrame $FF in Pop_Init)
; ---------------------------------------------------------------------------
Pop_StateWait:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	bgt.w	loc_13F1C2
	move.w	$8C(a4),d0
	bmi.w	Pop_StateWait_CaseDefault
	cmpi.w	#$5,d0
	bgt.s	Pop_StateWait_CaseDefault
	add.w	d0,d0
	move.w	Sw_13F114(pc,d0.w),d0
	jmp	Sw_13F114-2(pc,d0.w)
