; ---------------------------------------------------------------------------
; sub_1F7AF8	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F7AF8:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.b	$1(a4),d0
	subi.b	#$13,d0
	bmi.s	loc_1F7B3C
	cmpi.b	#$9,d0
	bgt.s	loc_1F7B3C
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_1F7AF8(pc,d1.w),d1
	jmp	Sw_1F7AF8-2(pc,d1.w)
