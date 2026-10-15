; ---------------------------------------------------------------------------
; Map_DrawRowB - draw one tile row of plane B across the visible width
; In:  registers set up by Map_StreamRows
; Out: none
; Evidence: plane B version of Map_DrawRowA
; ---------------------------------------------------------------------------
Map_DrawRowB:
	movem.l	d0/d4-d7,-(a7)
	movea.l	a4,a3
	move.w	d4,d0
	asr.w	#$2,d0
	add.w	d0,d0
	adda.w	d0,a3
	movea.l	g_BgRowTable(a5),a0
	move.w	d5,d0
	asr.w	#$2,d0
	add.w	d0,d0
	move.w	(a0,d0.w),d0
	add.w	d0,d0
	adda.w	d0,a3
	moveq	#$3,d1
	and.w	d5,d1
	andi.w	#$3,d4
	moveq	#$0,d0
	move.w	d6,d0
	lsl.w	#$6,d0
	add.w	d7,d0
	add.w	d0,d0
	swap	d0
	ori.l	#$40000000,d0
	move.l	d0,($C00004).l
	move.w	d4,-(a7)
	moveq	#$4,d3
	move.w	(a3)+,d2
	bsr.w	Map_PutRowPartB
	addq.w	#$4,d7
	sub.w	(a7),d7
	moveq	#$E,d0
	tst.b	g_BgWrapX(a5)
	bne.s	loc_15EE2A
	tst.b	g_BgNarrow(a5)
	beq.s	loc_15EE2A
	moveq	#$9,d0
loc_15EE2A:
	move.w	(a3)+,d2
	bsr.w	Map_PutRowBlockB
	addq.w	#$4,d7
	dbra	d0,loc_15EE2A
	move.w	(a7)+,d3
	beq.s	loc_15EE42
	moveq	#$0,d4
	move.w	(a3),d2
	bsr.w	Map_PutRowPartB
loc_15EE42:
	movem.l	(a7)+,d0/d4-d7
	rts
