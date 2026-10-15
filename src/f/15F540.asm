; ---------------------------------------------------------------------------
; Nem_DecodeLoop_Inline - Nem_DecodeLoop escape path: read an inline 7-bit (count, nibble) value from the bit stream
; In:  as Nem_DecodeLoop
; Out: as Nem_DecodeLoop
; Evidence: entered for codes >= $FC; consumes 6 escape bits then 8 data bits with byte refills, continues at the run expansion
; ---------------------------------------------------------------------------
Nem_DecodeLoop_Inline:
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
