; ---------------------------------------------------------------------------
; sub_15EC0E
; ---------------------------------------------------------------------------
sub_15EC0E:
	movem.l	d0-d1,-(a7)
	cmpi.w	#$40,d7
	blt.s	loc_15EC34
	subi.w	#$40,d7
	moveq	#$0,d0
	move.w	d6,d0
	lsl.w	#$6,d0
	add.w	d7,d0
	add.w	d0,d0
	swap	d0
	ori.l	#$60000003,d0
	move.l	d0,($C00004).l
loc_15EC34:
	movea.l	a2,a1
	move.w	d2,d0
	andi.w	#$1FF,d0
	lsl.w	#$5,d0
	adda.w	d0,a1
	moveq	#$3,d0
	btst	#$A,d2
	beq.s	loc_15EC4A
	eor.w	d0,d1
loc_15EC4A:
	lsl.w	d0,d1
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
	bpl.s	loc_15EC72
	eori.w	#$8000,d4
loc_15EC72:
	btst	#$9,d2
	beq.s	loc_15EC96
	eori.w	#$3,d1
	addq.w	#$1,d1
	add.w	d1,d1
	adda.w	d1,a1
	bra.s	loc_15EC90
loc_15EC84:
	move.w	-(a1),d0
	eor.w	d4,d0
	add.w	d5,d0
	move.w	d0,($C00000).l
loc_15EC90:
	dbra	d3,loc_15EC84
	bra.s	loc_15ECAC
loc_15EC96:
	add.w	d1,d1
	adda.w	d1,a1
	bra.s	loc_15ECA8
loc_15EC9C:
	move.w	(a1)+,d0
	eor.w	d4,d0
	add.w	d5,d0
	move.w	d0,($C00000).l
loc_15ECA8:
	dbra	d3,loc_15EC9C
loc_15ECAC:
	movem.l	(a7)+,d0-d1
	rts
