; ---------------------------------------------------------------------------
; sub_1F62C0	[jt 2502]
; ---------------------------------------------------------------------------
sub_1F62C0:
	link.w	a6,#$0
	move.l	d3,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	-$3598(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.w	$E(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.l	d0,-(a7)
	move.l	$8(a6),-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	move.w	-$34A2(a5),d2
	ext.l	d2
	lsl.l	#$2,d2
	move.l	d2,d3
	lsl.l	#$2,d2
	add.l	d3,d2
	lea.l	-$3886(a5),a0
	pea.l	(a0,d2.w)
	jsr	$506A(a5)	; -> sub_1FB026
	move.w	-$3598(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	-$34A2(a5),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	-$3886(a5),a0
	pea.l	(a0,d0.w)
	jsr	$505A(a5)	; -> sub_1FAD08
	move.w	d0,-$3598(a5)
	move.w	-$34A2(a5),d0
	addq.w	#$1,-$34A2(a5)
	move.l	-$4(a6),d3
	unlk	a6
	rts
