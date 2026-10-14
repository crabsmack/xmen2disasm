; ---------------------------------------------------------------------------
; sub_0ADE7A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0ADE7A:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$94(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$82(a0),a1
	jsr	(a1)
	movea.l	$9C(a4),a0
	andi.b	#$BF,(a0)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_0ADBBE(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
