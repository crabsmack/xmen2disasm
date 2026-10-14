; ---------------------------------------------------------------------------
; sub_106F42	[link-after-rts]
; ---------------------------------------------------------------------------
sub_106F42:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$C(a6),a3
	movea.l	$8(a6),a4
	tst.w	$94(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_106F64
	move.w	$94(a4),d0
	ext.l	d0
	bra.s	loc_106F6C
loc_106F64:
	move.w	$94(a4),d0
	ext.l	d0
	neg.l	d0
loc_106F6C:
	move.w	d0,d7
	movea.l	$76(a4),a0
	move.b	$1(a0),d0
	subi.b	#$21,d0
	bmi.w	loc_107092
	cmpi.b	#$3,d0
	bgt.w	loc_107092
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	$106F94(pc,d1.w),d1
	jmp	$106F92(pc,d1.w)
