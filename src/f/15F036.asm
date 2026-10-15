; ---------------------------------------------------------------------------
; Map_PutColBlockB - column streaming helper for plane B
; In:  as Map_PutColBlockA
; Out: none
; Evidence: command $40000000, attribute base $FFC794
; ---------------------------------------------------------------------------
Map_PutColBlockB:
	movem.l	d0-d1/d5,-(a7)
	cmpi.w	#$20,d6
	blt.s	loc_15F05C
	subi.w	#$20,d6
	moveq	#$0,d0
	move.w	d6,d0
	lsl.w	#$6,d0
	add.w	d7,d0
	add.w	d0,d0
	swap	d0
	ori.l	#$40000000,d0
	move.l	d0,($C00004).l
loc_15F05C:
	movea.l	a2,a1
	move.w	d2,d0
	andi.w	#$1FF,d0
	lsl.w	#$5,d0
	adda.w	d0,a1
	moveq	#$3,d0
	btst	#$9,d2
	beq.s	loc_15F072
	eor.w	d0,d1
loc_15F072:
	add.w	d1,d1
	adda.w	d1,a1
	move.w	d4,d1
	sub.w	d4,d3
	move.w	-$3A6C(a5),d5
	move.w	d5,d0
	andi.w	#$E000,d0
	andi.w	#$7FF,d5
	move.w	d2,d4
	andi.w	#$600,d4
	lsl.w	#$2,d4
	or.w	d0,d4
	tst.w	d2
	bpl.s	loc_15F09A
	eori.w	#$8000,d4
loc_15F09A:
	btst	#$A,d2
	beq.s	loc_15F0BE
	eori.w	#$3,d1
	lsl.w	#$3,d1
	adda.w	d1,a1
	bra.s	loc_15F0B8
loc_15F0AA:
	move.w	(a1),d0
	subq.w	#$8,a1
	eor.w	d4,d0
	add.w	d5,d0
	move.w	d0,($C00000).l
loc_15F0B8:
	dbra	d3,loc_15F0AA
	bra.s	loc_15F0D6
loc_15F0BE:
	lsl.w	#$3,d1
	adda.w	d1,a1
	bra.s	loc_15F0D2
loc_15F0C4:
	move.w	(a1),d0
	addq.w	#$8,a1
	eor.w	d4,d0
	add.w	d5,d0
	move.w	d0,($C00000).l
loc_15F0D2:
	dbra	d3,loc_15F0C4
loc_15F0D6:
	movem.l	(a7)+,d0-d1/d5
	rts
