; ---------------------------------------------------------------------------
; sub_06DE90	[link-after-rts]
; ---------------------------------------------------------------------------
sub_06DE90:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	subq.w	#$1,$B4(a4)
	bne.s	loc_06DEC8
	moveq	#$3,d0
	and.b	$2E(a4),d0
	moveq	#$0,d1
	move.b	d0,d1
	moveq	#$2,d0
	eor.b	d0,d1
	move.w	d1,d7
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	ext.w	d0
	move.w	d7,d1
	or.w	d0,d1
	move.b	d1,$2E(a4)
	move.w	#$4,$B4(a4)
loc_06DEC8:
	tst.w	$6E(a4)
	bne.s	loc_06DF38
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
	lea.l	$FE2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	move.w	$AE(a4),$B0(a4)
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_06DF0C
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_06DF38
loc_06DF0C:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_06DF20
	clr.w	$96(a4)
loc_06DF20:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_06DF38:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
