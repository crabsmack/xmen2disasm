; ---------------------------------------------------------------------------
; sub_0AD790	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0AD790:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	sub_0AD550(pc),a0
	move.l	a0,$4(a4)
	lea.l	sub_0AD674(pc),a0
	move.l	a0,$C(a4)
	move.w	#$64,$40(a4)
	move.w	#$A0,$42(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
