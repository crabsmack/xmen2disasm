; ---------------------------------------------------------------------------
; loc_1FD43E
; ---------------------------------------------------------------------------
loc_1FD43E:
	btst	#$0,d2
	beq.s	loc_1FD44C
	move.b	(a0),d0
	and.b	d4,d0
	move.b	d0,(a1)
	adda.w	(a3)+,a1
loc_1FD44C:
	move.w	g_ScalerOffsetX(a5),d7
	beq.s	loc_1FD45E
	subq.w	#$1,d7
	moveq	#$0,d0
loc_1FD456:
	move.b	d0,(a1)
	adda.w	(a3)+,a1
	dbra	d7,loc_1FD456
loc_1FD45E:
	swap	d7
	movea.l	d3,a0
	movea.l	g_ScalerColStep(a5),a4
	adda.w	(a4)+,a0
	move.l	a4,g_ScalerColStep(a5)
	movea.l	d6,a1
	movea.l	g_ScalerRowStep(a5),a4
	adda.w	(a4)+,a1
	move.l	a4,g_ScalerRowStep(a5)
	subq.w	#$1,g_ScalerBudget(a5)
	beq.w	loc_1FD50E
loc_1FD480:
	dbra	d7,loc_1FC8A0
	tst.b	g_ScalerParams+$1A(a5)
	beq.s	loc_1FD500
	move.w	g_ScalerChunkLeft(a5),d7
	bne.s	loc_1FD4DA
	move.w	g_ScalerRowsLeft(a5),d7
	beq.s	loc_1FD4B0
loc_1FD496:
	move.w	d7,d0
	moveq	#$20,d1
	sub.w	g_ScalerChunkRow(a5),d1
	cmp.w	d1,d7
	ble.s	loc_1FD4A4
	move.w	d1,d7
loc_1FD4A4:
	sub.w	d7,g_ScalerRowsLeft(a5)
	clr.w	g_ScalerChunkRow(a5)
	bsr.w	sub_1FC2A6
loc_1FD4B0:
	move.l	a1,d2
	movea.l	g_ScalerDest(a5),a1
	move.l	a1,d3
	sub.l	d3,d2
	move.w	g_ScalerVramCursor(a5),d0
	add.w	d2,g_ScalerVramCursor(a5)
	lsr.w	#$1,d2
	move.l	d2,-(a7)
	move.l	d0,-(a7)
	move.l	d3,-(a7)
	jsr	$51D2(a5)	; -> VDP_DmaToVram
	lea.l	$C(a7),a7
	move.w	g_ScalerRowsLeft(a5),d7
	bne.s	loc_1FD496
	bra.s	loc_1FD50A
loc_1FD4DA:
	move.l	a1,d2
	movea.l	g_ScalerDest(a5),a1
	move.l	a1,d3
	sub.l	d3,d2
	move.w	g_ScalerVramCursor(a5),d0
	add.w	d2,g_ScalerVramCursor(a5)
	lsr.w	#$1,d2
	move.l	d2,-(a7)
	move.l	d0,-(a7)
	move.l	d3,-(a7)
	jsr	$51D2(a5)	; -> VDP_DmaToVram
	lea.l	$C(a7),a7
	bra.w	loc_1FC884
loc_1FD500:
	move.w	g_ScalerRowsLeft(a5),d7
	beq.s	loc_1FD50A
	bsr.w	sub_1FC2A6
loc_1FD50A:
	moveq	#$0,d0
	rts
loc_1FD50E:
	movem.l	d0-d7/a0-a4,g_ScalerRegSave(a5)
	lea.l	loc_1FD480(pc),a0
	move.l	a0,g_ScalerResumePC(a5)
	moveq	#$1,d0
	rts
