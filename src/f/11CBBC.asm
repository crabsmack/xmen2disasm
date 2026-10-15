; ---------------------------------------------------------------------------
; sub_11CBBC	[jt 1582]
; ---------------------------------------------------------------------------
sub_11CBBC:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$9C(a4),d7
	asr.l	#$8,d7
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	move.l	$9C(a4),d0
	sub.l	$8(a3),d0
	move.l	d0,d7
	asr.l	#$8,d7
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_11CBF0
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_11CBF6
loc_11CBF0:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_11CBF6:
	move.w	d0,d7
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	moveq	#$0,d0
	move.l	d0,$44(a4)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	cmpi.w	#$C0,d7
	lea.l	$C(a7),a7
	bge.s	loc_11CC62
	tst.l	$98(a4)
	bne.s	loc_11CC34
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_11CC74
loc_11CC34:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_11CC48
	clr.w	$96(a4)
loc_11CC48:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_11CC74
loc_11CC62:
	clr.w	$6C(a4)
	lea.l	sub_11CBBC(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_11CC74:
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
