; ---------------------------------------------------------------------------
; sub_02DFD8	[link-after-rts]
; ---------------------------------------------------------------------------
sub_02DFD8:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$6F2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	andi.w	#$BFFF,$6(a4)
	move.b	$98(a4),d0
	subq.b	#$1,d0
	addq.w	#$8,a7
	bcs.w	loc_02E0B0
	cmpi.b	#$6,d0
	bhi.w	loc_02E0B0
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_02DFD8(pc,d1.w),d1
	jmp	Sw_02DFD8-2(pc,d1.w)
