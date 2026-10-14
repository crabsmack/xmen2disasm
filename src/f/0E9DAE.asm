; ---------------------------------------------------------------------------
; sub_0E9DAE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0E9DAE:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	sub_0E9A8C(pc)
	move.l	a4,-(a7)
	jsr	sub_0E9B2E(pc)
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	sub_0E99EC(pc)
	lea.l	$C(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_0E9DEA(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
