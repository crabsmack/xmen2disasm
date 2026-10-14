; ---------------------------------------------------------------------------
; sub_0858F6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0858F6:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	-$3A02(a5)
	bne.s	loc_08592A
	clr.w	-$3B04(a5)
	lea.l	$3FB2(a5),a0
	move.l	a0,-$38FC(a5)
	andi.w	#$EFFF,$6(a4)
	clr.w	$6C(a4)
	lea.l	sub_085582(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_08592A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
