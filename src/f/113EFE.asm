; ---------------------------------------------------------------------------
; sub_113EFE	[jt 1409]
; ---------------------------------------------------------------------------
sub_113EFE:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	andi.w	#$EFFF,$6(a4)
	andi.w	#$BFFF,$6(a4)
	tst.l	$60(a4)
	beq.s	loc_113F26
	move.l	$60(a4),$5C(a4)
	moveq	#$0,d0
	move.l	d0,$60(a4)
loc_113F26:
	andi.w	#$FFFB,$4(a4)
	clr.w	$6C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
