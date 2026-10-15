; ---------------------------------------------------------------------------
; sub_04BC74	[link-after-rts]
; ---------------------------------------------------------------------------
sub_04BC74:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.b	$B1(a4),d0
	cmpi.b	#$3,d0
	bhi.s	loc_04BC9E
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_04BC74(pc,d1.w),d1
	jmp	Sw_04BC74-2(pc,d1.w)
