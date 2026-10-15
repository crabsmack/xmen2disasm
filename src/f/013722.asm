; ---------------------------------------------------------------------------
; sub_013722	[jt 69]
; ---------------------------------------------------------------------------
sub_013722:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$60(a4)
	bne.s	loc_013738
	move.l	$5C(a4),$60(a4)
loc_013738:
	lea.l	sub_0137C4(pc),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	move.b	$13(a6),d0
	subi.b	#$9,d0
	bmi.s	loc_013788
	cmpi.b	#$3,d0
	bgt.s	loc_013788
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_013722(pc,d1.w),d1
	jmp	Sw_013722-2(pc,d1.w)
