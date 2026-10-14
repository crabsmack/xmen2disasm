; ---------------------------------------------------------------------------
; sub_143082	[jt 1938]
; ---------------------------------------------------------------------------
sub_143082:
	link.w	a6,#$FFFC
	movem.l	d4-d7/a3-a4,-(a7)
	move.w	$E(a6),d4
	movea.l	$8(a6),a3
	move.l	a3,-(a7)
	jsr	sub_14225C(pc)
	movea.l	d0,a4
	move.l	a4,d0
	addq.w	#$4,a7
	beq.w	loc_14321A
	move.b	#$40,$E(a4)
	or.b	d4,$E(a4)
	move.l	$94(a3),-(a7)
	move.l	a3,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	move.w	d4,d0
	subq.w	#$1,d0
	addq.w	#$8,a7
	bmi.w	loc_1431D0
	cmpi.w	#$8,d0
	bgt.w	loc_1431D0
	add.w	d0,d0
	move.w	$1430D2(pc,d0.w),d0
	jmp	$1430D0(pc,d0.w)
