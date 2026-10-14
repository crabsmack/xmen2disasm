; ---------------------------------------------------------------------------
; sub_082176	[jt 556]
; ---------------------------------------------------------------------------
sub_082176:
	link.w	a6,#$0
	movem.l	d4-d7,-(a7)
	clr.w	d4
	clr.w	d5
	movea.l	-$CAE(a5),a0
	moveq	#$0,d0
	move.w	$2(a0),d0
	lsl.l	#$3,d0
	move.l	d0,d6
	sub.l	#$140,d6
	movea.l	-$CAE(a5),a0
	moveq	#$0,d0
	move.w	$4(a0),d0
	lsl.l	#$3,d0
	move.l	d0,d7
	sub.l	#$E0,d7
	move.w	d4,-$3A98(a5)
	move.w	d4,-$3A90(a5)
	move.w	d5,-$3A9C(a5)
	move.w	d5,-$3A94(a5)
	move.w	d6,-$3A96(a5)
	move.w	d6,-$3A8E(a5)
	move.w	d7,-$3A9A(a5)
	move.w	d7,-$3A92(a5)
	movem.l	-$10(a6),d4-d7
	unlk	a6
	rts
