; ---------------------------------------------------------------------------
; sub_0E9BCE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0E9BCE:
	link.w	a6,#$0
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$2,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	pea.l	($240).w
	pea.l	($140).w
	movea.l	g_Camera(a5),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$36(a0),a1
	jsr	(a1)
	movea.l	$8(a6),a0
	movea.l	$9E(a0),a0
	andi.b	#$BF,(a0)
	unlk	a6
	rts
