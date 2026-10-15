; ---------------------------------------------------------------------------
; Seg_Create - allocate and initialise a floor segment
; In:  8(a6) = byte: type   $C(a6)..$1C(a6) = words: x1, y1, x2, y2, extra
; Out: d0 = segment record pointer (hangs if the table is full)
; Evidence: same free search as Seg_Alloc over -$33D2 records (high-water -$3474), then Seg_Setup(record, type, ...); 5 callers
; ---------------------------------------------------------------------------
Seg_Create:
	link.w	a6,#$0
	movem.l	d3-d7/a4,-(a7)
	move.w	$12(a6),d4
	move.w	$E(a6),d5
	move.b	$B(a6),d6
	move.w	g_SegFirstFree(a5),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_Segs(a5),a0
	lea.l	(a0,d0.w),a4
	move.w	g_SegFirstFree(a5),d7
	bra.s	loc_1F7CEC
loc_1F7C9A:
	move.b	(a4),d0
	ext.w	d0
	move.w	#$80,d1
	and.b	d0,d1
	bne.s	loc_1F7CE4
	cmp.w	g_SegHighWater(a5),d7
	ble.s	loc_1F7CB0
	move.w	d7,g_SegHighWater(a5)
loc_1F7CB0:
	move.w	$1E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$1A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$16(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	ext.w	d6
	ext.l	d6
	move.l	d6,-(a7)
	move.l	a4,-(a7)
	jsr	Seg_Setup(pc)
	move.l	a4,d0
	lea.l	$1C(a7),a7
	bra.s	loc_1F7CF4
loc_1F7CE4:
	move.w	d7,d0
	addq.w	#$1,d7
	lea.l	$14(a4),a4
loc_1F7CEC:
	cmpi.w	#$FF,d7
	blt.s	loc_1F7C9A
loc_1F7CF2:
	bra.s	loc_1F7CF2
loc_1F7CF4:
	movem.l	-$18(a6),d3-d7/a4
	unlk	a6
	rts
