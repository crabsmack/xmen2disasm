; ---------------------------------------------------------------------------
; VDP_WriteWords - copy N words from memory to the VDP data port (address already set)
; In:  4(a7) = src pointer   8(a7) = long: word count
; Out: none
; Evidence: loop move.w (a0)+,$C00000; callers set the VDP address first (Level_LoadMaps, Spr_PreloadTiles, Spr_UploadFrame, Art_LoadToVramRecolor)
; ---------------------------------------------------------------------------
VDP_WriteWords:
	movea.l	$4(a7),a0
	move.l	$8(a7),d0
	bra.s	loc_1FE012
loc_1FE00C:
	move.w	(a0)+,($C00000).l
loc_1FE012:
	dbra	d0,loc_1FE00C
	rts
