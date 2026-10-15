; ---------------------------------------------------------------------------
; sub_0BBBBE	[jt 1006]
; ---------------------------------------------------------------------------
sub_0BBBBE:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d7
	asr.l	#$8,d7
	move.w	$9E(a4),d0
	cmp.w	$A0(a4),d0
	bne.s	loc_0BBC2E
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	tst.l	$98(a4)
	bne.s	loc_0BBBFC
	move.l	$64(a4),$5C(a4)
	move.w	#$3C,$6C(a4)
	bra.w	loc_0BBCB2
loc_0BBBFC:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0BBC10
	clr.w	$96(a4)
loc_0BBC10:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$3C,$6C(a4)
	bra.w	loc_0BBCB2
loc_0BBC2E:
	clr.w	$18(a4)
	clr.w	$20(a4)
	cmp.w	$9E(a4),d7
	bne.s	loc_0BBC4C
	addi.l	#$100,$8(a4)
	andi.b	#$EF,$2E(a4)
	bra.s	loc_0BBC60
loc_0BBC4C:
	cmp.w	$A0(a4),d7
	bne.s	loc_0BBC60
	subi.l	#$100,$8(a4)
	ori.b	#$10,$2E(a4)
loc_0BBC60:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_0BBC70
	move.l	#$FFFFFDE0,d0
	bra.s	loc_0BBC76
loc_0BBC70:
	move.l	#$220,d0
loc_0BBC76:
	move.w	d0,$16(a4)
	pea.l	($EA).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($EA).w
	jsr	$521A(a5)	; -> Snd_Play
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_0BBC96
	moveq	#-$56,d0
	bra.s	loc_0BBC98
loc_0BBC96:
	moveq	#$56,d0
loc_0BBC98:
	ext.w	d0
	move.w	d0,$1E(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_0BBCBC(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BBCB2:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
