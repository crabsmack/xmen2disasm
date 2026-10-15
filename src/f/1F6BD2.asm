; ---------------------------------------------------------------------------
; Seg_ClearAll - free all 255 floor-segment records and reset the allocation cursors
; In:  none
; Out: d0 = 254
; Evidence: clears byte +0 of every $14-byte record at g_Segs, g_SegFirstFree = 0, word $FFCD8E = 0
; ---------------------------------------------------------------------------
Seg_ClearAll:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	lea.l	g_Segs(a5),a4
	clr.w	d7
	move.w	#$FF,d3
loc_1F6BE4:
	clr.b	(a4)
	lea.l	$14(a4),a4
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_1F6BE4
	clr.w	g_SegFirstFree(a5)
	clr.w	g_SegLevelCount(a5)
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
