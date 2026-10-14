; ---------------------------------------------------------------------------
; sub_0B6086	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0B6086:
	link.w	a6,#$0
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	-$3AAE(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$2,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$1C9A(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	-$3596(a5)
	jsr	$506A(a5)	; -> sub_1FB026
	clr.w	-$3B3A(a5)
	clr.w	-$3B32(a5)
	unlk	a6
	rts
