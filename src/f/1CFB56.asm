; ---------------------------------------------------------------------------
; sub_1CFB56	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1CFB56:
	link.w	a6,#$0
	movem.l	d3/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_1CFB82
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1CFE1C
loc_1CFB82:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CFB96
	move.w	-$3BA4(a5),d0
	and.w	g_Pad1Pressed(a5),d0
	bra.s	loc_1CFB9E
loc_1CFB96:
	move.w	-$3BA4(a5),d0
	and.w	g_Pad2Pressed(a5),d0
loc_1CFB9E:
	beq.s	loc_1CFC0E
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CFBB4
	move.w	-$3BA0(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CFBBC
loc_1CFBB4:
	move.w	-$3BA0(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CFBBC:
	bne.s	loc_1CFC0E
	move.l	#$10000,d0
	and.l	$90(a4),d0
	bne.s	loc_1CFC0E
	tst.b	$9D(a4)
	bne.s	loc_1CFBE0
	move.w	-$3BA4(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1CFBEE
loc_1CFBE0:
	move.w	-$3BA4(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1CFBEE:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$82(a0),a1
	jsr	(a1)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.w	loc_1CFE1C
loc_1CFC0E:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CFC22
	move.w	-$3B98(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CFC2A
loc_1CFC22:
	move.w	-$3B98(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CFC2A:
	beq.s	loc_1CFC34
	ori.b	#$10,$2E(a4)
	bra.s	loc_1CFC58
loc_1CFC34:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CFC48
	move.w	-$3B9A(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CFC50
loc_1CFC48:
	move.w	-$3B9A(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CFC50:
	beq.s	loc_1CFC58
	andi.b	#$EF,$2E(a4)
loc_1CFC58:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CFC6C
	move.w	-$3B9E(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CFC74
loc_1CFC6C:
	move.w	-$3B9E(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CFC74:
	beq.w	loc_1CFD40
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CFC8C
	move.w	-$3B9C(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CFC94
loc_1CFC8C:
	move.w	-$3B9C(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CFC94:
	beq.s	loc_1CFCEC
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CFCAA
	move.w	-$3BA8(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1CFCB2
loc_1CFCAA:
	move.w	-$3BA8(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1CFCB2:
	bne.s	loc_1CFCE0
	lea.l	$4892(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	move.b	#$1,$C2(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_1CFB14(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1CFE1C
loc_1CFCE0:
	lea.l	$48E2(a5),a0
	movea.l	$2(a0),a3
	bra.w	loc_1CFE00
loc_1CFCEC:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CFD00
	move.w	-$3BA8(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1CFD08
loc_1CFD00:
	move.w	-$3BA8(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1CFD08:
	bne.s	loc_1CFD34
	lea.l	$488A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	clr.b	$C2(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_1CFB14(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1CFE1C
loc_1CFD34:
	lea.l	$48DA(a5),a0
	movea.l	$2(a0),a3
	bra.w	loc_1CFE00
loc_1CFD40:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CFD54
	move.w	-$3BA0(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CFD5C
loc_1CFD54:
	move.w	-$3BA0(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CFD5C:
	beq.s	loc_1CFDB0
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CFD72
	move.w	-$3BA8(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1CFD7A
loc_1CFD72:
	move.w	-$3BA8(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1CFD7A:
	bne.s	loc_1CFDA6
	lea.l	$48A2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	move.b	#$3,$C2(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_1CFB14(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1CFE1C
loc_1CFDA6:
	lea.l	$48F2(a5),a0
	movea.l	$2(a0),a3
	bra.s	loc_1CFE00
loc_1CFDB0:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CFDC4
	move.w	-$3BA8(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1CFDCC
loc_1CFDC4:
	move.w	-$3BA8(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1CFDCC:
	bne.s	loc_1CFDF8
	lea.l	$489A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	move.b	#$2,$C2(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_1CFB14(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1CFE1C
loc_1CFDF8:
	lea.l	$48EA(a5),a0
	movea.l	$2(a0),a3
loc_1CFE00:
	cmpa.l	$44(a4),a3
	beq.s	loc_1CFE1C
	tst.w	$A8(a4)
	bgt.s	loc_1CFE1C
	move.w	#$5,$A8(a4)
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
loc_1CFE1C:
	movem.l	-$C(a6),d3/a3-a4
	unlk	a6
	rts
