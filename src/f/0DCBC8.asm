; ---------------------------------------------------------------------------
; Blast_Init - parent Init, then no vertical speed, state Blast_StateStart (+$5C/+$64), flags |= $82, sprite set g_BarrierSprDef (palette 0, priority), sub_1F7F38(this, 1000, -1) (result unused); from the placement (or defaults): switch number +$94 (+6), speed +$98 = |+8| ($100) reversed when +$A is set, +$9C = byte +$F, switch flag word +$8C = &(-$3BFA)[switch]; no latched target (BLAST override of slot +$12 Init)
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = placement entry or null
; Out: none
; Evidence: slot +$12 of the BLAST descriptor $0DD0E8; TAS frames 2782-7178 (40 frames active)
; ---------------------------------------------------------------------------
Blast_Init:
	link.w	a6,#$FFF0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	move.l	$10(a6),d6
	move.l	$C(a6),d7
	movea.l	$8(a6),a3
	move.l	$14(a6),-(a7)
	move.l	d6,-(a7)
	move.l	d7,-(a7)
	move.l	a3,-(a7)
	lea.l	$24CA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$18(a3)
	clr.w	$20(a3)
	lea.l	Blast_StateStart(pc),a0
	move.l	a0,$5C(a3)
	lea.l	Blast_StateStart(pc),a0
	move.l	a0,$64(a3)
	ori.w	#$82,$6(a3)
	move.w	g_BarrierSprDef(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	jsr	$4E5A(a5)	; -> Obj_SetSpriteDef
	moveq	#-$4,d0
	and.b	$2E(a3),d0
	moveq	#$0,d1
	or.b	d0,d1
	move.b	d1,$2E(a3)
	ori.b	#$4,$2E(a3)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	pea.l	($3E8).w
	move.l	a3,-(a7)
	jsr	$4F3A(a5)	; -> sub_1F7F38
	movea.l	d0,a4
	move.l	a4,d0
	lea.l	$24(a7),a7
	tst.l	$14(a6)
	bne.s	loc_0DCC9A
	lea.l	-$10(a6),a0
	move.l	a0,$14(a6)
	move.l	d7,d0
	asr.l	#$8,d0
	move.w	d0,$2(a0)
	move.l	d6,d0
	asr.l	#$8,d0
	movea.l	$14(a6),a0
	move.w	d0,$4(a0)
	movea.l	$14(a6),a0
	clr.w	$6(a0)
	movea.l	$14(a6),a0
	move.w	#$100,$8(a0)
	movea.l	$14(a6),a0
	clr.w	$A(a0)
	movea.l	$14(a6),a0
	clr.w	$C(a0)
	movea.l	$14(a6),a0
	clr.w	$E(a0)
loc_0DCC9A:
	movea.l	$14(a6),a0
	move.w	$6(a0),$94(a3)
	movea.l	$14(a6),a0
	move.w	$8(a0),d7
	beq.s	loc_0DCCC8
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_0DCCBC
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_0DCCC2
loc_0DCCBC:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_0DCCC2:
	move.w	d0,$98(a3)
	bra.s	loc_0DCCCE
loc_0DCCC8:
	move.w	#$100,$98(a3)
loc_0DCCCE:
	movea.l	$14(a6),a0
	move.w	$A(a0),d7
	beq.s	loc_0DCCE4
	move.w	$98(a3),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$98(a3)
loc_0DCCE4:
	movea.l	$14(a6),a0
	move.b	$F(a0),$9C(a3)
	move.w	$94(a3),d0
	ext.l	d0
	movea.l	g_SentinelsD1Flags(a5),a0
	add.l	d0,d0
	adda.l	d0,a0
	move.l	a0,$8C(a3)
	clr.w	$9A(a3)
	clr.w	$96(a3)
	moveq	#$0,d0
	move.l	d0,$90(a3)
	movem.l	-$24(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
