; ---------------------------------------------------------------------------
; sub_1594C0	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1594C0:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	move.b	$B(a6),d7
	movea.l	$10(a6),a3
	movea.l	$C(a6),a4
	move.b	d7,d0
	subq.b	#$1,d0
	bmi.w	loc_1595E4
	cmpi.b	#$7,d0
	bgt.w	loc_1595E4
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_1594C0(pc,d1.w),d1
	jmp	Sw_1594C0-2(pc,d1.w)
