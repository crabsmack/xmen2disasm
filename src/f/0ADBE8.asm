; ---------------------------------------------------------------------------
; sub_0ADBE8	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0ADBE8:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	-$16E2(a5),d0
	cmp.l	$9C(a4),d0
	beq.s	loc_0ADC06
	move.l	-$17D2(a5),d0
	cmp.l	$9C(a4),d0
	bne.s	loc_0ADC1E
loc_0ADC06:
	ori.w	#$1000,$6(a4)
	clr.w	$6C(a4)
	lea.l	sub_0ADC26(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0ADC1E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
