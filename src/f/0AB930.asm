; ---------------------------------------------------------------------------
; sub_0AB930	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0AB930:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$8,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	andi.w	#$FFFD,$8C(a4)
	subi.l	#$A00,$C(a4)
	move.l	a4,-(a7)
	jsr	sub_0AB526(pc)
	lea.l	$C(a7),a7
	move.w	#$6,$6C(a4)
	lea.l	sub_0AB9A8(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
