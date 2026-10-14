; ---------------------------------------------------------------------------
; loc_15F540
; ---------------------------------------------------------------------------
loc_15F540:
	subq.w	#$6,d6
	cmpi.w	#$9,d6
	bge.s	loc_15F54E
	addq.w	#$8,d6
	asl.w	#$8,d5
	move.b	(a0)+,d5
loc_15F54E:
	subq.w	#$8,d6
	move.w	d5,d1
	lsr.w	d6,d1
	cmpi.w	#$9,d6
	bge.w	loc_15F41A
	addq.w	#$8,d6
	asl.w	#$8,d5
	move.b	(a0)+,d5
	bra.w	loc_15F41A
