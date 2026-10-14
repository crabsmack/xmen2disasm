; ---------------------------------------------------------------------------
; sub_0EC668	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0EC668:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	andi.w	#$BFFF,$6(a4)
	move.w	$90(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$18(a4)
	clr.w	$6C(a4)
	lea.l	sub_0EC69E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
