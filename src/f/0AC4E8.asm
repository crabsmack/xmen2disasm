; ---------------------------------------------------------------------------
; PerimeterDoor_TileHit - PERIMETERDOOR slot +$6E: one of its 3x3 tiles was hit - crack that tile, debris; after 9 hits make the opening solid-free and mark the tiles
; In:  8(a6) = this, $E(a6) = word column, $12(a6) = word row, $14(a6) = hitting object
; Out: none
; Evidence: 10-frame cooldown +$6A; tile ids by scene (g_ScnSavageA2 set $38.. else $3A..) via Map_SetBlockFG; -$3C34 += 1; Explosion_Spawn/Explosion_SpawnSetTimerWord debris; at 9: Seg_Create(3, block, ...) and tile flags |= $1800; per-player 10-frame cooldown (+$6A) then sound $38; called through PerimeterDoor_TileHook; TAS 31741-33049
; Found: jt 888
; ---------------------------------------------------------------------------
PerimeterDoor_TileHit:
	link.w	a6,#$FFEE
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$14(a6),a3
	move.w	$E(a6),d6
	movea.l	$8(a6),a4
	move.w	$12(a6),d7
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
	move.w	#$1FF,d4
	and.w	(a0,d0.l),d4
	tst.w	$6A(a4)
	bgt.w	loc_0AC912
	moveq	#$0,d0
	move.b	g_ScnSavageA2(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	bne.s	loc_0AC572
	move.w	#$38,-$E(a6)
	move.w	-$E(a6),d0
	addq.w	#$1,d0
	move.w	d0,-$C(a6)
	addq.w	#$1,d0
	move.w	d0,-$A(a6)
	move.w	#$3E,-$8(a6)
	move.w	-$8(a6),d0
	addq.w	#$1,d0
	move.w	d0,-$6(a6)
	addq.w	#$1,d0
	move.w	d0,-$4(a6)
	moveq	#$45,d4
	move.w	d4,d5
	addq.w	#$1,d5
	move.w	d5,d0
	addq.w	#$1,d0
	move.w	d0,-$2(a6)
	bra.s	loc_0AC5AC
loc_0AC572:
	move.w	#$3A,-$E(a6)
	move.w	-$E(a6),d0
	addq.w	#$1,d0
	move.w	d0,-$C(a6)
	addq.w	#$1,d0
	move.w	d0,-$A(a6)
	move.w	#$41,-$8(a6)
	move.w	-$8(a6),d0
	addq.w	#$1,d0
	move.w	d0,-$6(a6)
	addq.w	#$1,d0
	move.w	d0,-$4(a6)
	moveq	#$48,d4
	move.w	d4,d5
	addq.w	#$1,d5
	move.w	d5,d0
	addq.w	#$1,d0
	move.w	d0,-$2(a6)
loc_0AC5AC:
	move.w	#$A,$6A(a4)
	moveq	#$9,d0
	cmp.w	-$3C34(a5),d0
	ble.w	loc_0AC89E
	cmp.w	$90(a4),d6
	bne.w	loc_0AC652
	ext.l	d7
	move.w	$8E(a4),d0
	ext.l	d0
	move.l	d7,d1
	sub.l	d0,d1
	beq.s	loc_0AC5DE
	subq.l	#$1,d1
	beq.s	loc_0AC606
	subq.l	#$1,d1
	beq.s	loc_0AC62E
	bra.w	loc_0AC788
loc_0AC5DE:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	-$E(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$3FDA(a5)	; -> Map_SetBlockFG
	move.w	-$3C34(a5),d0
	addq.w	#$1,-$3C34(a5)
	lea.l	$10(a7),a7
	bra.w	loc_0AC788
loc_0AC606:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	-$8(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$3FDA(a5)	; -> Map_SetBlockFG
	move.w	-$3C34(a5),d0
	addq.w	#$1,-$3C34(a5)
	lea.l	$10(a7),a7
	bra.w	loc_0AC788
loc_0AC62E:
	moveq	#$0,d0
	move.l	d0,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$3FDA(a5)	; -> Map_SetBlockFG
	move.w	-$3C34(a5),d0
	addq.w	#$1,-$3C34(a5)
	lea.l	$10(a7),a7
	bra.w	loc_0AC788
loc_0AC652:
	ext.l	d6
	move.w	$90(a4),d0
	ext.l	d0
	addq.l	#$1,d0
	cmp.l	d6,d0
	bne.w	loc_0AC6F0
	ext.l	d7
	move.w	$8E(a4),d0
	ext.l	d0
	move.l	d7,d1
	sub.l	d0,d1
	beq.s	loc_0AC67C
	subq.l	#$1,d1
	beq.s	loc_0AC6A4
	subq.l	#$1,d1
	beq.s	loc_0AC6CC
	bra.w	loc_0AC788
loc_0AC67C:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	-$C(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$3FDA(a5)	; -> Map_SetBlockFG
	move.w	-$3C34(a5),d0
	addq.w	#$1,-$3C34(a5)
	lea.l	$10(a7),a7
	bra.w	loc_0AC788
loc_0AC6A4:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	-$6(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$3FDA(a5)	; -> Map_SetBlockFG
	move.w	-$3C34(a5),d0
	addq.w	#$1,-$3C34(a5)
	lea.l	$10(a7),a7
	bra.w	loc_0AC788
loc_0AC6CC:
	moveq	#$0,d0
	move.l	d0,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$3FDA(a5)	; -> Map_SetBlockFG
	move.w	-$3C34(a5),d0
	addq.w	#$1,-$3C34(a5)
	lea.l	$10(a7),a7
	bra.w	loc_0AC788
loc_0AC6F0:
	ext.l	d6
	move.w	$90(a4),d0
	ext.l	d0
	addq.l	#$2,d0
	cmp.l	d6,d0
	bne.w	loc_0AC788
	ext.l	d7
	move.w	$8E(a4),d0
	ext.l	d0
	move.l	d7,d1
	sub.l	d0,d1
	beq.s	loc_0AC718
	subq.l	#$1,d1
	beq.s	loc_0AC73E
	subq.l	#$1,d1
	beq.s	loc_0AC764
	bra.s	loc_0AC788
loc_0AC718:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	-$A(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$3FDA(a5)	; -> Map_SetBlockFG
	move.w	-$3C34(a5),d0
	addq.w	#$1,-$3C34(a5)
	lea.l	$10(a7),a7
	bra.s	loc_0AC788
loc_0AC73E:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	-$4(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$3FDA(a5)	; -> Map_SetBlockFG
	move.w	-$3C34(a5),d0
	addq.w	#$1,-$3C34(a5)
	lea.l	$10(a7),a7
	bra.s	loc_0AC788
loc_0AC764:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	-$2(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$3FDA(a5)	; -> Map_SetBlockFG
	move.w	-$3C34(a5),d0
	addq.w	#$1,-$3C34(a5)
	lea.l	$10(a7),a7
loc_0AC788:
	moveq	#$0,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,d1
	lsl.l	#$5,d1
	addq.l	#$8,d1
	lsl.l	#$8,d1
	move.l	d1,-(a7)
	ext.l	d6
	move.l	d6,d1
	lsl.l	#$5,d1
	addq.l	#$8,d1
	lsl.l	#$8,d1
	move.l	d1,-(a7)
	jsr	$2DCA(a5)	; -> Explosion_Spawn
	moveq	#$4,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	ext.l	d7
	move.l	d7,d2
	lsl.l	#$5,d2
	moveq	#$18,d0
	add.l	d0,d2
	lsl.l	#$8,d2
	move.l	d2,-(a7)
	ext.l	d6
	move.l	d6,d2
	lsl.l	#$5,d2
	moveq	#$10,d0
	add.l	d0,d2
	lsl.l	#$8,d2
	move.l	d2,-(a7)
	jsr	$2DD2(a5)	; -> Explosion_SpawnSetTimerWord
	moveq	#$8,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	ext.l	d7
	move.l	d7,d2
	lsl.l	#$5,d2
	addq.l	#$8,d2
	lsl.l	#$8,d2
	move.l	d2,-(a7)
	ext.l	d6
	move.l	d6,d2
	lsl.l	#$5,d2
	moveq	#$18,d0
	add.l	d0,d2
	lsl.l	#$8,d2
	move.l	d2,-(a7)
	jsr	$2DD2(a5)	; -> Explosion_SpawnSetTimerWord
	moveq	#$9,d0
	cmp.w	-$3C34(a5),d0
	lea.l	$2C(a7),a7
	bne.w	loc_0AC8A6
	move.w	$8E(a4),d0
	ext.l	d0
	lsl.l	#$5,d0
	moveq	#$60,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	move.w	$90(a4),d0
	ext.l	d0
	lsl.l	#$5,d0
	add.l	d1,d0
	move.l	d0,-(a7)
	move.w	$8E(a4),d0
	ext.l	d0
	lsl.l	#$5,d0
	add.l	d1,d0
	move.l	d0,-(a7)
	move.w	$90(a4),d0
	ext.l	d0
	lsl.l	#$5,d0
	move.l	d0,-(a7)
	move.w	$8C(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$3,d0
	move.l	d0,-(a7)
	jsr	$4F1A(a5)	; -> Seg_Create
	move.l	d0,-$12(a6)
	move.w	$90(a4),d6
	lea.l	$18(a7),a7
	bra.s	loc_0AC88E
loc_0AC852:
	move.w	$8E(a4),d7
	bra.s	loc_0AC87C
loc_0AC858:
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
	ori.w	#$1800,(a0,d0.l)
	move.w	d7,d0
	addq.w	#$1,d7
loc_0AC87C:
	ext.l	d7
	move.w	$8E(a4),d0
	ext.l	d0
	addq.l	#$2,d0
	cmp.l	d7,d0
	bge.s	loc_0AC858
	move.w	d6,d0
	addq.w	#$1,d6
loc_0AC88E:
	ext.l	d6
	move.w	$90(a4),d0
	ext.l	d0
	addq.l	#$2,d0
	cmp.l	d6,d0
	bge.s	loc_0AC852
	bra.s	loc_0AC8A6
loc_0AC89E:
	move.w	-$3C34(a5),d0
	addq.w	#$1,-$3C34(a5)
loc_0AC8A6:
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0AC8D4
	lea.l	g_Player1(a5),a0
	cmpa.l	a3,a0
	bne.s	loc_0AC8D4
	tst.w	g_Player1+$6A(a5)
	bgt.s	loc_0AC912
	move.w	#$A,g_Player1+$6A(a5)
	bra.s	loc_0AC900
loc_0AC8D4:
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0AC900
	lea.l	g_Player2(a5),a0
	cmpa.l	a3,a0
	bne.s	loc_0AC900
	tst.w	g_Player2+$6A(a5)
	bgt.s	loc_0AC912
	move.w	#$A,g_Player2+$6A(a5)
loc_0AC900:
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
loc_0AC912:
	movem.l	-$2A(a6),d4-d7/a3-a4
	unlk	a6
	rts
