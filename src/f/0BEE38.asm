; ---------------------------------------------------------------------------
; SporeMine_InitPool - SPOREMINE: create the spore pool (20 records of $26 bytes), its update timer and its draw-list entry
; In:  none
; Out: none
; Evidence: Mem_StackAlloc($2F8) -> -$3C28, count -$3C24 := 0; Timer_Create(SporeMine_UpdatePool, 0, 0, 1); DrawList_Add(SporeMine_DrawPool); TAS 27879-29685
; Found: link-after-rts
; ---------------------------------------------------------------------------
SporeMine_InitPool:
	link.w	a6,#$0
	movem.l	d4-d7/a4,-(a7)
	move.w	#$2F8,d7
	clr.b	d4
	moveq	#$7F,d5
	clr.b	d6
	pea.l	Str_Empty_0BEECE(pc)
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.l	d0,g_SporeMinePool(a5)
	clr.w	g_SporeMinePoolCount(a5)
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	g_SporeMinePool(a5),-(a7)
	jsr	$4DB2(a5)	; -> Mem_Set
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	pea.l	SporeMine_UpdatePool(pc)
	jsr	$4FD2(a5)	; -> Timer_Create
	movea.l	d0,a4
	move.l	a4,d0
	lea.l	$24(a7),a7
	beq.s	loc_0BEE92
	move.l	a4,-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	addq.w	#$4,a7
loc_0BEE92:
	moveq	#$0,d0
	move.l	d0,-(a7)
	tst.b	d6
	beq.s	loc_0BEE9E
	moveq	#$8,d1
	bra.s	loc_0BEEA0
loc_0BEE9E:
	moveq	#$0,d1
loc_0BEEA0:
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.b	d5,d0
	move.l	d0,-(a7)
	tst.b	d4
	beq.s	loc_0BEEB0
	moveq	#$4,d0
	bra.s	loc_0BEEB2
loc_0BEEB0:
	moveq	#$0,d0
loc_0BEEB2:
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	SporeMine_DrawPool(pc)
	jsr	$4F6A(a5)	; -> DrawList_Add
	lea.l	$18(a7),a7
	movem.l	-$14(a6),d4-d7/a4
	unlk	a6
	rts
