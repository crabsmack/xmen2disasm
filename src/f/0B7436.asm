; ---------------------------------------------------------------------------
; sub_0B7436	[jt 934]
; ---------------------------------------------------------------------------
sub_0B7436:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	sub_0B74CC(pc),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	move.b	$13(a6),d0
	subi.b	#$9,d0
	bmi.s	loc_0B7490
	cmpi.b	#$3,d0
	bgt.s	loc_0B7490
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_0B7436(pc,d1.w),d1
	jmp	Sw_0B7436-2(pc,d1.w)
