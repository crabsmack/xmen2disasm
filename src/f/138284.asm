; ---------------------------------------------------------------------------
; sub_138284	[jt 1810]
; ---------------------------------------------------------------------------
sub_138284:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$4C(a4),d0
	ext.l	d0
	move.l	$C(a4),d1
	asr.l	#$8,d1
	sub.l	d1,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	lea.l	$3B42(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$3AF2(a5)	; -> sub_13EEFA
	movea.l	-$4(a6),a4
	unlk	a6
	rts
