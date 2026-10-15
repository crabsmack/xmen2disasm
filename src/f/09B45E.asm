; ---------------------------------------------------------------------------
; sub_09B45E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_09B45E:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	-$348E(a5),d0
	ext.l	d0
	add.l	#$1A2,d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	tst.l	$96(a4)
	beq.s	loc_09B494
	move.w	-$348E(a5),d0
	ext.l	d0
	moveq	#$62,d1
	add.l	d1,d0
	lsl.l	#$8,d0
	movea.l	$96(a4),a0
	move.l	d0,$8(a0)
loc_09B494:
	moveq	#$13,d0
	move.l	d0,-(a7)
	jsr	$5252(a5)	; -> Snd_ReadDriverByte
	tst.w	d0
	addq.w	#$4,a7
	beq.s	loc_09B4B4
	clr.w	$6C(a4)
	lea.l	sub_09B55C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_09B4B4:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
