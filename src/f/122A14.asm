; ---------------------------------------------------------------------------
; sub_122A14	[jt 1701]
; ---------------------------------------------------------------------------
sub_122A14:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	move.l	a4,-(a7)
	jsr	sub_121DB6(pc)
	tst.w	-$359A(a5)
	addq.w	#$8,a7
	beq.s	loc_122A78
	tst.l	$98(a4)
	bne.s	loc_122A4A
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.w	loc_122AF0
loc_122A4A:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_122A5E
	clr.w	$96(a4)
loc_122A5E:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_122AF0
loc_122A78:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.w	$52(a3),d0
	ext.l	d0
	move.w	$4E(a3),d1
	ext.l	d1
	add.l	d0,d1
	lsl.l	#$7,d1
	move.l	d1,$A4(a4)
	move.w	$4C(a3),d0
	ext.l	d0
	move.w	$50(a3),d1
	ext.l	d1
	add.l	d0,d1
	lsl.l	#$7,d1
	move.l	d1,$A8(a4)
	move.l	$A4(a4),d6
	sub.l	$8(a4),d6
	move.l	$A8(a4),d7
	sub.l	$C(a4),d7
	move.l	d6,d0
	asr.l	#$4,d0
	move.l	d6,d1
	asr.l	#$6,d1
	sub.w	d1,d0
	move.w	d0,$16(a4)
	move.l	d7,d0
	asr.l	#$4,d0
	move.l	d7,d1
	asr.l	#$6,d1
	sub.w	d1,d0
	move.w	d0,$18(a4)
	move.w	#$12,$6E(a4)
	clr.w	$6C(a4)
	lea.l	sub_1229AC(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_122AF0:
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
