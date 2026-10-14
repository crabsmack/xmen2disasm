; ---------------------------------------------------------------------------
; sub_0E789A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0E789A:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$28B2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$3BD6(a5)
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$2822(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$3BD8(a5)
	moveq	#$3,d0
	move.l	d0,-(a7)
	lea.l	$26F2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$3BE4(a5)
	moveq	#$3,d0
	move.l	d0,-(a7)
	lea.l	$273A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$3BE2(a5)
	unlk	a6
	rts
