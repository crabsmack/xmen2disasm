; ---------------------------------------------------------------------------
; XClone_CamArenaUpdate - camera update while a clone arena is locked: follow the midpoint of the players and the clone, clamped to the arena
; In:  8(a6) = camera
; Out: d0
; Evidence: installed as camera +8 by XClone_CamSetArenaMode; uses the dead zones +$3C/+$3E/+$40/+$42 and the limits g_SceneVar3B0A..g_SceneVar3B10 (+-6); TAS 53060-57465
; Found: link-after-rts
; ---------------------------------------------------------------------------
XClone_CamArenaUpdate:
	link.w	a6,#$FFEC
	movem.l	d3-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$3C(a4),-$10(a6)
	move.w	$3E(a4),-$E(a6)
	move.w	$40(a4),-$C(a6)
	move.w	$42(a4),-$A(a6)
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.w	loc_0999B0
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0999B0
	move.l	g_Player1+$8(a5),d0
	cmp.l	g_Player2+$8(a5),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_099950
	move.l	g_Player1+$8(a5),d0
	bra.s	loc_099954
loc_099950:
	move.l	g_Player2+$8(a5),d0
loc_099954:
	move.l	d0,d6
	asr.l	#$8,d6
	move.l	g_Player1+$C(a5),d0
	cmp.l	g_Player2+$C(a5),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_09996C
	move.l	g_Player1+$C(a5),d0
	bra.s	loc_099970
loc_09996C:
	move.l	g_Player2+$C(a5),d0
loc_099970:
	move.l	d0,d5
	asr.l	#$8,d5
	move.l	g_Player1+$8(a5),d0
	cmp.l	g_Player2+$8(a5),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_099988
	move.l	g_Player1+$8(a5),d0
	bra.s	loc_09998C
loc_099988:
	move.l	g_Player2+$8(a5),d0
loc_09998C:
	move.l	d0,d7
	asr.l	#$8,d7
	move.l	g_Player1+$C(a5),d0
	cmp.l	g_Player2+$C(a5),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_0999A4
	move.l	g_Player1+$C(a5),d0
	bra.s	loc_0999A8
loc_0999A4:
	move.l	g_Player2+$C(a5),d0
loc_0999A8:
	move.l	d0,d4
	asr.l	#$8,d4
	bra.w	loc_099A40
loc_0999B0:
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0999E2
	move.l	g_Player1+$8(a5),d6
	asr.l	#$8,d6
	move.l	g_Player1+$8(a5),d7
	asr.l	#$8,d7
	move.l	g_Player1+$C(a5),d5
	asr.l	#$8,d5
	move.l	g_Player1+$C(a5),d4
	asr.l	#$8,d4
	bra.s	loc_099A40
loc_0999E2:
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_099A14
	move.l	g_Player2+$8(a5),d6
	asr.l	#$8,d6
	move.l	g_Player2+$8(a5),d7
	asr.l	#$8,d7
	move.l	g_Player2+$C(a5),d5
	asr.l	#$8,d5
	move.l	g_Player2+$C(a5),d4
	asr.l	#$8,d4
	bra.s	loc_099A40
loc_099A14:
	tst.l	g_SceneVar3B30(a5)
	beq.w	loc_099BB4
	movea.l	g_SceneVar3B30(a5),a0
	move.l	$8(a0),d0
	asr.l	#$8,d0
	move.w	d0,d6
	move.w	d6,d7
	move.w	d7,-$14(a6)
	movea.l	g_SceneVar3B30(a5),a0
	move.l	$C(a0),d0
	asr.l	#$8,d0
	move.w	d0,d5
	move.w	d5,d4
	move.w	d4,-$12(a6)
loc_099A40:
	move.w	d5,-$4(a6)
	move.w	d4,-$2(a6)
	tst.l	g_SceneVar3B30(a5)
	beq.s	loc_099A84
	movea.l	g_SceneVar3B30(a5),a0
	move.l	$8(a0),d4
	asr.l	#$8,d4
	move.l	$C(a0),d5
	asr.l	#$8,d5
	cmp.w	d6,d4
	sgt.b	d3
	neg.b	d3
	beq.s	loc_099A6A
	move.w	d6,d0
	bra.s	loc_099A6C
loc_099A6A:
	move.w	d4,d0
