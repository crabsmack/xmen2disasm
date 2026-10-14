; ---------------------------------------------------------------------------
; sub_1F7628	[jt 2523]
; ---------------------------------------------------------------------------
sub_1F7628:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$C(a6),a4
	move.w	$16(a4),d6
	move.w	$18(a4),d7
	move.b	$1(a3),d0
	subi.b	#$E,d0
	bmi.w	loc_1F76D6
	cmpi.b	#$F,d0
	bgt.w	loc_1F76D6
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	$1F7662(pc,d1.w),d1
	jmp	$1F7660(pc,d1.w)
