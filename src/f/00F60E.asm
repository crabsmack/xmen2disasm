; ---------------------------------------------------------------------------
; sub_00F60E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_00F60E:
	link.w	a6,#$0
	movem.l	d3/d7,-(a7)
	move.b	#$1,g_PalBaseDirty(a5)
	moveq	#$0,d7
	moveq	#$10,d3
loc_00F620:
	movea.l	-$3B14(a5),a0
	move.l	d7,d0
	add.l	d0,d0
	move.l	d7,d1
	add.w	d1,d1
	lea.l	g_PalBase(a5),a1
	move.w	(a0,d0.l),(a1,d1.w)
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_00F620
	movem.l	-$8(a6),d3/d7
	unlk	a6
	rts
