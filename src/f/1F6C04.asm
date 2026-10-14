; ---------------------------------------------------------------------------
; sub_1F6C04	[jt 2518]
; ---------------------------------------------------------------------------
sub_1F6C04:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a3-a4,-(a7)
	move.b	$F(a6),d7
	lea.l	-$33D2(a5),a0
	move.w	-$3470(a5),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	movea.l	d0,a3
	adda.l	a0,a3
	move.w	-$3470(a5),d5
	move.w	d5,d6
	movea.l	$8(a6),a4
	bra.w	loc_1F6D30
loc_1F6C34:
	move.w	$8(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$6(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$4(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$2(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$1(a4),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$3F,d0
	and.b	(a4),d0
	moveq	#$0,d1
	move.b	d0,d1
	move.l	d1,-(a7)
	move.l	a3,-(a7)
	jsr	sub_1F7BB6(pc)
	moveq	#$40,d0
	and.b	(a4),d0
	lea.l	$1C(a7),a7
	beq.s	loc_1F6C92
	move.b	#$FF,$10(a3)
	move.b	#$FF,$11(a3)
	lea.l	$C(a4),a4
	move.l	a4,d0
	subq.l	#$2,d0
	movea.l	d0,a4
	bra.w	loc_1F6D20
loc_1F6C92:
	tst.b	d7
	bne.s	loc_1F6CD8
	moveq	#$0,d0
	move.b	$A(a4),d0
	cmpi.w	#$FF,d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F6CAA
	moveq	#-$1,d0
	bra.s	loc_1F6CB2
loc_1F6CAA:
	moveq	#$0,d0
	move.b	$A(a4),d0
	tst.l	d0
loc_1F6CB2:
	move.b	d0,$10(a3)
	moveq	#$0,d0
	move.b	$B(a4),d0
	cmpi.w	#$FF,d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F6CCA
	moveq	#-$1,d0
	bra.s	loc_1F6CD2
loc_1F6CCA:
	moveq	#$0,d0
	move.b	$B(a4),d0
	tst.l	d0
loc_1F6CD2:
	move.b	d0,$11(a3)
	bra.s	loc_1F6D1C
loc_1F6CD8:
	moveq	#$0,d0
	move.b	$A(a4),d0
	cmpi.w	#$FF,d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F6CEC
	moveq	#-$1,d0
	bra.s	loc_1F6CF6
loc_1F6CEC:
	moveq	#$0,d0
	move.b	$A(a4),d0
	ext.l	d6
	add.l	d6,d0
loc_1F6CF6:
	move.b	d0,$10(a3)
	moveq	#$0,d0
	move.b	$B(a4),d0
	cmpi.w	#$FF,d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F6D0E
	moveq	#-$1,d0
	bra.s	loc_1F6D18
loc_1F6D0E:
	moveq	#$0,d0
	move.b	$B(a4),d0
	ext.l	d6
	add.l	d6,d0
loc_1F6D18:
	move.b	d0,$11(a3)
loc_1F6D1C:
	lea.l	$C(a4),a4
loc_1F6D20:
	tst.b	d7
	beq.s	loc_1F6D28
	ori.b	#$4,(a3)
loc_1F6D28:
	lea.l	$14(a3),a3
	move.w	d5,d0
	addq.w	#$1,d5
loc_1F6D30:
	tst.b	(a4)
	bne.w	loc_1F6C34
	tst.b	d7
	bne.s	loc_1F6D3E
	move.w	d5,-$3472(a5)
loc_1F6D3E:
	move.w	d5,-$3470(a5)
	move.w	d5,d0
	subq.w	#$1,d0
	move.w	d0,-$3474(a5)
	movea.l	-$348C(a5),a3
	pea.l	$1F6D74(pc)
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> sub_1FA8DC
	jsr	sub_1F84BE(pc)
	move.l	-$348C(a5),(a3)
	move.l	-$348C(a5),-$33D6(a5)
	addq.w	#$8,a7
	movem.l	-$18(a6),d3/d5-d7/a3-a4
	unlk	a6
	rts
