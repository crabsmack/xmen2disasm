; ---------------------------------------------------------------------------
; sub_1A60B6	[jt 2195]
; ---------------------------------------------------------------------------
sub_1A60B6:
	link.w	a6,#$FFF8
	movem.l	d3-d7/a3-a4,-(a7)
	move.w	$A(a6),d4
	lea.l	-$3980(a5),a3
	lea.l	-$3A00(a5),a4
	tst.w	d4
	bgt.s	loc_1A60DE
	moveq	#$5,d1
	move.w	#$4,-$4(a6)
	move.w	#$3,-$6(a6)
	bra.s	loc_1A6108
loc_1A60DE:
	cmpi.w	#$2,d4
	bgt.s	loc_1A60F4
	moveq	#$3,d1
	move.w	#$2,-$4(a6)
	move.w	#$1,-$6(a6)
	bra.s	loc_1A6108
loc_1A60F4:
	cmpi.w	#$5,d4
	bgt.s	loc_1A6102
	moveq	#$1,d1
	clr.l	-$6(a6)
	bra.s	loc_1A6108
loc_1A6102:
	moveq	#$1,d0
	bra.w	loc_1A6160
loc_1A6108:
	move.w	#$7,d2
	clr.w	d6
loc_1A610E:
	move.w	(a3)+,d7
	moveq	#$9,d0
	move.w	d7,d3
	asr.w	d0,d3
	and.w	d2,d3
	add.w	-$6(a6),d3
	cmp.w	d3,d2
	bge.s	loc_1A6122
	move.w	d2,d3
loc_1A6122:
	move.w	d7,d4
	asr.w	#$5,d4
	and.w	d2,d4
	add.w	-$4(a6),d4
	cmp.w	d4,d2
	bge.s	loc_1A6132
	move.w	d2,d4
loc_1A6132:
	move.w	d7,d5
	asr.w	#$1,d5
	and.w	d2,d5
	add.w	d1,d5
	cmp.w	d5,d2
	bge.s	loc_1A6140
	move.w	d2,d5
loc_1A6140:
	moveq	#$9,d0
	lsl.l	d0,d3
	lsl.l	#$5,d4
	add.l	d4,d3
	lsl.l	#$1,d5
	add.l	d5,d3
	move.w	d3,(a4)
	addq.w	#$2,a4
	addq.w	#$1,d6
	cmpi.w	#$40,d6
	blt.s	loc_1A610E
	move.b	#$1,-$7C6(a5)
	moveq	#$0,d0
loc_1A6160:
	movem.l	-$24(a6),d3-d7/a3-a4
	unlk	a6
	rts
