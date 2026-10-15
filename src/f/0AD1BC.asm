; ---------------------------------------------------------------------------
; SavageA2_SetBlockTiles - SavageA2: rewrite the tiles of the solid block at a tile (and optionally remove the block, dropping anything standing on it)
; In:  8(a6) = column, $A(a6) = row, $C(a6) = word tile, $F(a6) = byte remove, $12(a6) = word edge tile
; Out: d0 = 0
; Evidence: sub_1F8454($14, col, row) finds the block; remove: Obj_Detach on objects whose floor +$76 is it, Seg_Free, tile & $47FF; writes the tile over the block area (edge column gets the edge tile, with Explosion_Spawn debris) and redraws (Map_RedrawBlock); jt 890
; Found: jt 890
; ---------------------------------------------------------------------------
SavageA2_SetBlockTiles:
	link.w	a6,#$FFF0
	movem.l	d4-d7/a3-a4,-(a7)
	move.b	$17(a6),d4
	move.w	$12(a6),d5
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$14,d0
	move.l	d0,-(a7)
	jsr	$4F52(a5)	; -> sub_1F8454
	movea.l	d0,a4
	move.l	a4,d0
	lea.l	$C(a7),a7
	bne.s	loc_0AD1F4
	moveq	#$0,d0
	bra.w	loc_0AD338
loc_0AD1F4:
	move.w	$A(a4),d0
	ext.l	d0
	moveq	#$10,d1
	add.l	d1,d0
	asr.l	#$5,d0
	move.w	d0,-$8(a6)
	move.w	$E(a4),d0
	ext.l	d0
	add.l	d1,d0
	asr.l	#$5,d0
	move.w	d0,-$6(a6)
	move.w	$8(a4),d0
	ext.l	d0
	add.l	d1,d0
	asr.l	#$5,d0
	move.w	d0,-$4(a6)
	move.w	$C(a4),d0
	ext.l	d0
	add.l	d1,d0
	asr.l	#$5,d0
	move.w	d0,-$2(a6)
	tst.b	d4
	beq.s	loc_0AD28A
	moveq	#$0,d7
	movea.l	g_ObjTable(a5),a0
	movea.l	(a0),a3
	bra.s	loc_0AD270
loc_0AD23C:
	move.w	$4(a3),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0AD262
	cmpa.l	$76(a3),a4
	bne.s	loc_0AD262
	move.l	a3,-(a7)
	jsr	$4E7A(a5)	; -> Obj_Detach
	addq.w	#$4,a7
loc_0AD262:
	addq.l	#$1,d7
	movea.l	g_ObjTable(a5),a0
	move.l	d7,d0
	asl.l	#$2,d0
	movea.l	(a0,d0.l),a3
loc_0AD270:
	move.w	g_ObjCount(a5),d0
	ext.l	d0
	cmp.l	d7,d0
	bgt.s	loc_0AD23C
	move.l	a4,-(a7)
	jsr	$4F22(a5)	; -> Seg_Free
	andi.w	#$7FFF,d5
	andi.w	#$C7FF,d5
	addq.w	#$4,a7
loc_0AD28A:
	move.w	-$4(a6),d6
	bra.w	loc_0AD32E
loc_0AD292:
	move.w	-$8(a6),d7
	bra.w	loc_0AD322
loc_0AD29A:
	ext.l	d7
	movea.l	-$3A72(a5),a0
	move.l	d7,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d6
	add.l	d6,d0
	movea.l	-$3A84(a5),a0
	add.l	d0,d0
	lea.l	(a0,d0.l),a4
	tst.b	d4
	beq.s	loc_0AD2EE
	ext.l	d6
	move.l	d6,d0
	lsl.l	#$5,d0
	moveq	#$10,d1
	add.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,-$10(a6)
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$5,d0
	add.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,-$C(a6)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	-$C(a6),-(a7)
	move.l	-$10(a6),-(a7)
	jsr	$2DCA(a5)	; -> Explosion_Spawn
	lea.l	$C(a7),a7
loc_0AD2EE:
	tst.b	d4
	beq.s	loc_0AD308
	cmp.w	-$8(a6),d7
	bne.s	loc_0AD308
	move.w	#$FE00,d0
	and.w	d5,d0
	move.w	$1A(a6),d1
	or.w	d0,d1
	move.w	d1,(a4)
	bra.s	loc_0AD30A
loc_0AD308:
	move.w	d5,(a4)
loc_0AD30A:
	moveq	#$0,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$3FCA(a5)	; -> Map_RedrawBlock
	lea.l	$C(a7),a7
	move.w	d7,d0
	addq.w	#$1,d7
loc_0AD322:
	cmp.w	-$6(a6),d7
	blt.w	loc_0AD29A
	move.w	d6,d0
	addq.w	#$1,d6
loc_0AD32E:
	cmp.w	-$2(a6),d6
	blt.w	loc_0AD292
	moveq	#$0,d0
loc_0AD338:
	movem.l	-$28(a6),d4-d7/a3-a4
	unlk	a6
	rts
