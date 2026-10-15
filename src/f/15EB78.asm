; ---------------------------------------------------------------------------
; Map_PutRowBlockB - row streaming helper: like Map_PutRowBlockA for plane B
; In:  d1, d2, d6/d7, a2 as Map_PutRowBlockA
; Out: d0/d1 kept
; Evidence: VRAM command $40000000 (plane B at $0000), attribute base $FFC794
; ---------------------------------------------------------------------------
Map_PutRowBlockB:
	movem.l	d0-d1,-(a7)
	cmpi.w	#$40,d7
	blt.s	loc_15EB9E
	subi.w	#$40,d7
	moveq	#$0,d0
	move.w	d6,d0
	lsl.w	#$6,d0
	add.w	d7,d0
	add.w	d0,d0
	swap	d0
	ori.l	#$40000000,d0
	move.l	d0,($C00004).l
loc_15EB9E:
	movea.l	a2,a1
	move.w	d2,d0
	andi.w	#$1FF,d0
	lsl.w	#$5,d0
	adda.w	d0,a1
	moveq	#$3,d0
	btst	#$A,d2
	beq.s	loc_15EBB4
	eor.w	d0,d1
loc_15EBB4:
	lsl.w	d0,d1
	adda.w	d1,a1
	move.w	-$3A6C(a5),d5
	move.w	d5,d0
	andi.w	#$E000,d0
	andi.w	#$7FF,d5
	move.w	d2,d4
	andi.w	#$600,d4
	lsl.w	#$2,d4
	or.w	d0,d4
	tst.w	d2
	bpl.s	loc_15EBD8
	eori.w	#$8000,d4
loc_15EBD8:
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
	beq.s	loc_15EBFC
	swap	d1
	swap	d0
	exg.l	d0,d1
loc_15EBFC:
	move.l	d1,($C00000).l
	move.l	d0,($C00000).l
	movem.l	(a7)+,d0-d1
	rts
