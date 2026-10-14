; ---------------------------------------------------------------------------
; sub_0DC394	[jt 1149]
; ---------------------------------------------------------------------------
sub_0DC394:
	link.w	a6,#$0
	move.w	#$FFFF,-$1A74(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$23DA(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$3BFC(a5)
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$3982(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$1A7E(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$252A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$3BFE(a5)
	unlk	a6
	rts
