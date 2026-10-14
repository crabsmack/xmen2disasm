; ---------------------------------------------------------------------------
; sub_113D20	[jt 1407]
; ---------------------------------------------------------------------------
sub_113D20:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a4,-(a7)
	move.b	$17(a6),d6
	move.b	$13(a6),d7
	movea.l	$8(a6),a4
	move.b	d7,d0
	subq.b	#$4,d0
	bmi.s	loc_113D64
	cmpi.b	#$8,d0
	bgt.s	loc_113D64
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	$113D4E(pc,d1.w),d1
	jmp	$113D4C(pc,d1.w)
