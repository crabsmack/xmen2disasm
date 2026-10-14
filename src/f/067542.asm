; ---------------------------------------------------------------------------
; sub_067542	[link-after-rts]
; ---------------------------------------------------------------------------
sub_067542:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$8C(a4),a0
	move.b	$3C(a0),d0
	bmi.w	loc_0675F8
	cmpi.b	#$6,d0
	bgt.w	loc_0675F8
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	$6756E(pc,d1.w),d1
	jmp	$6756C(pc,d1.w)
