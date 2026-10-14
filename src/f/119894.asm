; ---------------------------------------------------------------------------
; sub_119894	[jt 1495]
; ---------------------------------------------------------------------------
sub_119894:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	move.l	d0,-(a7)
	movea.l	(a4),a0
	move.l	$12(a0),-(a7)
	jsr	$4FD2(a5)	; -> sub_1F9C92
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$10(a7),a7
	beq.s	loc_11990A
	move.l	a3,-(a7)
	jsr	$4FDA(a5)	; -> sub_1F9D04
	addq.w	#$4,a7
	clr.b	$36(a4)
	clr.w	d7
	moveq	#$A,d3
loc_1198CC:
	ext.l	d7
	move.l	d7,d0
	asl.l	#$2,d0
	moveq	#$0,d1
	move.l	d1,$4(a4,d0.l)
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_1198CC
	lea.l	sub_119BCA(pc),a0
	move.l	a0,$2C(a4)
	clr.w	$34(a4)
	move.l	$C(a6),$30(a4)
	move.b	$13(a6),$37(a4)
	move.b	#$1,$38(a4)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$16(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_11990A:
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
