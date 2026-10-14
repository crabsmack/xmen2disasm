; ---------------------------------------------------------------------------
; sub_05DCA0	[link-after-rts]
; ---------------------------------------------------------------------------
sub_05DCA0:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$200,$18(a4)
	move.w	#$A,$20(a4)
	clr.w	$6C(a4)
	lea.l	sub_05DCD0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
