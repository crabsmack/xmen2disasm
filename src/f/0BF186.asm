; ---------------------------------------------------------------------------
; sub_0BF186	[jt 1068]
; ---------------------------------------------------------------------------
sub_0BF186:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$C(a6),a4
	move.l	$A(a4),-(a7)
	jsr	sub_0BF106(pc)
	movea.l	d0,a3
	move.l	a3,d0
	beq.s	loc_0BF1B6
	move.l	a4,$8(a3)
	move.b	#$FF,$5(a4)
	andi.b	#$FE,$4(a4)
	ori.b	#$2,$4(a4)
loc_0BF1B6:
	moveq	#$0,d0
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
