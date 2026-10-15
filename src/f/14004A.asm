; ---------------------------------------------------------------------------
; sub_14004A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_14004A:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$8,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E62(a5)	; -> Seg_WouldLeaveEnd
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_140090
	move.w	$10(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	move.w	$12(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	clr.w	$6C(a4)
	lea.l	Spark_StateStart(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1400A2
loc_140090:
	clr.w	$6C(a4)
	lea.l	sub_14004A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1400A2:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
