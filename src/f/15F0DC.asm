; ---------------------------------------------------------------------------
; Map_DrawColumnA - draw one tile column of plane A (switching VDP autoincrement to 128 and back)
; In:  registers set up by Map_StreamColumns
; Out: none
; Evidence: $C00004 = $8F80, Map_PutColBlockA per block, $8F02
; ---------------------------------------------------------------------------
Map_DrawColumnA:
	movem.l	d0/d4-d7,-(a7)
	move.w	#$8F80,($C00004).l
	movea.l	a4,a3
	move.w	d4,d0
	asr.w	#$2,d0
	add.w	d0,d0
	adda.w	d0,a3
	movea.l	g_FgRowTable(a5),a0
	move.w	d5,d0
	asr.w	#$2,d0
	add.w	d0,d0
	move.w	(a0,d0.w),d0
	add.w	d0,d0
	adda.w	d0,a3
	moveq	#$3,d1
	and.w	d4,d1
	move.w	d5,d4
	andi.w	#$3,d4
	move.w	g_FgMapW(a5),d5
	add.w	d5,d5
	moveq	#$0,d0
	move.w	d6,d0
	lsl.w	#$6,d0
	add.w	d7,d0
	add.w	d0,d0
	swap	d0
	ori.l	#$60000003,d0
	move.l	d0,($C00004).l
	move.w	d4,-(a7)
	moveq	#$4,d3
	move.w	(a3),d2
	adda.w	d5,a3
	bsr.w	Map_PutColBlockA
	addq.w	#$4,d6
	sub.w	(a7),d6
	moveq	#$6,d0
loc_15F13E:
	moveq	#$0,d4
	moveq	#$4,d3
	move.w	(a3),d2
	adda.w	d5,a3
	bsr.w	Map_PutColBlockA
	addq.w	#$4,d6
	dbra	d0,loc_15F13E
	move.w	(a7)+,d3
	beq.s	loc_15F15C
	moveq	#$0,d4
	move.w	(a3),d2
	bsr.w	Map_PutColBlockA
loc_15F15C:
	move.w	#$8F02,($C00004).l
	movem.l	(a7)+,d0/d4-d7
	rts
