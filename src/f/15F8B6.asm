; ---------------------------------------------------------------------------
; sub_15F8B6	[jt 2081]
; ---------------------------------------------------------------------------
sub_15F8B6:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$44(a4)
	bne.s	loc_15F8CC
	moveq	#$0,d0
	bra.s	loc_15F94A
loc_15F8CC:
	movea.l	$44(a4),a0
	moveq	#$0,d7
	move.b	(a0),d7
	move.w	#$80,d0
	and.w	d7,d0
	beq.s	loc_15F8F2
	moveq	#$10,d0
	and.w	d7,d0
	beq.s	loc_15F8E8
	move.l	$14(a6),d0
	bra.s	loc_15F8EC
loc_15F8E8:
	move.l	$10(a6),d0
loc_15F8EC:
	add.w	d0,$4A(a4)
	bra.s	loc_15F8FA
loc_15F8F2:
	move.w	$E(a6),d0
	add.w	d0,$4A(a4)
loc_15F8FA:
	movea.l	$44(a4),a0
	move.w	$2(a0),d7
	cmp.w	$4A(a4),d7
	ble.s	loc_15F918
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	move.w	$4A(a4),d1
	ext.l	d1
	cmp.l	d1,d0
	blt.s	loc_15F948
loc_15F918:
	tst.w	$4A(a4)
	ble.s	loc_15F924
	sub.w	d7,$4A(a4)
	bra.s	loc_15F928
loc_15F924:
	add.w	d7,$4A(a4)
loc_15F928:
	move.l	a4,-(a7)
	jsr	Anim_Advance(pc)
	tst.l	$44(a4)
	addq.w	#$4,a7
	bne.s	loc_15F93A
	moveq	#$0,d0
	bra.s	loc_15F94A
loc_15F93A:
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	Anim_ApplyStep(pc)
	addq.w	#$8,a7
	bra.s	loc_15F94A
loc_15F948:
	moveq	#$0,d0
loc_15F94A:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
