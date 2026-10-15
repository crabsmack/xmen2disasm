; ---------------------------------------------------------------------------
; sub_1CF36E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1CF36E:
	link.w	a6,#$0
	movem.l	d3-d7/a3-a4,-(a7)
	move.w	$16(a6),d4
	move.w	$12(a6),d5
	movea.l	$C(a6),a3
	movea.l	$8(a6),a4
	clr.w	d7
	clr.w	d6
	move.b	$E(a3),d0
	bmi.s	loc_1CF3E2
	cmpi.b	#$4,d0
	bgt.s	loc_1CF3E2
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_1CF36E(pc,d1.w),d1
	jmp	Sw_1CF36E-2(pc,d1.w)
