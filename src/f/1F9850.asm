; ---------------------------------------------------------------------------
; sub_1F9850	[jt 2548]
; ---------------------------------------------------------------------------
sub_1F9850:
	link.w	a6,#$0
	movem.l	d3/d7,-(a7)
	jsr	$6A(a5)	; -> Game_Init
	clr.b	g_PalBaseDirty(a5)
	clr.b	g_PalFadeActive(a5)
	clr.b	g_DmaFlushReq(a5)
	move.w	#$4,g_PalFadeDelay(a5)
	clr.b	-$3ABA(a5)
	move.w	#$9001,($C00004).l
	clr.w	d7
	moveq	#$40,d3
loc_1F987E:
	move.l	d7,d0
	add.w	d0,d0
	lea.l	g_PalBase(a5),a0
	clr.w	(a0,d0.w)
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_1F987E
	lea.l	$511A(a5),a0
	move.l	a0,g_VBlankHook(a5)
	jsr	$72(a5)	; -> Game_InitButtonMasks
	movem.l	-$8(a6),d3/d7
	unlk	a6
	rts
