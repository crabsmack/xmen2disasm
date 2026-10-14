; ---------------------------------------------------------------------------
; sub_02E168	[link-after-rts]
; ---------------------------------------------------------------------------
sub_02E168:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$386,$16(a4)
	move.w	#$3EA,$18(a4)
	clr.w	$20(a4)
	move.w	#$FFE0,$94(a4)
	move.w	#$FFE0,$96(a4)
	clr.w	$6C(a4)
	lea.l	sub_02E2B4(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
