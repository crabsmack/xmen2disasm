; ---------------------------------------------------------------------------
; sub_1F9850	[jt 2548]
; ---------------------------------------------------------------------------
sub_1F9850:
	link.w	a6,#$0
	movem.l	d3/d7,-(a7)
	jsr	$6A(a5)	; -> Game_Init
	clr.b	-$3A06(a5)
	clr.b	-$3A02(a5)
	clr.b	-$1D4A(a5)
	move.w	#$4,-$3A04(a5)
	clr.b	-$3ABA(a5)
	move.w	#$9001,($C00004).l
	clr.w	d7
	moveq	#$40,d3
loc_1F987E:
	move.l	d7,d0
	add.w	d0,d0
	lea.l	-$3980(a5),a0
	clr.w	(a0,d0.w)
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_1F987E
	lea.l	$511A(a5),a0
	move.l	a0,-$3A14(a5)
	jsr	$72(a5)	; -> Game_InitButtonMasks
	movem.l	-$8(a6),d3/d7
	unlk	a6
	rts
