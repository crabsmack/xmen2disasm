; ---------------------------------------------------------------------------
; sub_120944	[jt 1685]
; ---------------------------------------------------------------------------
sub_120944:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	lea.l	$3572(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$46(a0),a1
	jsr	(a1)
	moveq	#$1,d0
	cmp.b	$96(a4),d0
	addq.w	#$4,a7
	bne.s	loc_1209D0
	clr.w	$4(a4)
	move.l	$7C(a4),-(a7)
	jsr	$4FEA(a5)	; -> sub_1F9D38
	moveq	#$0,d0
	move.l	d0,$7C(a4)
	moveq	#$0,d1
	move.b	$14(a4),d1
	cmpi.w	#$FF,d1
	addq.w	#$4,a7
	beq.s	loc_1209D0
	moveq	#$0,d0
	move.b	$14(a4),d0
	movea.l	-$38DC(a5),a0
	move.l	d0,d1
	mulu.w	#$E,d0
	swap	d1
	mulu.w	#$E,d1
	swap	d1
	clr.w	d1
	add.l	d1,d0
	andi.b	#$FD,$4(a0,d0.l)
	moveq	#$0,d0
	move.b	$14(a4),d0
	movea.l	-$38DC(a5),a0
	move.l	d0,d1
	mulu.w	#$E,d0
	swap	d1
	mulu.w	#$E,d1
	swap	d1
	clr.w	d1
	add.l	d1,d0
	move.b	#$FF,$5(a0,d0.l)
loc_1209D0:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
