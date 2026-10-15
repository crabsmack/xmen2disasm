; ---------------------------------------------------------------------------
; Seg_GridCell - floor-segment grid cell at a world point: offset of that cell's segment list
; In:  8(a6) = long: x   $C(a6) = long: y
; Out: d0 = long: word from the grid (offset into the segment-index pool at -$3478)
; Evidence: cx = clamp(x >> word -$347E, 0, width -$3482 - 1), cy = clamp(y >> -$3480, 0, height -$3484 - 1); returns grid(-$347C)[cy*width + cx]; shifts and sizes set by Level_Load; callers Seg_FindAt, Seg_FindBelow, Seg_FindNearestOfType, Seg_FindContaining
; ---------------------------------------------------------------------------
Seg_GridCell:
	link.w	a6,#$0
	movem.l	d5-d7,-(a7)
	move.w	g_SegGridShiftX(a5),d0
	move.l	$8(a6),d6
	asr.l	d0,d6
	tst.w	d6
	bge.s	loc_15A7E0
	clr.w	d6
loc_15A7E0:
	cmp.w	g_SegGridW(a5),d6
	blt.s	loc_15A7EC
	move.w	g_SegGridW(a5),d6
	subq.w	#$1,d6
loc_15A7EC:
	move.w	g_SegGridShiftY(a5),d0
	move.l	$C(a6),d7
	asr.l	d0,d7
	tst.w	d7
	bge.s	loc_15A7FC
	clr.w	d7
loc_15A7FC:
	cmp.w	g_SegGridH(a5),d7
	blt.s	loc_15A808
	move.w	g_SegGridH(a5),d7
	subq.w	#$1,d7
loc_15A808:
	move.w	g_SegGridW(a5),d0
	muls.w	d7,d0
	ext.l	d6
	add.l	d6,d0
	movea.l	g_SegGrid(a5),a0
	add.l	d0,d0
	move.w	(a0,d0.l),d5
	ext.l	d5
	move.l	d5,d0
	movem.l	-$C(a6),d5-d7
	unlk	a6
	rts
