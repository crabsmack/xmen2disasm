; ---------------------------------------------------------------------------
; Boulder_SpawnerTick - BaniMazaB2 boulder spawner: when the countdown -$3B32 ends, drop a BOULDER from 80 px above the screen ahead of the lowest player, then take the next delay from the sequence jt $5A878
; In:  8(a6) = long y limit
; Out: d0
; Evidence: jt 403; caller Tusk_StateBoulderRain; BOULDER +$0E New (Tbl_Boulder_vtable); Seq_NextWrap(jt $5A878, -$3B04, -$3B32); countdown -1 (-2 at half rate)
; ---------------------------------------------------------------------------
Boulder_SpawnerTick:
	link.w	a6,#$FFEE
	movem.l	d3-d7,-(a7)
	tst.w	g_SceneVar3B32(a5)
	bgt.w	loc_05AFF6
	move.w	g_CameraY(a5),d0
	ext.l	d0
	moveq	#$50,d1
	sub.l	d1,d0
	move.w	d0,-$12(a6)
	move.l	$8(a6),d6
	add.l	#$1C000,d6
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d2
	and.w	d0,d2
	moveq	#$0,d0
	move.w	d2,d0
	cmpi.l	#$8000,d0
	seq.b	d3
	neg.b	d3
	move.b	d3,d4
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d2
	and.w	d0,d2
	moveq	#$0,d0
	move.w	d2,d0
	cmpi.l	#$8000,d0
	seq.b	d3
	neg.b	d3
	move.b	d3,d5
	tst.b	d4
	beq.s	loc_05AF7E
	tst.b	d5
	beq.s	loc_05AF7E
	move.l	g_Player1+$C(a5),d0
	cmp.l	g_Player2+$C(a5),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_05AF4E
	move.l	g_Player1+$C(a5),d0
	bra.s	loc_05AF52
loc_05AF4E:
	move.l	g_Player2+$C(a5),d0
loc_05AF52:
	cmp.l	d0,d6
	bgt.w	loc_05B00C
	move.w	g_SceneVar3B04(a5),d0
	btst	#$0,d0
	beq.s	loc_05AF70
	moveq	#$F,d0
	muls.w	g_Player1+$16(a5),d0
	move.l	d0,d7
	add.l	g_Player1+$8(a5),d7
	bra.s	loc_05AFAE
loc_05AF70:
	moveq	#$F,d0
	muls.w	g_Player2+$16(a5),d0
	move.l	d0,d7
	add.l	g_Player2+$8(a5),d7
	bra.s	loc_05AFAE
loc_05AF7E:
	tst.b	d4
	beq.s	loc_05AF98
	cmp.l	g_Player1+$C(a5),d6
	bgt.w	loc_05B00C
	moveq	#$F,d0
	muls.w	g_Player1+$16(a5),d0
	move.l	d0,d7
	add.l	g_Player1+$8(a5),d7
	bra.s	loc_05AFAE
loc_05AF98:
	tst.b	d5
	beq.s	loc_05AFAE
	cmp.l	g_Player2+$C(a5),d6
	bgt.s	loc_05B00C
	moveq	#$F,d0
	muls.w	g_Player2+$16(a5),d0
	move.l	d0,d7
	add.l	g_Player2+$8(a5),d7
loc_05AFAE:
	clr.w	-$A(a6)
	pea.l	-$10(a6)
	move.w	-$12(a6),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,-(a7)
	move.l	d7,-(a7)
	lea.l	$D22(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$D22(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	pea.l	g_SceneVar3B32(a5)
	pea.l	g_SceneVar3B04(a5)
	lea.l	$C92(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$CA2(a5)	; -> Seq_NextWrap
	lea.l	$20(a7),a7
	bra.s	loc_05B00C
loc_05AFF6:
	move.w	g_SceneVar3B32(a5),d0
	subq.w	#$1,g_SceneVar3B32(a5)
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_05B00C
	move.w	g_SceneVar3B32(a5),d0
	subq.w	#$1,g_SceneVar3B32(a5)
loc_05B00C:
	movem.l	-$26(a6),d3-d7
	unlk	a6
	rts
