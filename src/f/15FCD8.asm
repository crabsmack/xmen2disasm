; ---------------------------------------------------------------------------
; Tile_RemapWords - replace the index part of tile words through a lookup table
; In:  8(a6) = tile words, $C(a6) = word table, $10(a6) = word index mask, $14(a6) = word count
; Out: none
; Evidence: w = (w & ~mask) | table[w & mask]; caller Level_LoadUsedTiles (compacts used tiles)
; ---------------------------------------------------------------------------
Tile_RemapWords:
	movea.l	$4(a7),a0
	movea.l	$8(a7),a1
	move.w	$E(a7),d1
	move.l	$10(a7),d2
	movem.l	d3-d4,-(a7)
	move.w	d1,d4
	not.w	d4
	bra.s	loc_15FD04
loc_15FCF2:
	move.w	(a0),d0
	move.w	d0,d3
	and.w	d1,d0
	and.w	d4,d3
	add.w	d0,d0
	move.w	(a1,d0.w),d0
	or.w	d3,d0
	move.w	d0,(a0)+
loc_15FD04:
	dbra	d2,loc_15FCF2
	movem.l	(a7)+,d3-d4
	rts
