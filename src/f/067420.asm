; ---------------------------------------------------------------------------
; sub_067420	[link-after-rts]
; ---------------------------------------------------------------------------
sub_067420:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$8C(a3),a0
	move.b	$3C(a0),d0
	bmi.w	loc_06750E
	cmpi.b	#$6,d0
	bgt.w	loc_06750E
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	$6744E(pc,d1.w),d1
	jmp	$6744C(pc,d1.w)
