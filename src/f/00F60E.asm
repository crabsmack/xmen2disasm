; ---------------------------------------------------------------------------
; AvalonB1_RestorePalette - copy the 16 saved AvalonB1 colours back into palette line 0
; In:  none
; Out: none
; Evidence: copies 16 words from the buffer at g_SceneVar3B14 (set by AvalonB1_RunScene to a stack copy) to g_PalBase, sets g_PalBaseDirty; called by AvalonB1_CamHookFinish
; ---------------------------------------------------------------------------
AvalonB1_RestorePalette:
	link.w	a6,#$0
	movem.l	d3/d7,-(a7)
	move.b	#$1,g_PalBaseDirty(a5)
	moveq	#$0,d7
	moveq	#$10,d3
loc_00F620:
	movea.l	g_SceneVar3B14(a5),a0
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
