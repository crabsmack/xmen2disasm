; ---------------------------------------------------------------------------
; Brood_Init - parent Init, then no vertical speed, state Brood_StateStart (+$5C/+$64), flags |= $80, sprite def jt $FDA (palette 1), face like the live player; patrol x range +$A2..+$A4 = x -/+ |placement +6/+8| ($80) with direction flags +$A0/+$A1, speed +$A6 = |+$A| << 8 ($100), +$AE/+$B0 = +$C (90); floor y +$A8 from the segment below (+$AA = 32 above), +$AC = 120; frame $FF, stats jt $101A (health), AI script jt $1012 (+$96) (BROOD override of slot +$12 Init)
; In:  8(a6) = this (BROOD object), $C(a6)/$10(a6) = x/y (8.8 fixed), $14(a6) = placement entry
; Out: none
; Evidence: class descriptor BROOD slot +$12 (tools/classes.py); AiScript_Set is called with jt $100A then jt $1012, the second wins; TAS frames 46223-48533 (6 active)
; ---------------------------------------------------------------------------
Brood_Init:
	link.w	a6,#$FFFC
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$1022(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$18(a4)
	clr.w	$20(a4)
	lea.l	Brood_StateStart(pc),a0
	move.l	a0,$5C(a4)
	lea.l	Brood_StateStart(pc),a0
	move.l	a0,$64(a4)
	ori.w	#$80,$6(a4)
	lea.l	$FDA(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	lea.l	$10(a7),a7
	bne.s	loc_06D28E
	moveq	#$4,d0
	and.b	g_Player1+$2E(a5),d0
	beq.s	loc_06D286
	ori.b	#$4,$2E(a4)
	bra.s	loc_06D2D4
loc_06D286:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_06D2D4
loc_06D28E:
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_06D2BE
	moveq	#$4,d0
	and.b	g_Player2+$2E(a5),d0
	beq.s	loc_06D2B6
	ori.b	#$4,$2E(a4)
	bra.s	loc_06D2D4
loc_06D2B6:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_06D2D4
loc_06D2BE:
	moveq	#$4,d0
	and.b	g_Player1+$2E(a5),d0
	beq.s	loc_06D2CE
	ori.b	#$4,$2E(a4)
	bra.s	loc_06D2D4
loc_06D2CE:
	andi.b	#$FB,$2E(a4)
loc_06D2D4:
	moveq	#$0,d0
	move.l	d0,$9C(a4)
	clr.w	$B2(a4)
	move.w	$6(a3),d7
	beq.s	loc_06D2FC
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_06D2F2
	ext.l	d7
	move.l	d7,d1
	bra.s	loc_06D302
loc_06D2F2:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	move.l	d0,d1
	bra.s	loc_06D302
loc_06D2FC:
	move.l	#$80,d1
loc_06D302:
	move.w	d1,d6
	tst.w	d7
	beq.s	loc_06D318
	tst.w	d7
	sgt.b	d3
	neg.b	d3
	beq.s	loc_06D314
	moveq	#$1,d0
	bra.s	loc_06D31A
loc_06D314:
	moveq	#$0,d0
	bra.s	loc_06D31A
loc_06D318:
	moveq	#$1,d0
loc_06D31A:
	move.b	d0,$A0(a4)
	move.w	$2(a3),d0
	sub.w	d6,d0
	move.w	d0,$A2(a4)
	move.w	$8(a3),d7
	beq.s	loc_06D344
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_06D33C
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_06D34A
loc_06D33C:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	bra.s	loc_06D34A
loc_06D344:
	move.l	#$80,d0
loc_06D34A:
	move.w	d0,d6
	tst.w	d7
	beq.s	loc_06D360
	tst.w	d7
	sgt.b	d3
	neg.b	d3
	beq.s	loc_06D35C
	moveq	#$1,d0
	bra.s	loc_06D362
loc_06D35C:
	moveq	#$0,d0
	bra.s	loc_06D362
loc_06D360:
	moveq	#$1,d0
loc_06D362:
	move.b	d0,$A1(a4)
	move.w	d6,d0
	add.w	$2(a3),d0
	move.w	d0,$A4(a4)
	move.w	$A(a3),d7
	beq.s	loc_06D38E
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_06D384
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_06D38A
loc_06D384:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_06D38A:
	lsl.l	#$8,d0
	bra.s	loc_06D394
loc_06D38E:
	move.l	#$100,d0
loc_06D394:
	move.w	d0,$A6(a4)
	move.w	$C(a3),d7
	beq.s	loc_06D3A2
	move.w	d7,d0
	bra.s	loc_06D3A4
loc_06D3A2:
	moveq	#$5A,d0
loc_06D3A4:
	move.w	d0,$AE(a4)
	move.w	$AE(a4),$B0(a4)
	move.w	$E(a3),d7
	move.w	$2(a3),d6
	move.w	$4(a3),d0
	ext.l	d0
	move.l	d0,d7
	moveq	#$20,d0
	sub.l	d0,d7
	pea.l	($3E8).w
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$3EFA(a5)	; -> Seg_FindBelow
	move.l	d0,-$4(a6)
	lea.l	$C(a7),a7
	beq.s	loc_06D404
	movea.l	-$4(a6),a0
	movea.l	a0,a1
	move.w	$A(a0),d0
	cmp.w	$E(a1),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_06D3F6
	movea.w	$A(a0),a0
	bra.s	loc_06D3FE
loc_06D3F6:
	movea.l	-$4(a6),a0
	movea.w	$E(a0),a0
loc_06D3FE:
	move.w	a0,$A8(a4)
	bra.s	loc_06D40A
loc_06D404:
	move.w	$4(a3),$A8(a4)
loc_06D40A:
	move.w	$A8(a4),d0
	sub.w	#$20,d0
	move.w	d0,$AA(a4)
	move.w	#$78,$AC(a4)
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	lea.l	$101A(a5),a0
	movea.l	$2(a0),a0
	move.l	a0,$8C(a4)
	moveq	#$0,d0
	move.b	$2(a0),d0
	move.w	d0,$68(a4)
	lea.l	$100A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	lea.l	$1012(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	clr.w	$B4(a4)
	lea.l	$18(a7),a7
	movem.l	-$18(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
