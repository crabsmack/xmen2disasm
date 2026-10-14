; ---------------------------------------------------------------------------
; sub_0BE0C2	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BE0C2:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$A0(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	cmp.l	$C(a4),d0
	bgt.s	loc_0BE104
	move.w	$A0(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	andi.w	#$EFFF,$4(a4)
	ori.w	#$4000,$6(a4)
	clr.w	$6C(a4)
	lea.l	sub_0BE10C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BE104:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
