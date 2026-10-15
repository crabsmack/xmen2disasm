; ---------------------------------------------------------------------------
; Seg_ComputeObjPos - set an object's position along a floor segment (+$72) from its x or y, clamped to the segment
; In:  8(a6) = segment   $C(a6) = object
; Out: none
; Evidence: segment type handler (table -$336A by type byte +1) gets message 5 first; types 1/$24, 2/$23 use y vs +$A/+$E, the horizontal types use x vs +8/+$C (and halve x velocity +$16); result (pos - start) << 8
; ---------------------------------------------------------------------------
Seg_ComputeObjPos:
	link.w	a6,#$0
	movem.l	d3/a3-a4,-(a7)
	movea.l	$C(a6),a3
	movea.l	$8(a6),a4
	move.b	$1(a4),d0
	ext.w	d0
	asl.w	#$2,d0
	lea.l	g_SegTypeHooks(a5),a0
	move.l	(a0,d0.w),-$346E(a5)
	beq.s	loc_1F7032
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	moveq	#$5,d1
	move.l	d1,-(a7)
	movea.l	-$346E(a5),a0
	jsr	(a0)
	tst.w	d0
	lea.l	$10(a7),a7
	bra.s	loc_1F7034
loc_1F7032:
	moveq	#$0,d0
loc_1F7034:
	bne.w	loc_1F71E8
	move.b	$1(a4),d0
	subq.b	#$1,d0
	bmi.w	loc_1F71E8
	cmpi.b	#$23,d0
	bgt.w	loc_1F71E8
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_1F6FF4(pc,d1.w),d1
	jmp	Sw_1F6FF4-2(pc,d1.w)
