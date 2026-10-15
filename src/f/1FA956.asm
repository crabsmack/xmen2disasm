; ---------------------------------------------------------------------------
; sub_1FA956	[jt 2564]
; ---------------------------------------------------------------------------
sub_1FA956:
	link.w	a6,#$0
	movem.l	d3/d7,-(a7)
	clr.w	d7
	moveq	#$50,d3
loc_1FA962:
	move.b	d7,d0
	addq.b	#$1,d0
	move.l	d7,d1
	asl.w	#$3,d1
	lea.l	g_SpriteTable(a5),a0
	move.b	d0,$3(a0,d1.w)
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_1FA962
	move.b	#$50,-$1D57(a5)
	clr.b	-$1D4F(a5)
	clr.w	-$1FDC(a5)
	move.w	#$51,-$1FDE(a5)
	clr.w	-$1FE0(a5)
	movem.l	-$8(a6),d3/d7
	unlk	a6
	rts
