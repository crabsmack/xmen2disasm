; ---------------------------------------------------------------------------
; Scroll_SetParallax - install a parallax (line/column scroll) descriptor and set VDP reg 11 scroll mode for it
; In:  8(a6) = pointer: descriptor (byte type, '2' = column vscroll; byte count; 8-byte band records)
; Out: none
; Evidence: reg 11 shadow g_VdpReg11(a5) + 4 (2-cell vscroll) for type '2', else + 3 (line hscroll); stores the pointer in g_ParallaxDesc(a5); per-band longs at -$846(a5), case 1 bands computed via Math_MulFix8/Math_LDivS; clears the 448 words at g_HScrollBuf(a5)
; ---------------------------------------------------------------------------
Scroll_SetParallax:
	link.w	a6,#$FFF6
	movem.l	d3-d7/a3-a4,-(a7)
	lea.l	-$846(a5),a3
	movea.l	$8(a6),a0
	moveq	#$32,d0
	cmp.b	(a0),d0
	beq.s	loc_1FDB1C
	move.w	#$7BE,-$1D42(a5)
	move.w	#$42,-$1D44(a5)
	move.w	g_VdpReg11(a5),d0
	addq.w	#$3,d0
	move.w	d0,($C00004).l
	bra.s	loc_1FDB28
loc_1FDB1C:
	move.w	g_VdpReg11(a5),d0
	addq.w	#$4,d0
	move.w	d0,($C00004).l
loc_1FDB28:
	movea.l	$8(a6),a0
	move.l	a0,g_ParallaxDesc(a5)
	move.b	$1(a0),d0
	ext.w	d0
	move.w	d0,-$2(a6)
	movea.l	$8(a6),a4
	addq.w	#$2,a4
	clr.w	d7
	bra.w	loc_1FDBEC
loc_1FDB46:
	move.b	(a4),d0
	bmi.w	loc_1FDBDC
	cmpi.b	#$3,d0
	bgt.w	loc_1FDBDC
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_1FDAEC(pc,d1.w),d1
	jmp	Sw_1FDAEC-2(pc,d1.w)
