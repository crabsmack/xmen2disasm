; ---------------------------------------------------------------------------
; Seg_ComputeLength - normalise a floor segment's endpoints left to right and compute its length (+6)
; In:  8(a6) = segment
; Out: none
; Evidence: type hook message 4 first; swaps endpoints when x1 > x2 unless byte -$38C4 is set; flat types $13-$1C: length = |dx|, else max(|dx|, |dy|)
; ---------------------------------------------------------------------------
Seg_ComputeLength:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.b	$1(a4),d0
	ext.w	d0
	asl.w	#$2,d0
	lea.l	g_SegTypeHooks(a5),a0
	move.l	(a0,d0.w),g_SegHookTmp(a5)
	beq.s	loc_1F79DC
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	moveq	#$4,d1
	move.l	d1,-(a7)
	movea.l	g_SegHookTmp(a5),a0
	jsr	(a0)
	tst.w	d0
	lea.l	$10(a7),a7
	bra.s	loc_1F79DE
loc_1F79DC:
	moveq	#$0,d0
loc_1F79DE:
	bne.w	loc_1F7A94
	move.w	$8(a4),d0
	cmp.w	$C(a4),d0
	ble.s	loc_1F7A0E
	tst.b	g_SegFlag38C4(a5)
	bne.s	loc_1F7A0E
	move.w	$8(a4),d7
	move.w	$C(a4),$8(a4)
	move.w	d7,$C(a4)
	move.w	$A(a4),d7
	move.w	$E(a4),$A(a4)
	move.w	d7,$E(a4)
loc_1F7A0E:
	move.w	$8(a4),d7
	sub.w	$C(a4),d7
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_1F7A24
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_1F7A2A
loc_1F7A24:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_1F7A2A:
	move.w	d0,d7
	move.w	$A(a4),d6
	sub.w	$E(a4),d6
	tst.w	d6
	sge.b	d3
	neg.b	d3
	beq.s	loc_1F7A42
	ext.l	d6
	move.l	d6,d0
	bra.s	loc_1F7A48
loc_1F7A42:
	ext.l	d6
	move.l	d6,d0
	neg.l	d0
loc_1F7A48:
	move.w	d0,d6
	move.b	$1(a4),d0
	subi.b	#$13,d0
	bmi.s	Seg_ComputeLength_Max
	cmpi.b	#$9,d0
	bgt.s	Seg_ComputeLength_Max
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_1F79A2(pc,d1.w),d1
	jmp	Sw_1F79A2-2(pc,d1.w)
