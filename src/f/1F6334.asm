; ---------------------------------------------------------------------------
; sub_1F6334	[jt 2503]
; ---------------------------------------------------------------------------
sub_1F6334:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	moveq	#$0,d0
	move.b	$F(a6),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	-$3886(a5),a0
	lea.l	(a0,d0.w),a4
	move.l	$2(a4),$30(a3)
	move.w	$6(a4),$34(a3)
	move.w	$8(a4),$36(a3)
	moveq	#-$4,d0
	and.b	$2E(a3),d0
	ext.w	d0
	moveq	#$3,d1
	and.b	(a4),d1
	moveq	#$0,d2
	move.b	d1,d2
	or.w	d0,d2
	move.b	d2,$2E(a3)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
