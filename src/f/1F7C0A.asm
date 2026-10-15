; ---------------------------------------------------------------------------
; Seg_Alloc - find a free floor-segment record, starting from the low-water index, and track the high-water mark
; In:  none
; Out: d0 = word: record index (hangs if none below $FF)
; Evidence: records of $14 bytes at g_Segs(a5) ($FFCE2E), bit 7 of +0 = in use; start index word g_SegFirstFree, high-water word g_SegHighWater
; ---------------------------------------------------------------------------
Seg_Alloc:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	move.w	g_SegFirstFree(a5),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_Segs(a5),a0
	lea.l	(a0,d0.w),a4
	move.w	g_SegFirstFree(a5),d7
	move.w	#$FF,d3
	bra.s	loc_1F7C5A
loc_1F7C32:
	move.b	(a4),d0
	ext.w	d0
	move.w	#$80,d1
	and.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	tst.l	d0
	bne.s	loc_1F7C52
	cmp.w	g_SegHighWater(a5),d7
	ble.s	loc_1F7C4E
	move.w	d7,g_SegHighWater(a5)
loc_1F7C4E:
	move.w	d7,d0
	bra.s	loc_1F7C60
loc_1F7C52:
	lea.l	$14(a4),a4
	move.w	d7,d0
	addq.w	#$1,d7
loc_1F7C5A:
	cmp.w	d7,d3
	bgt.s	loc_1F7C32
loc_1F7C5E:
	bra.s	loc_1F7C5E
loc_1F7C60:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
