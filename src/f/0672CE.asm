; ---------------------------------------------------------------------------
; sub_0672CE	[jt 479]
; ---------------------------------------------------------------------------
sub_0672CE:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	move.w	$E(a6),d7
	movea.l	$8(a6),a4
	movea.l	$8C(a4),a0
	move.b	$3C(a0),d0
	bmi.w	loc_06736C
	cmpi.b	#$6,d0
	bgt.s	loc_06736C
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	$672FE(pc,d1.w),d1
	jmp	$672FC(pc,d1.w)
