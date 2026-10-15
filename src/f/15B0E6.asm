; ---------------------------------------------------------------------------
; Spr_ReloadDefs - run a sprite-definition loader with the VRAM tile cursor reset, then re-pack the VRAM tiles of live objects that sat above it
; In:  8(a6) = loader function, $C(a6) = byte force re-pack
; Out: none
; Evidence: g_VramTileCursor = $FFC64C + $FFC64A, g_SpriteDefCount = 0, call loader; objects (not players) with tile base +$34 >= old cursor get new bases and Spr_InvalidateFrame; callers BigAcolyte_ActAppear, CloneA5_FrameHook, XClone_StartMakerMode
; ---------------------------------------------------------------------------
Spr_ReloadDefs:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	move.w	g_VramTileCursor(a5),d6
	move.w	-$3BB6(a5),d0
	add.w	-$3BB4(a5),d0
	move.w	d0,g_VramTileCursor(a5)
	clr.w	g_SpriteDefCount(a5)
	movea.l	$8(a6),a0
	jsr	(a0)
	cmp.w	g_VramTileCursor(a5),d6
	blt.s	loc_15B11A
	tst.b	$F(a6)
	bne.s	loc_15B11A
	move.w	d6,g_VramTileCursor(a5)
	bra.s	loc_15B180
loc_15B11A:
	clr.w	d7
	movea.l	g_ObjTable(a5),a0
	movea.l	(a0),a4
	bra.s	loc_15B17A
loc_15B124:
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_15B16A
	lea.l	g_Player1(a5),a0
	cmpa.l	a4,a0
	beq.s	loc_15B16A
	lea.l	g_Player2(a5),a0
	cmpa.l	a4,a0
	beq.s	loc_15B16A
	cmp.w	$34(a4),d6
	bgt.s	loc_15B16A
	move.w	g_VramTileCursor(a5),$34(a4)
	move.w	$36(a4),d0
	add.w	d0,g_VramTileCursor(a5)
	pea.l	$2E(a4)
	jsr	$5072(a5)	; -> Spr_InvalidateFrame
	addq.w	#$4,a7
loc_15B16A:
	addq.w	#$1,d7
	move.w	d7,d0
	ext.l	d0
	movea.l	g_ObjTable(a5),a0
	asl.l	#$2,d0
	movea.l	(a0,d0.l),a4
loc_15B17A:
	cmp.w	g_ObjCount(a5),d7
	blt.s	loc_15B124
loc_15B180:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
