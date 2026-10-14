; ---------------------------------------------------------------------------
; sub_0AB97C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0AB97C:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	sub_0AB526(pc)
	addq.w	#$4,a7
	clr.w	$6C(a4)
	lea.l	sub_0AB9A8(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
