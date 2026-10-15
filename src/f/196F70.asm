; ---------------------------------------------------------------------------
; sub_196F70	[link-after-rts]
; ---------------------------------------------------------------------------
sub_196F70:
	link.w	a6,#$0
	movem.l	d3/a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$BC(a4),a3
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_196F94
	move.w	-$3BA4(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_196F9C
loc_196F94:
	move.w	-$3BA4(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_196F9C:
	beq.s	loc_196FF6
	movea.l	$8C(a4),a0
	move.w	$12(a0),$22(a4)
	move.w	$E(a0),$20(a4)
	move.b	#$1,-$3892(a5)
	moveq	#$0,d0
	move.w	$C0(a4),d0
	moveq	#-$4,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	moveq	#$0,d1
	or.w	d0,d1
	move.w	d1,$C0(a4)
	andi.w	#$DFFF,$6(a4)
	andi.l	#$FFF7FFFF,$90(a4)
	andi.l	#$FFEFFFFF,$90(a4)
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_19710C
loc_196FF6:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_19700A
	move.w	-$3B9A(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_197012
loc_19700A:
	move.w	-$3B9A(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_197012:
	beq.s	loc_197040
	move.l	#$100000,d0
	and.l	$90(a4),d0
	beq.s	loc_19702A
	clr.w	$1E(a4)
	clr.w	$16(a4)
	bra.s	loc_197092
loc_19702A:
	andi.b	#$EF,$2E(a4)
	move.w	#$208,$16(a4)
	andi.l	#$FFF7FFFF,$90(a4)
	bra.s	loc_197092
loc_197040:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_197054
	move.w	-$3B98(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_19705C
loc_197054:
	move.w	-$3B98(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_19705C:
	beq.s	loc_19708A
	move.l	#$80000,d0
	and.l	$90(a4),d0
	beq.s	loc_197074
	clr.w	$1E(a4)
	clr.w	$16(a4)
	bra.s	loc_197092
loc_197074:
	ori.b	#$10,$2E(a4)
	move.w	#$FDF8,$16(a4)
	andi.l	#$FFEFFFFF,$90(a4)
	bra.s	loc_197092
loc_19708A:
	clr.w	$1E(a4)
	clr.w	$16(a4)
loc_197092:
	tst.w	$16(a4)
	beq.s	loc_1970F2
	move.l	a3,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4BEA(a5)	; -> sub_1F1478
	tst.b	d0
	lea.l	$C(a7),a7
	bne.s	loc_1970F2
	tst.b	$C2(a4)
	bne.s	loc_1970CA
	move.b	#$1,$C2(a4)
	lea.l	$438A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	addq.w	#$8,a7
	bra.s	loc_1970DE
loc_1970CA:
	clr.b	$C2(a4)
	lea.l	$4392(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	addq.w	#$8,a7
loc_1970DE:
	clr.w	$6C(a4)
	lea.l	sub_196C82(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_19710C
loc_1970F2:
	clr.w	$1E(a4)
	clr.w	$16(a4)
	clr.w	$6C(a4)
	lea.l	sub_196F70(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_19710C:
	movem.l	-$C(a6),d3/a3-a4
	unlk	a6
	rts
