; ---------------------------------------------------------------------------
; sub_1F2306	[jt 2443]
; ---------------------------------------------------------------------------
sub_1F2306:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4E7A(a5)	; -> sub_1F6530
	ori.l	#$8,$90(a4)
	moveq	#$0,d0
	move.l	d0,$44(a4)
	movea.l	$8C(a4),a0
	moveq	#$0,d1
	move.b	$2D(a0),d1
	cmpi.w	#$FF,d1
	addq.w	#$4,a7
	beq.s	loc_1F2358
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$2D(a0),d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$2D(a0),d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
loc_1F2358:
	movea.l	$8C(a4),a0
	move.w	$E(a0),$20(a4)
	move.w	$10(a0),$18(a4)
	move.w	$12(a0),$22(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
