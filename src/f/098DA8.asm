; ---------------------------------------------------------------------------
; sub_098DA8	[jt 791]
; ---------------------------------------------------------------------------
sub_098DA8:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	movea.l	d0,a3
	move.w	$6(a4),d7
	bne.s	loc_098DD0
	tst.l	$C(a6)
	beq.s	loc_098DD0
	move.l	$C(a6),-(a7)
	jsr	sub_098CC8(pc)
	move.w	d0,d7
	addq.w	#$4,a7
loc_098DD0:
	move.w	d7,d0
	subq.w	#$1,d0
	bmi.w	loc_098F86
	cmpi.w	#$6,d0
	bgt.w	loc_098F86
	add.w	d0,d0
	move.w	$98DEA(pc,d0.w),d0
	jmp	$98DE8(pc,d0.w)
