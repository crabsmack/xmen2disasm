; ---------------------------------------------------------------------------
; sub_1F66F0	[jt 2509]
; ---------------------------------------------------------------------------
sub_1F66F0:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	lea.l	$4DC2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$46(a0),a1
	jsr	(a1)
	clr.w	$4(a4)
	move.l	$7C(a4),-(a7)
	jsr	$4FEA(a5)	; -> Timer_Free
	moveq	#$0,d0
	move.l	d0,$7C(a4)
	moveq	#$0,d1
	move.b	$14(a4),d1
	cmpi.w	#$FF,d1
	beq.s	loc_1F676C
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
loc_1F676C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
