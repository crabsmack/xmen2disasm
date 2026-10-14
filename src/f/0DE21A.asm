; ---------------------------------------------------------------------------
; sub_0DE21A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0DE21A:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.w	#$FF,$6C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
