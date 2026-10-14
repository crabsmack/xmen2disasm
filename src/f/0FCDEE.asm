; ---------------------------------------------------------------------------
; sub_0FCDEE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0FCDEE:
	link.w	a6,#$0
	moveq	#$3,d0
	move.l	d0,-(a7)
	lea.l	$3662(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$1A88(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$2982(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$3B0E(a5)
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$39FA(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$1A74(a5)
	unlk	a6
	rts
