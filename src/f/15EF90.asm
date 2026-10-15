; ---------------------------------------------------------------------------
; Map_PutColBlockA - column streaming helper: write the 4 tile words of one block column to plane A (VRAM autoincrement 128)
; In:  d1 = column in block, d2 = map cell, d3/d4, d6/d7, a2
; Out: none
; Evidence: wraps at row 32 with command $60000003; steps 4 words per tile down the block definition
; ---------------------------------------------------------------------------
Map_PutColBlockA:
	movem.l	d0-d1/d5,-(a7)
	cmpi.w	#$20,d6
	blt.s	loc_15EFB6
	subi.w	#$20,d6
	moveq	#$0,d0
	move.w	d6,d0
	lsl.w	#$6,d0
	add.w	d7,d0
	add.w	d0,d0
	swap	d0
	ori.l	#$60000003,d0
	move.l	d0,($C00004).l
loc_15EFB6:
	movea.l	a2,a1
	move.w	d2,d0
	andi.w	#$1FF,d0
	lsl.w	#$5,d0
	adda.w	d0,a1
	moveq	#$3,d0
	btst	#$9,d2
	beq.s	loc_15EFCC
	eor.w	d0,d1
loc_15EFCC:
	add.w	d1,d1
	adda.w	d1,a1
	move.w	d4,d1
	sub.w	d4,d3
	move.w	-$3A6A(a5),d5
	move.w	d5,d0
	andi.w	#$E000,d0
	andi.w	#$7FF,d5
	move.w	d2,d4
	andi.w	#$600,d4
	lsl.w	#$2,d4
	or.w	d0,d4
	tst.w	d2
	bpl.s	loc_15EFF4
	eori.w	#$8000,d4
loc_15EFF4:
	btst	#$A,d2
	beq.s	loc_15F018
	eori.w	#$3,d1
	lsl.w	#$3,d1
	adda.w	d1,a1
	bra.s	loc_15F012
loc_15F004:
	move.w	(a1),d0
	subq.w	#$8,a1
	eor.w	d4,d0
	add.w	d5,d0
	move.w	d0,($C00000).l
loc_15F012:
	dbra	d3,loc_15F004
	bra.s	loc_15F030
loc_15F018:
	lsl.w	#$3,d1
	adda.w	d1,a1
	bra.s	loc_15F02C
loc_15F01E:
	move.w	(a1),d0
	addq.w	#$8,a1
	eor.w	d4,d0
	add.w	d5,d0
	move.w	d0,($C00000).l
loc_15F02C:
	dbra	d3,loc_15F01E
loc_15F030:
	movem.l	(a7)+,d0-d1/d5
	rts
