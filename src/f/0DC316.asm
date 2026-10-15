; ---------------------------------------------------------------------------
; sub_0DC316	[jt 1147]
; ---------------------------------------------------------------------------
sub_0DC316:
	link.w	a6,#$0
	jsr	sub_0DC2C6(pc)
	move.w	#$5,-$3B32(a5)
	clr.w	-$3B3A(a5)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	-$3AAE(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	lea.l	$23D2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	pea.l	-$3596(a5)
	jsr	$506A(a5)	; -> Spr_Init
	unlk	a6
	rts
