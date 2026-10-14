; ---------------------------------------------------------------------------
; sub_1128AE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1128AE:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.b	#$1,$AE(a4)
	move.w	#$4,$A6(a4)
	move.w	#$3,$A8(a4)
	clr.w	$6C(a4)
	lea.l	sub_1128E4(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
