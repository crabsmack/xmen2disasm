; ---------------------------------------------------------------------------
; sub_09B4BC	[link-after-rts]
; ---------------------------------------------------------------------------
sub_09B4BC:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	bgt.s	loc_09B4F2
	move.b	#$1,$91(a4)
	tst.b	$90(a4)
	bne.s	loc_09B4F2
	moveq	#$0,d0
	move.l	d0,-$340E(a5)
	clr.w	$6C(a4)
	lea.l	sub_09B60A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_09B504
loc_09B4F2:
	clr.w	$6C(a4)
	lea.l	sub_09B4BC(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_09B504:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
