; ---------------------------------------------------------------------------
; Seg_MoveAlong - move an object a distance along its chain of floor segments, crossing to neighbours; mark the end of the chain
; In:  8(a6) = object, $C(a6) = word distance (8.8)
; Out: d0
; Evidence: +$72 position along segment +$76; next/prev links seg +$11/+$10 ($FF = end -> +4 |= $100); length seg +6; then $1F6D76 (place on floor)
; ---------------------------------------------------------------------------
Seg_MoveAlong:
	link.w	a6,#$0
	movem.l	d5-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$76(a3),a4
	move.l	a4,d0
	beq.w	loc_15A15E
	move.l	$72(a3),d7
	move.w	$6(a4),d0
	ext.l	d0
	move.l	d0,d6
	lsl.l	#$8,d6
	move.w	$E(a6),d0
	ext.l	d0
	add.l	d0,d7
loc_15A0D8:
	cmp.l	d7,d6
	bge.s	loc_15A114
	moveq	#$0,d5
	move.b	$11(a4),d5
	cmpi.w	#$FF,d5
	beq.s	loc_15A10A
	sub.l	d6,d7
	move.l	d5,d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_Segs(a5),a0
	lea.l	(a0,d0.w),a4
	move.w	$6(a4),d0
	ext.l	d0
	move.l	d0,d6
	lsl.l	#$8,d6
	bra.s	loc_15A0D8
loc_15A10A:
	ori.w	#$100,$4(a3)
	move.l	d6,d7
	bra.s	loc_15A14E
loc_15A114:
	tst.l	d7
	bge.s	loc_15A14E
	moveq	#$0,d5
	move.b	$10(a4),d5
	cmpi.w	#$FF,d5
	beq.s	loc_15A146
	move.l	d5,d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_Segs(a5),a0
	lea.l	(a0,d0.w),a4
	move.w	$6(a4),d0
	ext.l	d0
	move.l	d0,d6
	lsl.l	#$8,d6
	add.l	d6,d7
	bra.s	loc_15A0D8
loc_15A146:
	ori.w	#$100,$4(a3)
	moveq	#$0,d7
loc_15A14E:
	move.l	a4,$76(a3)
	move.l	d7,$72(a3)
	move.l	a3,-(a7)
	jsr	$4EDA(a5)	; -> sub_1F6D76
	addq.w	#$4,a7
loc_15A15E:
	movem.l	-$14(a6),d5-d7/a3-a4
	unlk	a6
	rts
