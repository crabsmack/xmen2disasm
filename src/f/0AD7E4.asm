; ---------------------------------------------------------------------------
; sub_0AD7E4	[jt 895]
; ---------------------------------------------------------------------------
sub_0AD7E4:
	link.w	a6,#$0
	move.w	-$3A92(a5),d0
	ext.l	d0
	add.l	#$E0,d0
	lsl.l	#$8,d0
	move.l	d0,-$3C32(a5)
	asr.l	#$8,d0
	move.w	d0,-$38BC(a5)
	ext.l	d0
	addq.l	#$1,d0
	move.l	d0,-(a7)
	move.w	-$38BC(a5),d0
	ext.l	d0
	addq.l	#$1,d0
	move.l	d0,-(a7)
	moveq	#$3,d0
	move.l	d0,-(a7)
	jsr	$2302(a5)	; -> sub_0C0DC2
	lea.l	$230A(a5),a0
	move.l	a0,-$38F4(a5)
	unlk	a6
	rts
