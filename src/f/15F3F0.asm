; ---------------------------------------------------------------------------
; Nem_DecodeLoop - Nemesis decode loop: look up 8-bit codes, expand (count, nibble) runs into 4bpp rows and emit each full row
; In:  a0 = source, a1 = code table, a3 = row writer, a4 = dest, d2 = rows left, d3 = nibbles left in row, d4 = row, d5/d6 = bit buffer/count
; Out: returns through the row writer when d2 reaches 0
; Evidence: codes >= $FC take the inline path (Nem_DecodeLoop_Inline); run nibbles from Tbl_NibbleFill masked with Tbl_NibbleMaskLow; refills a byte when fewer than 9 bits remain (the read-ahead noted under R5)
; ---------------------------------------------------------------------------
Nem_DecodeLoop:
	move.w	d6,d0
	subq.w	#$8,d0
	move.w	d5,d1
	lsr.w	d0,d1
	andi.w	#$FF,d1
	cmpi.w	#$FC,d1
	bge.w	Nem_DecodeLoop_Inline
	add.w	d1,d1
	sub.b	(a1,d1.w),d6
	cmpi.w	#$9,d6
	bge.s	loc_15F416
	addq.w	#$8,d6
	asl.w	#$8,d5
	move.b	(a0)+,d5
loc_15F416:
	move.b	$1(a1,d1.w),d1
loc_15F41A:
	move.w	d1,d0
	andi.w	#$F,d1
	beq.w	loc_15F4D8
	asl.w	#$2,d1
	move.l	Tbl_NibbleFill(pc,d1.w),d7
	andi.w	#$F0,d0
	beq.w	loc_15F500
	lsr.w	#$4,d0
	addq.w	#$1,d0
loc_15F436:
	move.w	d3,d1
	asl.w	#$2,d1
	move.l	Tbl_NibbleMaskLow(pc,d1.w),d1
	cmp.w	d3,d0
	beq.s	Nem_DecodeLoop_Row
	bgt.w	loc_15F4C8
	sub.w	d0,d3
	move.w	d3,d0
	asl.w	#$2,d0
	sub.l	Tbl_NibbleMaskLow(pc,d0.w),d1
	and.l	d7,d1
	or.l	d1,d4
	bra.s	Nem_DecodeLoop
