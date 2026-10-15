; ---------------------------------------------------------------------------
; Map_PutRowPartB - row streaming helper: write part of a block row to plane B
; In:  as Map_PutRowPartA
; Out: none
; Evidence: plane B / $FFC794 version
; ---------------------------------------------------------------------------
Map_PutRowPartB:
	movem.l	d0-d1,-(a7)
	cmpi.w	#$40,d7
	blt.s	loc_15ECD8
	subi.w	#$40,d7
	moveq	#$0,d0
	move.w	d6,d0
	lsl.w	#$6,d0
	add.w	d7,d0
	add.w	d0,d0
	swap	d0
	ori.l	#$40000000,d0
	move.l	d0,($C00004).l
loc_15ECD8:
	movea.l	a2,a1
	move.w	d2,d0
	andi.w	#$1FF,d0
	lsl.w	#$5,d0
	adda.w	d0,a1
	moveq	#$3,d0
	btst	#$A,d2
	beq.s	loc_15ECEE
	eor.w	d0,d1
loc_15ECEE:
	lsl.w	d0,d1
	adda.w	d1,a1
	move.w	d4,d1
	sub.w	d4,d3
	move.w	g_BgTileAttr(a5),d5
	move.w	d5,d0
	andi.w	#$E000,d0
	andi.w	#$7FF,d5
	move.w	d2,d4
	andi.w	#$600,d4
	lsl.w	#$2,d4
	or.w	d0,d4
	tst.w	d2
	bpl.s	loc_15ED16
	eori.w	#$8000,d4
loc_15ED16:
	btst	#$9,d2
	beq.s	loc_15ED3A
	eori.w	#$3,d1
	addq.w	#$1,d1
	add.w	d1,d1
	adda.w	d1,a1
	bra.s	loc_15ED34
loc_15ED28:
	move.w	-(a1),d0
	eor.w	d4,d0
	add.w	d5,d0
	move.w	d0,($C00000).l
loc_15ED34:
	dbra	d3,loc_15ED28
	bra.s	loc_15ED50
loc_15ED3A:
	add.w	d1,d1
	adda.w	d1,a1
	bra.s	loc_15ED4C
loc_15ED40:
	move.w	(a1)+,d0
	eor.w	d4,d0
	add.w	d5,d0
	move.w	d0,($C00000).l
loc_15ED4C:
	dbra	d3,loc_15ED40
loc_15ED50:
	movem.l	(a7)+,d0-d1
	rts
