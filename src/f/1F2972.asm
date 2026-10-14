; ---------------------------------------------------------------------------
; sub_1F2972	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F2972:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_1F29A6
	ori.l	#$4,$90(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1F2AE0
loc_1F29A6:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$96(a0),a1
	jsr	(a1)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_1F29CC
	movea.l	(a4),a0
	move.l	$AA(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$AA(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1F2AE0
loc_1F29CC:
	tst.l	$44(a4)
	beq.s	loc_1F2A0E
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F29E6
	move.w	-$3BA6(a5),d0
	and.w	-$3A2E(a5),d0
	bra.s	loc_1F29EE
loc_1F29E6:
	move.w	-$3BA6(a5),d0
	and.w	-$3A30(a5),d0
loc_1F29EE:
	bne.s	loc_1F2A0E
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F2A04
	move.w	-$3BA8(a5),d0
	and.w	-$3A2E(a5),d0
	bra.s	loc_1F2A0C
loc_1F2A04:
	move.w	-$3BA8(a5),d0
	and.w	-$3A30(a5),d0
loc_1F2A0C:
	beq.s	loc_1F2A3A
loc_1F2A0E:
	ori.l	#$4,$90(a4)
	movea.l	$8C(a4),a0
	move.w	$12(a0),$22(a4)
	clr.w	$1E(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1F2AE0
loc_1F2A3A:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F2A4E
	move.w	-$3B9C(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1F2A56
loc_1F2A4E:
	move.w	-$3B9C(a5),d0
	and.w	-$3A38(a5),d0
loc_1F2A56:
	beq.s	loc_1F2A98
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F2A6C
	move.w	-$3B9A(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1F2A74
loc_1F2A6C:
	move.w	-$3B9A(a5),d0
	and.w	-$3A38(a5),d0
loc_1F2A74:
	ext.l	d0
	move.l	d0,-(a7)
	movea.l	$8C(a4),a0
	move.w	$56(a0),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$54(a0),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	sub_1F1372(pc)
	lea.l	$10(a7),a7
	bra.s	loc_1F2AE0
loc_1F2A98:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F2AAC
	move.w	-$3B9C(a5),d0
	and.w	-$3A2A(a5),d0
	bra.s	loc_1F2AB4
loc_1F2AAC:
	move.w	-$3B9C(a5),d0
	and.w	-$3A2C(a5),d0
loc_1F2AB4:
	beq.s	loc_1F2AE0
	clr.w	$1E(a4)
	tst.w	$16(a4)
	slt.b	d3
	neg.b	d3
	beq.s	loc_1F2AD2
	movea.l	$8C(a4),a0
	move.w	$16(a0),d0
	ext.l	d0
	neg.l	d0
	bra.s	loc_1F2ADC
loc_1F2AD2:
	movea.l	$8C(a4),a0
	move.w	$16(a0),d0
	ext.l	d0
loc_1F2ADC:
	move.w	d0,$16(a4)
loc_1F2AE0:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
