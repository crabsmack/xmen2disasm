; ---------------------------------------------------------------------------
; BioBalls_Move - move the balls, not the object: run the motion function +$A2 (BioBalls_Motion*) first; unless it returns nonzero, ease each ball toward its slot in the formation table +$9A (anchor = position + +$9E/+$A0, mirrored by +$98 bits 1/2) by at most 5 px per axis per step, clearing +$9A once all have arrived (BIOBALLS override of slot 18 Move)
; In:  8(a6) = this  $C(a6) = word frame step (1, or 2 when the game runs at half rate)
; Out: none
; Evidence: formation entries 8 bytes, restart at a value > 999; method 18 of class descriptor $1203AC (name string "BIOBALLS", parent ACTOR)
; ---------------------------------------------------------------------------
BioBalls_Move:
	link.w	a6,#$FFF6
	movem.l	d3-d7/a3-a4,-(a7)
	move.b	#$1,-$2(a6)
	movea.l	$8(a6),a0
	tst.l	$92(a0)
	beq.w	loc_11EE9E
	tst.l	$A2(a0)
	beq.s	loc_11ED3E
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a0,-(a7)
	movea.l	$A2(a0),a1
	jsr	(a1)
	move.b	d0,-$1(a6)
	addq.w	#$8,a7
	bne.w	loc_11EE9E
loc_11ED3E:
	movea.l	$8(a6),a0
	tst.l	$9A(a0)
	beq.w	loc_11EE9E
	movea.l	$92(a0),a0
	move.w	(a0),-$A(a6)
	movea.l	$8(a6),a0
	moveq	#$8,d0
	and.w	$98(a0),d0
	beq.s	loc_11ED64
	clr.l	-$8(a6)
	bra.s	loc_11ED88
loc_11ED64:
	movea.l	$8(a6),a0
	move.l	$8(a0),d0
	asr.l	#$8,d0
	move.w	$9E(a0),d1
	add.w	d0,d1
	move.w	d1,-$8(a6)
	move.l	$C(a0),d0
	asr.l	#$8,d0
	move.w	$A0(a0),d1
	add.w	d0,d1
	move.w	d1,-$6(a6)
loc_11ED88:
	movea.l	$8(a6),a0
	movea.l	$92(a0),a3
	addq.w	#$2,a3
	movea.l	$9A(a0),a4
	clr.w	d7
	bra.w	loc_11EE6E
loc_11ED9C:
	tst.w	(a3)
	bge.s	loc_11EDA8
	tst.w	$2(a3)
	blt.w	loc_11EE7E
loc_11EDA8:
	cmpi.w	#$3E8,(a4)
	blt.s	loc_11EDB6
	movea.l	$8(a6),a0
	movea.l	$9A(a0),a4
loc_11EDB6:
	movea.l	$8(a6),a0
	moveq	#$2,d0
	and.w	$98(a0),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_11EDCC
	move.w	(a4),d0
	ext.l	d0
	bra.s	loc_11EDD2
loc_11EDCC:
	move.w	(a4),d0
	ext.l	d0
	neg.l	d0
loc_11EDD2:
	add.w	-$8(a6),d0
	move.w	d0,-$4(a6)
	movea.l	$8(a6),a0
	moveq	#$4,d0
	and.w	$98(a0),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_11EDF2
	move.w	$2(a4),d0
	ext.l	d0
	bra.s	loc_11EDFA
loc_11EDF2:
	move.w	$2(a4),d0
	ext.l	d0
	neg.l	d0
loc_11EDFA:
	move.w	d0,d4
	add.w	-$6(a6),d4
	move.w	-$4(a6),d5
	sub.w	(a3),d5
	move.w	d4,d6
	sub.w	$2(a3),d6
	tst.w	d5
	bne.s	loc_11EE14
	tst.w	d6
	beq.s	loc_11EE66
loc_11EE14:
	cmpi.w	#$FFFB,d5
	slt.b	d3
	neg.b	d3
	beq.s	loc_11EE22
	moveq	#-$5,d0
	bra.s	loc_11EE24
loc_11EE22:
	move.w	d5,d0
loc_11EE24:
	move.w	d0,d5
	cmpi.w	#$5,d5
	slt.b	d3
	neg.b	d3
	beq.s	loc_11EE34
	move.w	d5,d0
	bra.s	loc_11EE36
loc_11EE34:
	moveq	#$5,d0
loc_11EE36:
	move.w	d0,d5
	cmpi.w	#$FFFB,d6
	slt.b	d3
	neg.b	d3
	beq.s	loc_11EE46
	moveq	#-$5,d0
	bra.s	loc_11EE48
loc_11EE46:
	move.w	d6,d0
loc_11EE48:
	move.w	d0,d6
	cmpi.w	#$5,d6
	slt.b	d3
	neg.b	d3
	beq.s	loc_11EE58
	move.w	d6,d0
	bra.s	loc_11EE5A
loc_11EE58:
	moveq	#$5,d0
loc_11EE5A:
	move.w	d0,d6
	add.w	d5,(a3)
	add.w	d6,$2(a3)
	clr.b	-$2(a6)
loc_11EE66:
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$6,a3
	addq.w	#$8,a4
loc_11EE6E:
	moveq	#$0,d0
	move.w	d7,d0
	move.w	-$A(a6),d1
	ext.l	d1
	cmp.l	d0,d1
	bgt.w	loc_11ED9C
loc_11EE7E:
	move.w	$E(a6),d0
	subq.w	#$1,$E(a6)
	tst.w	$E(a6)
	bgt.w	loc_11ED88
	tst.b	-$2(a6)
	beq.s	loc_11EE9E
	movea.l	$8(a6),a0
	moveq	#$0,d0
	move.l	d0,$9A(a0)
loc_11EE9E:
	movem.l	-$26(a6),d3-d7/a3-a4
	unlk	a6
	rts
