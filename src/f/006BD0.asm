; ---------------------------------------------------------------------------
; Players_PlaceAtStart - put the players that are still in play at a stage's start position (P2 30 px right of P1) with their carried health
; In:  8(a6) = long x px, $C(a6) = long y px (overridden by the start record at $FFE9A0 if set)
; Out: none
; Evidence: jt 13, called by 22 stage init functions; vtable $12 = set position (x<<8, y<<8, 0); +$68 = max(g_P1Health, $700); vtable $3E; g_P1Health 0 -> player cleared
; ---------------------------------------------------------------------------
Players_PlaceAtStart:
	link.w	a6,#$FFFE
	movem.l	d3-d7,-(a7)
	move.l	$C(a6),d6
	move.l	$8(a6),d7
	clr.b	-$1(a6)
	clr.b	d4
	clr.b	d5
	moveq	#-$1,d0
	cmp.b	g_P1CharIndex(a5),d0
	beq.s	loc_006BF6
	move.b	#$1,-$1(a6)
loc_006BF6:
	moveq	#-$1,d0
	cmp.b	g_P2CharIndex(a5),d0
	beq.s	loc_006C00
	moveq	#$1,d4
loc_006C00:
	tst.l	-$1860(a5)
	beq.s	loc_006C20
	movea.l	-$1860(a5),a0
	move.w	$2(a0),d0
	ext.l	d0
	move.l	d0,d7
	move.w	$4(a0),d0
	ext.l	d0
	move.l	d0,d6
	moveq	#$0,d0
	move.l	d0,-$1860(a5)
loc_006C20:
	tst.l	-$1864(a5)
	beq.s	loc_006C48
	movea.l	-$1860(a5),a0
	move.w	$2(a0),d0
	ext.l	d0
	move.l	d0,$10(a6)
	movea.l	-$1860(a5),a0
	move.w	$4(a0),d0
	ext.l	d0
	move.l	d0,$14(a6)
	moveq	#$0,d0
	move.l	d0,-$1864(a5)
loc_006C48:
	tst.w	g_P1Health(a5)
	beq.s	loc_006C9E
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d6,d1
	lsl.l	#$8,d1
	move.l	d1,-(a7)
	move.l	d7,d1
	lsl.l	#$8,d1
	move.l	d1,-(a7)
	pea.l	g_Player1(a5)
	movea.l	g_Player1(a5),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	cmpi.w	#$700,g_P1Health(a5)
	slt.b	d3
	neg.b	d3
	beq.s	loc_006C7E
	move.w	#$700,d0
	bra.s	loc_006C82
loc_006C7E:
	move.w	g_P1Health(a5),d0
loc_006C82:
	move.w	d0,-$16F0(a5)
	pea.l	g_Player1(a5)
	movea.l	g_Player1(a5),a0
	movea.l	$3E(a0),a1
	jsr	(a1)
	clr.b	-$16BB(a5)
	lea.l	$14(a7),a7
	bra.s	loc_006CA6
loc_006C9E:
	clr.w	-$1754(a5)
	clr.w	-$16F0(a5)
loc_006CA6:
	tst.w	g_P2Health(a5)
	beq.s	loc_006D02
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d6,d1
	lsl.l	#$8,d1
	move.l	d1,-(a7)
	move.l	d7,d1
	moveq	#$1E,d2
	add.l	d2,d1
	lsl.l	#$8,d1
	move.l	d1,-(a7)
	pea.l	g_Player2(a5)
	movea.l	g_Player2(a5),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	cmpi.w	#$700,g_P2Health(a5)
	slt.b	d3
	neg.b	d3
	beq.s	loc_006CE0
	move.w	#$700,d0
	bra.s	loc_006CE4
loc_006CE0:
	move.w	g_P2Health(a5),d0
loc_006CE4:
	move.w	d0,-$17E0(a5)
	pea.l	g_Player2(a5)
	movea.l	g_Player2(a5),a0
	movea.l	$3E(a0),a1
	jsr	(a1)
	move.b	#$1,-$17AB(a5)
	lea.l	$14(a7),a7
	bra.s	loc_006D0A
loc_006D02:
	clr.w	-$1844(a5)
	clr.w	-$17E0(a5)
loc_006D0A:
	move.b	#$1,-$38B2(a5)
	tst.b	d5
	beq.s	loc_006D18
	jsr	unk_Player_005F18(pc)
loc_006D18:
	movem.l	-$16(a6),d3-d7
	unlk	a6
	rts
