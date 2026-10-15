; ---------------------------------------------------------------------------
; Eni_Ops - Enigma command dispatch: branch table and the copy loops for each command
; In:  as Eni_Decode (a1 dest, a2 incrementing word, a4 common word, d2 count)
; Out: none
; Evidence: 8 bra.s entries then loops: write a2 incrementing, write a4, inline repeated, inline incremented, inline decremented, inline list; return to the command loop at $15F628
; ---------------------------------------------------------------------------
Eni_Ops:
	bra.s	loc_15F66C
loc_15F65E:
	bra.s	loc_15F66C
loc_15F660:
	bra.s	loc_15F676
loc_15F662:
	bra.s	loc_15F676
loc_15F664:
	bra.s	loc_15F67E
loc_15F666:
	bra.s	loc_15F688
loc_15F668:
	bra.s	loc_15F694
loc_15F66A:
	bra.s	loc_15F6A0
loc_15F66C:
	move.w	a2,(a1)+
	addq.w	#$1,a2
	dbra	d2,loc_15F66C
	bra.s	$15F628
loc_15F676:
	move.w	a4,(a1)+
	dbra	d2,loc_15F676
	bra.s	$15F628
loc_15F67E:
	bsr.s	Eni_ReadInline
loc_15F680:
	move.w	d1,(a1)+
	dbra	d2,loc_15F680
	bra.s	$15F628
loc_15F688:
	bsr.s	Eni_ReadInline
loc_15F68A:
	move.w	d1,(a1)+
	addq.w	#$1,d1
	dbra	d2,loc_15F68A
	bra.s	$15F628
loc_15F694:
	bsr.s	Eni_ReadInline
loc_15F696:
	move.w	d1,(a1)+
	subq.w	#$1,d1
	dbra	d2,loc_15F696
	bra.s	$15F628
loc_15F6A0:
	cmpi.w	#$E,d2
	beq.s	loc_15F6B8
	cmpi.w	#$F,d2
	beq.s	loc_15F6E8
loc_15F6AC:
	bsr.s	Eni_ReadInline
	move.w	d1,(a1)+
	dbra	d2,loc_15F6AC
	bra.w	$15F628
loc_15F6B8:
	subq.w	#$5,d6
	moveq	#$0,d3
	move.w	d5,d3
	lsr.w	d6,d3
	lsl.l	#$8,d3
	lsl.l	#$3,d3
	cmpi.w	#$9,d6
	bge.s	loc_15F6D0
	addq.w	#$8,d6
	asl.w	#$8,d5
	move.b	(a0)+,d5
loc_15F6D0:
	move.w	a2,d0
	andi.w	#$7FF,d0
	add.w	d3,d0
	movea.w	d0,a2
	move.w	a4,d0
	andi.w	#$7FF,d0
	add.w	d3,d0
	movea.w	d0,a4
	bra.w	$15F628
loc_15F6E8:
	movem.l	(a7)+,d3-d7/a2-a4
	unlk	a6
	rts
