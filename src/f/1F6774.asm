; ---------------------------------------------------------------------------
; sub_1F6774	[jt 2510]
; ---------------------------------------------------------------------------
sub_1F6774:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$C(a6),a3
	movea.l	$8(a6),a0
	moveq	#$0,d7
	move.b	$3B(a0),d7
	tst.l	d7
	bra.s	loc_1F67B8
loc_1F678E:
	cmpi.w	#$FF,d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F679C
	moveq	#$0,d0
	bra.s	loc_1F67AA
loc_1F679C:
	ext.l	d7
	movea.l	-$34A6(a5),a0
	move.l	d7,d0
	asl.l	#$2,d0
	move.l	(a0,d0.l),d0
loc_1F67AA:
	movea.l	d0,a4
	moveq	#$0,d7
	move.b	$3C(a4),d7
	move.l	a4,-(a7)
	jsr	(a3)
	addq.w	#$4,a7
loc_1F67B8:
	cmpi.w	#$FF,d7
	bne.s	loc_1F678E
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
