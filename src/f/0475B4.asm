; ---------------------------------------------------------------------------
; sub_0475B4	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0475B4:
	link.w	a6,#$0
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	-$3AAE(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	lea.l	$95A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	pea.l	-$3596(a5)
	jsr	$506A(a5)	; -> Spr_Init
	unlk	a6
	rts
