; ---------------------------------------------------------------------------
; Seg_ObjPosUnclamped - set an object's position along a segment (+$72) from its x or y, without clamping
; In:  8(a6) = segment  $C(a6) = object
; Out: none
; Evidence: type hook message 5 first; types 1/$24: (y - y1) << 8; 2/$23: (y2 - y) << 8; 3/$E/$F/$13-$1C/$21: (x - x1) << 8; 4/$22: (x2 - x) << 8; unlike Seg_ComputeObjPos no clamp and no velocity change
; ---------------------------------------------------------------------------
Seg_ObjPosUnclamped:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$C(a6),a4
	move.b	$1(a3),d0
	ext.w	d0
	asl.w	#$2,d0
	lea.l	g_SegTypeHooks(a5),a0
	move.l	(a0,d0.w),g_SegHookTmp(a5)
	beq.s	loc_1F7230
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	moveq	#$5,d1
	move.l	d1,-(a7)
	movea.l	g_SegHookTmp(a5),a0
	jsr	(a0)
	tst.w	d0
	lea.l	$10(a7),a7
	bra.s	loc_1F7232
loc_1F7230:
	moveq	#$0,d0
loc_1F7232:
	bne.w	Seg_ObjPosUnclamped_Done
	move.b	$1(a3),d0
	subq.b	#$1,d0
	bmi.w	Seg_ObjPosUnclamped_Done
	cmpi.b	#$23,d0
	bgt.w	Seg_ObjPosUnclamped_Done
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_1F71F2(pc,d1.w),d1
	jmp	Sw_1F71F2-2(pc,d1.w)
