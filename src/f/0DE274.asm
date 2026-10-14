; ---------------------------------------------------------------------------
; sub_0DE274	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0DE274:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$3,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	moveq	#$8,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$6E(a0),a1
	jsr	(a1)
	move.w	#$FF,$6C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
