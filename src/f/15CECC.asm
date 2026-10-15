; ---------------------------------------------------------------------------
; Tile_TestAt - test the map block at a point: hooked tile type in a mask (optionally running its hook) or the solid bit
; In:  8(a6) = object, $C/$10(a6) = words x/y, $14(a6) = byte FG map, $18(a6) = word mask ($3800 hook types, $4000 solid), $1C(a6) = byte run hook
; Out: d0 = 1 hit (also outside the map), 0 free
; Evidence: cell = (x>>5, y>>5) in the FG ($FFC77C) or BG ($FFC778) map; hook table $FFC708; used by projectiles (MagneticGlob_Update, Magneto_SpawnShot, Beast_ShockwaveStep)
; ---------------------------------------------------------------------------
Tile_TestAt:
	link.w	a6,#$FFFA
	movem.l	d4-d7/a3-a4,-(a7)
	move.b	$17(a6),d6
	beq.s	loc_15CEE0
	move.w	g_FgMapW(a5),d0
	bra.s	loc_15CEE4
loc_15CEE0:
	move.w	g_BgMapW(a5),d0
loc_15CEE4:
	move.w	d0,-$4(a6)
	tst.b	d6
	beq.s	loc_15CEF2
	move.w	g_FgMapH(a5),d0
	bra.s	loc_15CEF6
loc_15CEF2:
	move.w	g_BgMapH(a5),d0
loc_15CEF6:
	move.w	d0,d7
	move.w	$E(a6),d0
	asr.w	#$5,d0
	move.w	d0,-$2(a6)
	move.w	$12(a6),d4
	asr.w	#$5,d4
	moveq	#$1,d5
	tst.w	-$2(a6)
	blt.w	loc_15D002
	move.w	-$2(a6),d0
	cmp.w	-$4(a6),d0
	bge.w	loc_15D002
	tst.w	d4
	blt.w	loc_15D002
	cmp.w	d4,d7
	ble.w	loc_15D002
	tst.b	d6
	beq.s	loc_15CF52
	ext.l	d4
	movea.l	g_FgRowTable(a5),a0
	move.l	d4,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	move.w	-$2(a6),d1
	ext.l	d1
	add.l	d0,d1
	movea.l	g_FgBlockMap(a5),a0
	add.l	d1,d1
	adda.l	d1,a0
	move.l	a0,d0
	bra.s	loc_15CF74
loc_15CF52:
	ext.l	d4
	movea.l	g_BgRowTable(a5),a0
	move.l	d4,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	move.w	-$2(a6),d1
	ext.l	d1
	add.l	d0,d1
	movea.l	g_BgBlockMap(a5),a0
	add.l	d1,d1
	adda.l	d1,a0
	move.l	a0,d0
loc_15CF74:
	movea.l	d0,a3
	move.w	#$3800,d0
	and.w	$1A(a6),d0
	moveq	#$B,d1
	lsr.w	d1,d0
	move.w	d0,-$6(a6)
	clr.b	d5
	tst.w	-$6(a6)
	beq.s	loc_15CFE4
	move.w	#$3800,d0
	and.w	(a3),d0
	moveq	#$B,d1
	move.w	d0,d6
	lsr.w	d1,d6
	move.w	-$6(a6),d7
	and.w	d6,d7
	move.w	-$6(a6),d7
	and.w	d6,d7
	tst.w	d7
	beq.s	loc_15CFE4
	cmp.w	d7,d6
	bne.s	loc_15CFE4
	move.l	d7,d0
	asl.w	#$2,d0
	lea.l	g_TileHooks(a5),a0
	movea.l	(a0,d0.w),a4
	move.l	a4,d0
	beq.s	loc_15CFE4
	moveq	#$1,d5
	tst.b	$1F(a6)
	beq.s	loc_15CFE4
	moveq	#-$1,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	$8(a6),-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	move.w	-$2(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	movea.l	a4,a0
	jsr	(a0)
	lea.l	$14(a7),a7
loc_15CFE4:
	tst.b	d5
	bne.s	loc_15D002
	move.w	#$4000,d0
	and.w	$1A(a6),d0
	beq.s	loc_15D002
	move.w	#$4000,d0
	and.w	(a3),d0
	beq.s	loc_15CFFE
	moveq	#$1,d0
	bra.s	loc_15D000
loc_15CFFE:
	moveq	#$0,d0
loc_15D000:
	move.b	d0,d5
loc_15D002:
	move.b	d5,d0
	movem.l	-$1E(a6),d4-d7/a3-a4
	unlk	a6
	rts