loc_099A6C:
	move.w	d0,-$8(a6)
	cmp.w	d7,d4
	slt.b	d3
	neg.b	d3
	beq.s	loc_099A7C
	move.w	d7,d0
	bra.s	loc_099A7E
loc_099A7C:
	move.w	d4,d0
loc_099A7E:
	move.w	d0,-$6(a6)
	bra.s	loc_099A8C
loc_099A84:
	move.w	d6,-$8(a6)
	move.w	d7,-$6(a6)
loc_099A8C:
	move.w	-$8(a6),d0
	ext.l	d0
	move.w	-$6(a6),d1
	ext.l	d1
	add.l	d0,d1
	move.l	d1,d5
	asr.l	#$1,d5
	move.w	-$6(a6),d0
	ext.l	d0
	move.w	-$8(a6),d1
	ext.l	d1
	sub.l	d1,d0
	cmpi.l	#$E0,d0
	ble.s	loc_099AD2
	ext.l	d6
	ext.l	d7
	move.l	d6,d0
	add.l	d7,d0
	asr.l	#$1,d0
	ext.l	d4
	cmp.l	d0,d4
	bge.s	loc_099ACC
	move.w	d7,d5
	sub.w	#$70,d5
	bra.s	loc_099AD2
loc_099ACC:
	move.w	d6,d5
	add.w	#$70,d5
loc_099AD2:
	moveq	#$1,d0
	and.w	$4A(a4),d0
	bne.s	loc_099B24
	ext.l	d5
	move.w	$30(a4),d0
	ext.l	d0
	move.w	-$10(a6),d1
	ext.l	d1
	add.l	d0,d1
	cmp.l	d5,d1
	sgt.b	d3
	neg.b	d3
	beq.s	loc_099AFA
	move.w	d5,d0
	sub.w	-$10(a6),d0
	bra.s	loc_099B20
loc_099AFA:
	ext.l	d5
	move.w	$30(a4),d0
	ext.l	d0
	move.w	-$E(a6),d1
	ext.l	d1
	add.l	d0,d1
	cmp.l	d5,d1
	slt.b	d3
	neg.b	d3
	beq.s	loc_099B1A
	move.w	d5,d0
	sub.w	-$E(a6),d0
	bra.s	loc_099B20
loc_099B1A:
	move.w	$30(a4),d0
	ext.l	d0
loc_099B20:
	move.w	d0,$30(a4)
loc_099B24:
	moveq	#$2,d0
	and.w	$4A(a4),d0
	bne.s	loc_099B74
	move.w	$32(a4),d0
	ext.l	d0
	move.w	-$A(a6),d1
	ext.l	d1
	add.l	d0,d1
	move.w	-$2(a6),d0
	ext.l	d0
	cmp.l	d0,d1
	bge.s	loc_099B50
	move.w	-$2(a6),d0
	sub.w	-$A(a6),d0
	move.w	d0,$32(a4)
loc_099B50:
	move.w	$32(a4),d0
	ext.l	d0
	move.w	-$C(a6),d1
	ext.l	d1
	add.l	d0,d1
	move.w	-$4(a6),d0
	ext.l	d0
	cmp.l	d0,d1
	ble.s	loc_099B74
	move.w	-$4(a6),d0
	sub.w	-$C(a6),d0
	move.w	d0,$32(a4)
loc_099B74:
	move.w	g_SceneVar3B0A(a5),d7
	addq.w	#$6,d7
	move.w	g_SceneVar3B0C(a5),d4
	addq.w	#$6,d4
	move.w	g_SceneVar3B0E(a5),d6
	subq.w	#$6,d6
	move.w	g_SceneVar3B10(a5),d5
	subq.w	#$6,d5
	cmp.w	$30(a4),d6
	bge.s	loc_099B96
	move.w	d6,$30(a4)
loc_099B96:
	cmp.w	$30(a4),d7
	ble.s	loc_099BA0
	move.w	d7,$30(a4)
loc_099BA0:
	cmp.w	$32(a4),d5
	bge.s	loc_099BAA
	move.w	d5,$32(a4)
loc_099BAA:
	cmp.w	$32(a4),d4
	ble.s	loc_099BB4
	move.w	d4,$32(a4)
loc_099BB4:
	movem.l	-$2C(a6),d3-d7/a4
	unlk	a6
	rts
