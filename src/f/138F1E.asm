; ---------------------------------------------------------------------------
; sub_138F1E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_138F1E:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> sub_1F694A
	movea.l	d0,a3
	move.w	$9C(a4),d7
	tst.w	$6E(a4)
	addq.w	#$4,a7
	bgt.s	loc_138F62
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	sub_138DA8(pc)
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_138F62
	clr.w	$6C(a4)
	lea.l	sub_138EDC(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1390B0
loc_138F62:
	move.w	#$100,d0
	and.w	$4(a4),d0
	beq.s	loc_138F8E
	tst.w	$6E(a4)
	bgt.s	loc_138F8E
	andi.w	#$FEFF,$4(a4)
	clr.w	$6C(a4)
	lea.l	sub_138EDC(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1390B0
loc_138F8E:
	movea.l	$76(a4),a0
	move.b	$1(a0),d0
	subi.b	#$21,d0
	bmi.w	loc_1390B0
	cmpi.b	#$3,d0
	bgt.w	loc_1390B0
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	$138FB4(pc,d1.w),d1
	jmp	$138FB2(pc,d1.w)
