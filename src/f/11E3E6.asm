; ---------------------------------------------------------------------------
; sub_11E3E6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_11E3E6:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$12(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	moveq	#$1,d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
