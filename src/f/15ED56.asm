; ---------------------------------------------------------------------------
; Map_DrawRowA - draw one tile row of plane A across the visible width
; In:  registers set up by Map_StreamRows
; Out: none
; Evidence: VRAM address = (d7 + d6*64)*2 | $60000003; Map_PutRowPartA, then Map_PutRowBlockA per block, trailing part
; ---------------------------------------------------------------------------
Map_DrawRowA:
	movem.l	d0/d4-d7,-(a7)
	movea.l	a4,a3
	move.w	d4,d0
	asr.w	#$2,d0
	add.w	d0,d0
	adda.w	d0,a3
	movea.l	-$3A72(a5),a0
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
	ori.l	#$60000003,d0
	move.l	d0,($C00004).l
	move.w	d4,-(a7)
	moveq	#$4,d3
	move.w	(a3)+,d2
	bsr.w	Map_PutRowPartA
	addq.w	#$4,d7
	sub.w	(a7),d7
	moveq	#$9,d0
	tst.b	-$13F0(a5)
	bne.s	loc_15EDAE
	moveq	#$E,d0
loc_15EDAE:
	move.w	(a3)+,d2
	bsr.w	Map_PutRowBlockA
	addq.w	#$4,d7
	dbra	d0,loc_15EDAE
	move.w	(a7)+,d3
	beq.s	loc_15EDC6
	moveq	#$0,d4
	move.w	(a3),d2
	bsr.w	Map_PutRowPartA
loc_15EDC6:
	movem.l	(a7)+,d0/d4-d7
	rts
