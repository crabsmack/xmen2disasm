; ---------------------------------------------------------------------------
; sub_0F4AEE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0F4AEE:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$2952(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,d7
	move.l	d7,d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	-$3886(a5),a0
	lea.l	(a0,d0.w),a4
	move.w	$6(a4),-$3B06(a5)
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
