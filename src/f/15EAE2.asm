; ---------------------------------------------------------------------------
; Map_PutRowBlockA - row streaming helper (register args): write the 4 tile words of one block row to plane A, wrapping at column 64
; In:  d1 = row in block, d2 = map cell word, d6/d7 = VRAM row/column, a2 = block definitions
; Out: d0/d1 kept
; Evidence: VRAM command $60000003 (plane A at $E000) on wrap; flips $200/$400, priority bit, attribute base $FFC796; two longs to $C00000
; ---------------------------------------------------------------------------
Map_PutRowBlockA:
	movem.l	d0-d1,-(a7)
	cmpi.w	#$40,d7
	blt.s	loc_15EB08
	subi.w	#$40,d7
	moveq	#$0,d0
	move.w	d6,d0
	lsl.w	#$6,d0
	add.w	d7,d0
	add.w	d0,d0
	swap	d0
	ori.l	#$60000003,d0
	move.l	d0,($C00004).l
loc_15EB08:
	movea.l	a2,a1
	move.w	d2,d0
	andi.w	#$1FF,d0
	lsl.w	#$5,d0
	adda.w	d0,a1
	moveq	#$3,d0
	btst	#$A,d2
	beq.s	loc_15EB1E
	eor.w	d0,d1
loc_15EB1E:
	lsl.w	d0,d1
	adda.w	d1,a1
	move.w	-$3A6A(a5),d5
	move.w	d5,d0
	andi.w	#$E000,d0
	andi.w	#$7FF,d5
	move.w	d2,d4
	andi.w	#$600,d4
	lsl.w	#$2,d4
	or.w	d0,d4
	tst.w	d2
	bpl.s	loc_15EB42
	eori.w	#$8000,d4
loc_15EB42:
	move.w	d4,d0
	swap	d4
	move.w	d0,d4
	move.w	d5,d0
	swap	d5
	move.w	d0,d5
	move.l	(a1)+,d1
	eor.l	d4,d1
	add.l	d5,d1
	move.l	(a1)+,d0
	eor.l	d4,d0
	add.l	d5,d0
	btst	#$9,d2
	beq.s	loc_15EB66
	swap	d1
	swap	d0
	exg.l	d0,d1
loc_15EB66:
	move.l	d1,($C00000).l
	move.l	d0,($C00000).l
	movem.l	(a7)+,d0-d1
	rts
