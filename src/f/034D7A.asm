; ---------------------------------------------------------------------------
; sub_034D7A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_034D7A:
	link.w	a6,#$0
	move.l	a4,-(a7)
	move.w	-$3B32(a5),d0
	subq.w	#$1,-$3B32(a5)
	tst.b	-$38DE(a5)
	beq.s	loc_034D96
	move.w	-$3B32(a5),d0
	subq.w	#$1,-$3B32(a5)
loc_034D96:
	tst.w	-$3B32(a5)
	bgt.w	loc_034F7A
	lea.l	$71A(a5),a0
	movea.l	$2(a0),a4
	move.w	#$5,-$3B32(a5)
	move.b	#$1,-$3A06(a5)
	move.b	-$3CB0(a5),d0
	cmp.b	(a4),d0
	bne.s	loc_034DBE
	clr.b	-$3CB0(a5)
loc_034DBE:
	move.b	-$3CB0(a5),d0
	ext.w	d0
	ext.l	d0
	add.l	a4,d0
	movea.l	d0,a0
	tst.b	$1(a0)
	beq.w	loc_034EA0
	move.w	-$3B3A(a5),d0
	bmi.w	loc_034F62
	cmpi.w	#$5,d0
	bgt.w	loc_034F62
	add.w	d0,d0
	move.w	$34DEC(pc,d0.w),d0
	jmp	$34DEA(pc,d0.w)
