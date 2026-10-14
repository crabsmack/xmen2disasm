; ---------------------------------------------------------------------------
; sub_1FE544	[jt 2622]
; ---------------------------------------------------------------------------
sub_1FE544:
	link.w	a6,#$0
	jsr	sub_1FE44E(pc)
	jsr	sub_1FE48E(pc)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	jsr	sub_1FE518(pc)
	moveq	#$B,d0
	move.l	d0,-(a7)
	jsr	sub_1FE518(pc)
	move.l	$8(a6),-(a7)
	jsr	sub_1FE528(pc)
	move.l	$C(a6),-(a7)
	jsr	sub_1FE528(pc)
	move.l	$10(a6),-(a7)
	jsr	sub_1FE528(pc)
	move.l	$14(a6),-(a7)
	jsr	sub_1FE528(pc)
	unlk	a6
	rts
