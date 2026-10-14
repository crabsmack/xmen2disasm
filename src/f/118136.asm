; ---------------------------------------------------------------------------
; sub_118136	[jt 1461]
; ---------------------------------------------------------------------------
sub_118136:
	link.w	a6,#$0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	moveq	#$0,d2
	move.b	$13(a6),d2
	move.l	d2,-(a7)
	move.l	$C(a6),-(a7)
	move.l	$8(a6),-(a7)
	jsr	sub_118074(pc)
	lea.l	$10(a7),a7
	move.l	d0,d1
	move.l	(a7)+,d0
	tst.l	d1
	sne.b	d0
	neg.b	d0
	unlk	a6
	rts
