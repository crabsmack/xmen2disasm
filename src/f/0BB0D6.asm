; ---------------------------------------------------------------------------
; sub_0BB0D6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BB0D6:
	link.w	a6,#$FFFC
	movem.l	d3/d5-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$1E72(a5),a0
	movea.l	$2(a0),a3
	move.l	g_FrameCounter(a5),d0
	lsr.l	#$1,d0
	moveq	#$1F,d1
	and.l	d0,d1
	move.w	$AE(a4),d0
	ext.l	d0
	subq.l	#$1,d0
	move.w	d0,d7
	add.w	d1,d7
	cmpi.w	#$20,d7
	blt.s	loc_0BB10A
	subi.w	#$20,d7
loc_0BB10A:
	ext.l	d7
	move.l	d7,d0
	asl.l	#$2,d0
	adda.l	d0,a3
	move.w	$AE(a4),d0
	ext.l	d0
	subq.l	#$1,d0
	asl.l	#$3,d0
	add.l	$B0(a4),d0
	move.l	d0,-$4(a6)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_0BB15A
	movea.l	-$4(a6),a0
	move.w	(a0),d0
	ext.l	d0
	move.w	(a3),d1
	ext.l	d1
	add.l	d0,d1
	move.w	d1,d6
	add.w	#$13,d6
	move.w	$2(a0),d0
	ext.l	d0
	moveq	#-$7,d1
	add.l	d1,d0
	move.w	$2(a3),d2
	ext.l	d2
	add.l	d0,d2
	move.w	d2,d7
	add.w	#$10,d7
	bra.s	loc_0BB18E
loc_0BB15A:
	moveq	#$20,d5
	movea.l	-$4(a6),a0
	move.w	(a0),d0
	ext.l	d0
	ext.l	d5
	add.l	d5,d0
	move.w	(a3),d1
	ext.l	d1
	add.l	d0,d1
	moveq	#$13,d0
	add.l	d0,d1
	neg.l	d1
	move.w	d1,d6
	move.w	$2(a0),d1
	ext.l	d1
	moveq	#-$7,d2
	add.l	d2,d1
	move.w	$2(a3),d3
	ext.l	d3
	add.l	d1,d3
	move.w	d3,d7
	add.w	#$10,d7
loc_0BB18E:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_0BB19E
	moveq	#$0,d0
	bra.s	loc_0BB1A0
loc_0BB19E:
	moveq	#$0,d0
loc_0BB1A0:
	ext.w	d0
	add.w	d0,d6
	moveq	#$8,d0
	and.b	$2E(a4),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_0BB1B4
	moveq	#-$49,d0
	bra.s	loc_0BB1B6
loc_0BB1B4:
	moveq	#$49,d0
loc_0BB1B6:
	ext.w	d0
	add.w	d0,d7
	moveq	#$0,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,d1
	lsl.l	#$8,d1
	add.l	$C(a4),d1
	move.l	d1,-(a7)
	ext.l	d6
	move.l	d6,d1
	lsl.l	#$8,d1
	add.l	$8(a4),d1
	move.l	d1,-(a7)
	lea.l	$361A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$361A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$14(a7),a7
	beq.s	loc_0BB21C
	moveq	#$10,d0
	and.b	$2E(a4),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_0BB208
	moveq	#$0,d0
	bra.s	loc_0BB20E
loc_0BB208:
	move.l	#$B4,d0
loc_0BB20E:
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	jsr	$35FA(a5)	; -> sub_1339A6
	lea.l	$C(a7),a7
loc_0BB21C:
	tst.l	$98(a4)
	bne.s	loc_0BB230
	move.l	$64(a4),$5C(a4)
	move.w	#$A,$6C(a4)
	bra.s	loc_0BB25E
loc_0BB230:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0BB244
	clr.w	$96(a4)
loc_0BB244:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$A,$6C(a4)
loc_0BB25E:
	movem.l	-$1C(a6),d3/d5-d7/a3-a4
	unlk	a6
	rts
