; ---------------------------------------------------------------------------
; sub_0EB670	[jt 1282]
; ---------------------------------------------------------------------------
sub_0EB670:
	link.w	a6,#$0
	move.l	a4,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	($ED).w
	moveq	#$16,d1
	move.l	d1,-(a7)
	moveq	#$11,d0
	move.l	d0,-(a7)
	jsr	$3FDA(a5)	; -> sub_15D7F8
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	($ED).w
	moveq	#$16,d1
	move.l	d1,-(a7)
	moveq	#$12,d0
	move.l	d0,-(a7)
	jsr	$3FDA(a5)	; -> sub_15D7F8
	movea.l	-$3A72(a5),a0
	move.w	$2C(a0),d0
	ext.l	d0
	moveq	#$12,d1
	add.l	d1,d0
	movea.l	-$3A84(a5),a0
	add.l	d0,d0
	lea.l	(a0,d0.l),a4
	ori.w	#$200,(a4)
	moveq	#$16,d0
	move.l	d0,-(a7)
	moveq	#$12,d1
	move.l	d1,-(a7)
	jsr	$3FD2(a5)	; -> sub_15D7D8
	movea.l	-$4(a6),a4
	unlk	a6
	rts
