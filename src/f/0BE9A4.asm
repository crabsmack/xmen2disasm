; ---------------------------------------------------------------------------
; sub_0BE9A4	[jt 1058]
; ---------------------------------------------------------------------------
sub_0BE9A4:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	jsr	sub_0BE99C(pc)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$2362(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$3C2A(a5)
	lea.l	$C(a7),a7
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$236A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$3C2C(a5)
	addq.w	#$8,a7
	unlk	a6
	rts
