; ---------------------------------------------------------------------------
; sub_12287A	[jt 1700]
; ---------------------------------------------------------------------------
sub_12287A:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	sub_121DB6(pc)
	clr.w	$B2(a4)
	tst.b	$B6(a4)
	beq.s	loc_1228A4
	move.w	$B0(a4),d0
	ext.l	d0
	moveq	#$32,d1
	add.l	d1,d0
	lsl.l	#$8,d0
	bra.s	loc_1228B2
loc_1228A4:
	move.w	$B0(a4),d0
	ext.l	d0
	add.l	#$15E,d0
	lsl.l	#$8,d0
loc_1228B2:
	move.l	d0,$A4(a4)
	tst.b	$B6(a4)
	seq.b	d3
	neg.b	d3
	move.b	d3,$B6(a4)
	move.w	$12(a4),d0
	ext.l	d0
	sub.l	#$82,d0
	lsl.l	#$8,d0
	move.l	d0,$A8(a4)
	addq.w	#$4,a7
	clr.w	$6C(a4)
	lea.l	sub_1227B4(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
