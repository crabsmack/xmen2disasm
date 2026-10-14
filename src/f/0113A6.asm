; ---------------------------------------------------------------------------
; sub_0113A6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0113A6:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$A7(a4)
	beq.s	loc_0113CA
	clr.w	$6C(a4)
	lea.l	sub_011452(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0113DE
loc_0113CA:
	move.w	#$4,$6C(a4)
	lea.l	sub_0113A6(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0113DE:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
