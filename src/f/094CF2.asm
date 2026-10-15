; ---------------------------------------------------------------------------
; EvilDrop_Init - vtable +$12 constructor: run the parent's Init, then set up a EVILDROP
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = spawn parameter
; Evidence: slot +$12 of the EVILDROP descriptor $095126; never runs in the corpus; calls parent BIOBALLS slot +$12; state handler(s) put in +$5C: EvilDrop_StateStart
; ---------------------------------------------------------------------------
EvilDrop_Init:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$1632(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	$1642(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$8C(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	lea.l	EvilDrop_StateStart(pc),a0
	move.l	a0,$5C(a4)
	lea.l	EvilDrop_StateStart(pc),a0
	move.l	a0,$64(a4)
	ori.w	#$1083,$6(a4)
	lea.l	$163A(a5),a0
	move.l	$2(a0),$AC(a4)
	movea.l	$14(a6),a0
	lea.l	$B0(a4),a1
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.b	#$1,$C4(a4)
	tst.l	$92(a4)
	lea.l	$18(a7),a7
	beq.s	loc_094DA6
	movea.l	$92(a4),a0
	tst.w	(a0)
	ble.s	loc_094DA6
	movea.l	a0,a3
	addq.w	#$2,a3
	move.w	$10(a4),(a3)
	move.w	$12(a4),$2(a3)
	movea.l	$92(a4),a0
	moveq	#$1,d0
	cmp.w	(a0),d0
	bge.s	loc_094DA6
	addq.w	#$6,a3
	move.w	#$FFFF,(a3)
	move.w	#$FFFF,$2(a3)
loc_094DA6:
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_094DD6
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_094DCE
	ori.b	#$4,$2E(a4)
	bra.s	loc_094E1C
loc_094DCE:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_094E1C
loc_094DD6:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_094E06
	moveq	#$4,d0
	and.b	-$181A(a5),d0
	beq.s	loc_094DFE
	ori.b	#$4,$2E(a4)
	bra.s	loc_094E1C
loc_094DFE:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_094E1C
loc_094E06:
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_094E16
	ori.b	#$4,$2E(a4)
	bra.s	loc_094E1C
loc_094E16:
	andi.b	#$FB,$2E(a4)
loc_094E1C:
	movea.l	$14(a6),a0
	move.w	$2(a0),d6
	move.w	$4(a0),d7
	moveq	#$0,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,d1
	moveq	#$20,d2
	add.l	d2,d1
	move.l	d1,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$3EFA(a5)	; -> Seg_FindBelow
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$C(a7),a7
	beq.s	loc_094E66
	move.w	$A(a3),d0
	cmp.w	$E(a3),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_094E5C
	move.w	$A(a3),d0
	bra.s	loc_094E60
loc_094E5C:
	move.w	$E(a3),d0
loc_094E60:
	move.w	d0,$C2(a4)
	bra.s	loc_094E70
loc_094E66:
	move.w	d7,d0
	add.w	#$80,d0
	move.w	d0,$C2(a4)
loc_094E70:
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
