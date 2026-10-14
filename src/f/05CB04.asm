; ---------------------------------------------------------------------------
; sub_05CB04	[link-after-rts]
; ---------------------------------------------------------------------------
sub_05CB04:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$10(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	move.w	#$1E,$6E(a4)
	lea.l	sub_05C4A0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
