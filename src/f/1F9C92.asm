; ---------------------------------------------------------------------------
; sub_1F9C92	[jt 2550]
; ---------------------------------------------------------------------------
sub_1F9C92:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a3-a4,-(a7)
	move.b	$17(a6),d5
	move.w	$E(a6),d6
	movea.l	$8(a6),a3
	lea.l	-$10E8(a5),a4
	clr.w	d7
	moveq	#$1E,d3
loc_1F9CAE:
	moveq	#-$3,d0
	cmp.w	(a4),d0
	bne.s	loc_1F9CEC
	move.l	a3,$C(a4)
	move.w	d6,$2(a4)
	move.l	$10(a6),$10(a4)
	move.b	d5,$14(a4)
	move.w	#$FFFE,(a4)
	tst.l	-$10EC(a5)
	beq.s	loc_1F9CD8
	movea.l	-$10EC(a5),a0
	move.l	a4,$8(a0)
loc_1F9CD8:
	move.l	-$10EC(a5),$4(a4)
	moveq	#$0,d0
	move.l	d0,$8(a4)
	move.l	a4,-$10EC(a5)
	move.l	a4,d0
	bra.s	loc_1F9CFA
loc_1F9CEC:
	lea.l	$16(a4),a4
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_1F9CAE
	moveq	#$0,d0
loc_1F9CFA:
	movem.l	-$18(a6),d3/d5-d7/a3-a4
	unlk	a6
	rts
