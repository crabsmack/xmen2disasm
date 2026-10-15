; ---------------------------------------------------------------------------
; ClassList_InitAll - allocate the per-class pointer array and call ClassInit (slot +$5E) for every class in g_ClassList
; In:  none
; Out: none
; Evidence: count = (list word - 2)/4; fewer than 1 -> clears g_ClassList and -$10F4; Mem_StackAlloc(count*4, empty tag) -> -$10F4 zeroed; descriptor +$5E (0, index)
; ---------------------------------------------------------------------------
ClassList_InitAll:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	tst.l	g_ClassList(a5)
	beq.s	loc_1FA86C
	movea.l	g_ClassList(a5),a0
	move.w	(a0),d0
	ext.l	d0
	subq.l	#$2,d0
	move.l	d0,d6
	asr.l	#$2,d6
	moveq	#$1,d0
	cmp.l	d6,d0
	ble.s	loc_1FA816
	moveq	#$0,d0
	move.l	d0,g_ClassList(a5)
	move.l	d0,-$10F4(a5)
	bra.s	loc_1FA86C
loc_1FA816:
	pea.l	Str_Empty_1FA876(pc)
	move.l	d6,d0
	asl.l	#$2,d0
	move.l	d0,-(a7)
	jsr	Mem_StackAlloc(pc)
	move.l	d0,-$10F4(a5)
	moveq	#$0,d7
	addq.w	#$8,a7
	bra.s	loc_1FA842
loc_1FA82E:
	movea.l	-$10F4(a5),a0
	move.l	d7,d0
	asl.l	#$2,d0
	moveq	#$0,d1
	move.l	d1,(a0,d0.l)
	move.l	d7,d0
	addq.l	#$1,d7
	addq.w	#$4,a4
loc_1FA842:
	cmp.l	d7,d6
	bgt.s	loc_1FA82E
	movea.l	g_ClassList(a5),a0
	lea.l	$2(a0),a4
	moveq	#$0,d7
	bra.s	loc_1FA868
loc_1FA852:
	movea.l	(a4),a0
	movea.l	$5E(a0),a3
	move.l	d7,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	(a3)
	addq.w	#$8,a7
	move.l	d7,d0
	addq.l	#$1,d7
	addq.w	#$4,a4
loc_1FA868:
	cmp.l	d7,d6
	bgt.s	loc_1FA852
loc_1FA86C:
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
