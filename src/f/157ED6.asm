; ---------------------------------------------------------------------------
; sub_157ED6	[jt 1978]
; ---------------------------------------------------------------------------
sub_157ED6:
	link.w	a6,#$0
	movem.l	d3-d7/a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$16(a4)
	sgt.b	d3
	neg.b	d3
	beq.s	loc_157EF0
	moveq	#-$A,d0
	bra.s	loc_157F00
loc_157EF0:
	tst.w	$16(a4)
	slt.b	d3
	neg.b	d3
	beq.s	loc_157EFE
	moveq	#$A,d0
	bra.s	loc_157F00
loc_157EFE:
	moveq	#$0,d0
loc_157F00:
	move.w	d0,d7
	tst.w	$18(a4)
	sgt.b	d3
	neg.b	d3
	beq.s	loc_157F10
	moveq	#-$A,d0
	bra.s	loc_157F20
loc_157F10:
	tst.w	$18(a4)
	slt.b	d3
	neg.b	d3
	beq.s	loc_157F1E
	moveq	#$A,d0
	bra.s	loc_157F20
loc_157F1E:
	moveq	#$0,d0
loc_157F20:
	move.w	d0,d5
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$42(a0),a1
	jsr	(a1)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_157F42
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1580A8
loc_157F42:
	tst.b	-$38DE(a5)
	beq.s	loc_157F4C
	moveq	#$2,d6
	bra.s	loc_157F4E
loc_157F4C:
	moveq	#$1,d6
loc_157F4E:
	ext.l	d6
	move.l	d6,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$4E(a0),a1
	jsr	(a1)
	tst.b	$A2(a4)
	addq.w	#$8,a7
	beq.s	loc_157F6A
	ori.b	#$10,$2E(a4)
loc_157F6A:
	move.l	$9E(a4),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	move.l	a4,-(a7)
	jsr	$412A(a5)	; -> sub_15F8B6
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$8,d0
	move.l	d0,d6
	add.l	$8(a4),d6
	ext.l	d5
	move.l	d5,d0
	lsl.l	#$8,d0
	move.l	d0,d7
	add.l	$C(a4),d7
	move.l	d6,d5
	asr.l	#$8,d5
	move.l	d7,d4
	asr.l	#$8,d4
	moveq	#$10,d0
	and.w	$6(a4),d0
	beq.s	loc_157FCE
	move.l	a4,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	sub_157CB2(pc)
	move.l	-$1652(a5),-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	jsr	$4FFA(a5)	; -> sub_1FA0AE
	tst.b	d0
	lea.l	$18(a7),a7
	bra.s	loc_157FEE
loc_157FCE:
	move.l	a4,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	sub_157CB2(pc)
	move.l	-$165A(a5),-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	jsr	$4FFA(a5)	; -> sub_1FA0AE
	tst.b	d0
	lea.l	$18(a7),a7
loc_157FEE:
	lea.l	$18(a7),a7
	beq.s	loc_15801E
	moveq	#$4,d0
	or.b	$2E(a4),d0
	beq.s	loc_158000
	moveq	#$1,d0
	bra.s	loc_158002
loc_158000:
	moveq	#$0,d0
loc_158002:
	move.l	d0,-(a7)
	move.l	d7,-(a7)
	move.l	d6,-(a7)
	jsr	$2DCA(a5)	; -> sub_118136
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	lea.l	$10(a7),a7
	bra.w	loc_1580A8
loc_15801E:
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	($7800).w
	tst.b	-$35CA(a5)
	seq.b	d3
	neg.b	d3
	ext.w	d3
	ext.l	d3
	move.l	d3,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	move.l	a4,-(a7)
	jsr	$3FC2(a5)	; -> sub_15CECC
	tst.b	d0
	lea.l	$18(a7),a7
	beq.s	loc_1580A8
	move.w	$16(a4),d4
	asr.w	#$2,d4
	move.w	$18(a4),d5
	asr.w	#$2,d5
loc_158056:
	ext.l	d4
	sub.l	d4,d6
	ext.l	d5
	sub.l	d5,d7
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	($7800).w
	tst.b	-$35CA(a5)
	seq.b	d3
	neg.b	d3
	ext.w	d3
	ext.l	d3
	move.l	d3,-(a7)
	move.l	d7,d1
	asr.l	#$8,d1
	move.l	d1,-(a7)
	move.l	d6,d1
	asr.l	#$8,d1
	move.l	d1,-(a7)
	move.l	d0,-(a7)
	jsr	$3FC2(a5)	; -> sub_15CECC
	tst.b	d0
	lea.l	$18(a7),a7
	bne.s	loc_158056
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	d7,-(a7)
	move.l	d6,-(a7)
	jsr	$2DCA(a5)	; -> sub_118136
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	lea.l	$10(a7),a7
loc_1580A8:
	movem.l	-$18(a6),d3-d7/a4
	unlk	a6
	rts
