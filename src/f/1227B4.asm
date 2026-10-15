; ---------------------------------------------------------------------------
; sub_1227B4	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1227B4:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$B2(a4),d0
	ext.l	d0
	lsl.l	#$1,d0
	move.l	d0,-(a7)
	jsr	$517A(a5)	; -> Math_SinDeg
	move.l	d0,d6
	asr.l	#$1,d6
	move.w	$B2(a4),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.w	$B2(a4),d1
	asr.w	#$1,d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,d7
	lsl.l	#$8,d7
	tst.b	$B6(a4)
	addq.w	#$4,a7
	beq.s	loc_1227F6
	move.l	d7,d0
	neg.l	d0
	move.l	d0,d7
loc_1227F6:
	move.l	d7,d0
	add.l	$A4(a4),d0
	move.l	d0,$8(a4)
	move.l	d6,d0
	add.l	$A8(a4),d0
	move.l	d0,$C(a4)
	move.l	a4,-(a7)
	jsr	sub_121DB6(pc)
	addq.w	#$2,$B2(a4)
	moveq	#$5A,d0
	cmp.w	$B2(a4),d0
	addq.w	#$4,a7
	bge.s	loc_12285E
	tst.l	$98(a4)
	bne.s	loc_122830
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_122870
loc_122830:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_122844
	clr.w	$96(a4)
loc_122844:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_122870
loc_12285E:
	clr.w	$6C(a4)
	lea.l	sub_1227B4(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_122870:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
