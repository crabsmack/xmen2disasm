; ---------------------------------------------------------------------------
; Nem_Decode - decompress Nemesis-style tile data to RAM, to VRAM, or to VRAM through a tile mask
; In:  8(a6) = compressed source   $C(a6) = 256-word code table (Nem_BuildCodeTable)   $10(a6) = long: rows (8 per tile)   $14(a6) = byte: mode 0 RAM / 1 VRAM / 2 VRAM masked   $18(a6) = RAM dest or VRAM byte address   $1C(a6) = tile mask bitmap (mode 2)
; Out: none
; Evidence: selects the row writer in a3 (Nem_PutRowRam / Nem_PutRowVdp / Nem_PutRowMasked), sets the VDP write address for modes 1-2, then Nem_DecodeLoop; callers Spr_UploadFrame, Spr_PreloadTiles, sub_1F5612, sub_1FBE96, sub_1FD72C
; ---------------------------------------------------------------------------
Nem_Decode:
	link.w	a6,#$0
	movem.l	d3-d7/a2-a4,-(a7)
	lea.l	Nem_PutRowRam(pc),a3
	movea.l	$18(a6),a4
	move.b	$17(a6),d0
	beq.s	loc_15F3CC
	cmpi.b	#$1,d0
	beq.s	loc_15F3AA
	lea.l	Nem_PutRowMasked(pc),a3
	move.w	#$8,-$3B04(a5)
	move.w	#$0,-$3B06(a5)
	bra.s	loc_15F3AE
loc_15F3AA:
	lea.l	Nem_PutRowVdp(pc),a3
loc_15F3AE:
	move.l	a4,d0
	lsl.l	#$2,d0
	lsr.w	#$2,d0
	swap	d0
	bset	#$1E,d0
	andi.l	#$7FFF0003,d0
	move.l	d0,($C00004).l
	lea.l	($C00000).l,a4
loc_15F3CC:
	move.l	$10(a6),d2
	movea.l	$C(a6),a1
	movea.l	$8(a6),a0
	moveq	#$8,d3
	moveq	#$0,d4
	move.b	(a0)+,d5
	asl.w	#$8,d5
	move.b	(a0)+,d5
	move.w	#$10,d6
	bsr.s	Nem_DecodeLoop
	movem.l	(a7)+,d3-d7/a2-a4
	unlk	a6
	rts
