; ---------------------------------------------------------------------------
; Seg_ApplyObjPos - place a walker on its floor segment: compute its x/y from its position along the segment (+$72) and the segment slope
; In:  8(a6) = object (+$76 = segment it stands on)
; Out: d0
; Evidence: segment type hook (g_SegTypeHooks[type]) gets message 6 first and may handle it; else by type: 1/$24 and 2/$23 vertical (y from the end, x = slope * pos), 3/$E/$F/$21 sloped (x = x1 + pos, y = y1 + slope*pos), 4/$22 reversed from x2/y2, $13-$1C flat (x only); types 5-$D do nothing; writes +8/+$C (<< 8)
; ---------------------------------------------------------------------------
Seg_ApplyObjPos:
	link.w	a6,#$0
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$76(a3),a4
	move.l	a4,d0
	beq.w	loc_1F6EBA
	move.b	$1(a4),d0
	ext.w	d0
	asl.w	#$2,d0
	lea.l	g_SegTypeHooks(a5),a0
	move.l	(a0,d0.w),g_SegHookTmp(a5)
	beq.s	loc_1F6DBA
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	moveq	#$6,d1
	move.l	d1,-(a7)
	movea.l	g_SegHookTmp(a5),a0
	jsr	(a0)
	tst.w	d0
	lea.l	$10(a7),a7
	bra.s	loc_1F6DBC
loc_1F6DBA:
	moveq	#$0,d0
loc_1F6DBC:
	bne.w	loc_1F6EBA
	move.w	$8(a4),d5
	move.w	$A(a4),d6
	move.l	$72(a3),d7
	asr.l	#$8,d7
	move.w	$4(a4),d0
	muls.w	d7,d0
	move.l	d0,d4
	asr.l	#$8,d4
	move.b	$1(a4),d0
	subq.b	#$1,d0
	bmi.w	Seg_ApplyObjPos_Store
	cmpi.b	#$23,d0
	bgt.w	Seg_ApplyObjPos_Store
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_1F6D76(pc,d1.w),d1
	jmp	Sw_1F6D76-2(pc,d1.w)
