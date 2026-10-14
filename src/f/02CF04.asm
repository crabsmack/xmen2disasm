; ---------------------------------------------------------------------------
; sub_02CF04	[link-after-rts]
; ---------------------------------------------------------------------------
sub_02CF04:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.b	$A8(a4),d0
	cmpi.b	#$5,d0
	bhi.w	loc_02D13E
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	$2CF28(pc,d1.w),d1
	jmp	$2CF26(pc,d1.w)
