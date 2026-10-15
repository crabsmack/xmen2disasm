; ---------------------------------------------------------------------------
; Nem_PutRowMasked - Nemesis row writer for masked VRAM output: per 8 rows (one tile) consult a bitmap to write or skip the tile
; In:  d4 = row, a4 = $C00000, d2 = rows left, $1C(a6) = tile mask bitmap
; Out: none
; Evidence: row counter -$3B04 (8 per tile), tile index -$3B06; bit (index & 7) of byte bitmap[index >> 3] selects this routine or the skip entry for the next tile; mode 2
; ---------------------------------------------------------------------------
Nem_PutRowMasked:
	move.l	d4,(a4)
loc_15F580:
	subq.w	#$1,d2
	beq.s	loc_15F58C
	subq.w	#$1,-$3B04(a5)
	beq.s	loc_15F590
	rts
loc_15F58C:
	movea.l	(a7)+,a0
	rts
loc_15F590:
	movem.l	d0-d1/a0,-(a7)
	addq.w	#$1,-$3B06(a5)
	move.w	#$8,-$3B04(a5)
	moveq	#$0,d0
	move.w	-$3B06(a5),d0
	move.l	d0,d1
	asr.w	#$3,d0
	add.l	$1C(a6),d0
	movea.l	d0,a0
	andi.w	#$7,d1
	moveq	#$1,d0
	asl.l	d1,d0
	and.b	(a0),d0
	beq.s	loc_15F5C0
	lea.l	Nem_PutRowMasked(pc),a3
	bra.s	loc_15F5C4
loc_15F5C0:
	lea.l	loc_15F580(pc),a3
loc_15F5C4:
	movem.l	(a7)+,d0-d1/a0
	rts
