; ---------------------------------------------------------------------------
; sub_096F3E	[jt 747]
; ---------------------------------------------------------------------------
sub_096F3E:
	link.w	a6,#$FFFC
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$9C(a4),a3
	move.l	a3,d0
	bne.s	loc_096F94
	tst.l	$98(a4)
	bne.s	loc_096F66
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.w	loc_09700C
loc_096F66:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_096F7A
	clr.w	$96(a4)
loc_096F7A:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_09700C
loc_096F94:
	move.l	a3,-(a7)
	jsr	$4EAA(a5)	; -> sub_1F694A
	move.l	d0,-$4(a6)
	move.l	$8(a3),d0
	asr.l	#$8,d0
	move.w	d0,$10(a3)
	move.l	$C(a3),d0
	asr.l	#$8,d0
	move.w	d0,$12(a3)
	movea.l	-$4(a6),a0
	move.l	$8(a0),d6
	sub.l	$8(a3),d6
	move.w	$A6(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,d7
	sub.l	$C(a3),d7
	clr.w	$1E(a3)
	clr.l	$16(a3)
	clr.w	$20(a3)
	move.l	d6,d0
	asr.l	#$6,d0
	moveq	#$9,d1
	move.l	d6,d2
	asr.l	d1,d2
	sub.w	d2,d0
	move.w	d0,$1E(a3)
	move.l	d7,d0
	asr.l	#$6,d0
	moveq	#$9,d1
	move.l	d7,d2
	asr.l	d1,d2
	sub.w	d2,d0
	move.w	d0,$20(a3)
	addq.w	#$4,a7
	clr.w	$6C(a4)
	lea.l	sub_09708A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_09700C:
	movem.l	-$14(a6),d6-d7/a3-a4
	unlk	a6
	rts
