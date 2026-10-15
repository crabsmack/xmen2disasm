; ---------------------------------------------------------------------------
; Eni_ReadInline - Enigma: read an inline tile word (flag bits + d4-bit index) from the bit stream
; In:  d4 = inline bit count, d5/d6 = bit buffer/count, d3 = flag bits, a3 = base add
; Out: d1 = tile word
; Evidence: refills by bytes, masks with the table at $15F71E, adds d3 and a3
; ---------------------------------------------------------------------------
Eni_ReadInline:
	cmp.w	d4,d6
	bge.s	loc_15F6FC
	addq.w	#$8,d6
	asl.l	#$8,d5
	move.b	(a0)+,d5
	bra.s	Eni_ReadInline
loc_15F6FC:
	move.w	d6,d7
	sub.w	d4,d7
	move.l	d5,d1
	lsr.l	d7,d1
	move.w	d4,d0
	sub.w	d0,d6
	cmpi.w	#$9,d6
	bge.s	loc_15F714
	addq.w	#$8,d6
	asl.l	#$8,d5
	move.b	(a0)+,d5
loc_15F714:
	add.w	d0,d0
	and.w	loc_15F71E(pc,d0.w),d1
	add.w	d3,d1
	add.w	a3,d1
loc_15F71E:
	rts
