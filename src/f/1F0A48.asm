; ---------------------------------------------------------------------------
; sub_1F0A48	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F0A48:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$A6(a4)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	ori.l	#$40000,$90(a4)
	movea.l	-$35B6(a5),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	clr.w	$6C(a4)
	lea.l	sub_1F09D6(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
