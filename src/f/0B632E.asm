; ---------------------------------------------------------------------------
; SavageA4_CamUpdate - SavageA4 camera tracking function (+8): follow the players (and the object g_SceneVar3B20 when set), using the dead zones
; In:  8(a6) = camera
; Out: d0
; Evidence: same follow logic as XClone_CamArenaUpdate without the arena clamp; installed by SavageA4_CamSetHooks; TAS 33388-34594
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA4_CamUpdate:
	link.w	a6,#$FFEC
	movem.l	d3-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$3C(a4),-$10(a6)
	move.w	$3E(a4),-$E(a6)
	move.w	$40(a4),-$C(a6)
	move.w	$42(a4),-$A(a6)
	moveq	#$0,d0
	move.b	g_PlayersAlive(a5),d0
	cmpi.w	#$2,d0
	bne.s	loc_0B63D2
	move.l	g_Player1+$8(a5),d0
	cmp.l	g_Player2+$8(a5),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_0B6372
	move.l	g_Player1+$8(a5),d0
	bra.s	loc_0B6376
loc_0B6372:
	move.l	g_Player2+$8(a5),d0
loc_0B6376:
	move.l	d0,d6
	asr.l	#$8,d6
	move.l	g_Player1+$C(a5),d0
	cmp.l	g_Player2+$C(a5),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_0B638E
	move.l	g_Player1+$C(a5),d0
	bra.s	loc_0B6392
loc_0B638E:
	move.l	g_Player2+$C(a5),d0
loc_0B6392:
	move.l	d0,d5
	asr.l	#$8,d5
	move.l	g_Player1+$8(a5),d0
	cmp.l	g_Player2+$8(a5),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_0B63AA
	move.l	g_Player1+$8(a5),d0
	bra.s	loc_0B63AE
loc_0B63AA:
	move.l	g_Player2+$8(a5),d0
loc_0B63AE:
	move.l	d0,d7
	asr.l	#$8,d7
	move.l	g_Player1+$C(a5),d0
	cmp.l	g_Player2+$C(a5),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_0B63C6
	move.l	g_Player1+$C(a5),d0
	bra.s	loc_0B63CA
loc_0B63C6:
	move.l	g_Player2+$C(a5),d0
loc_0B63CA:
	move.l	d0,d4
	asr.l	#$8,d4
	bra.w	loc_0B6462
loc_0B63D2:
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0B6404
	move.l	g_Player1+$8(a5),d6
	asr.l	#$8,d6
	move.l	g_Player1+$8(a5),d7
	asr.l	#$8,d7
	move.l	g_Player1+$C(a5),d5
	asr.l	#$8,d5
	move.l	g_Player1+$C(a5),d4
	asr.l	#$8,d4
	bra.s	loc_0B6462
loc_0B6404:
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0B6436
	move.l	g_Player2+$8(a5),d6
	asr.l	#$8,d6
	move.l	g_Player2+$8(a5),d7
	asr.l	#$8,d7
	move.l	g_Player2+$C(a5),d5
	asr.l	#$8,d5
	move.l	g_Player2+$C(a5),d4
	asr.l	#$8,d4
	bra.s	loc_0B6462
loc_0B6436:
	tst.l	g_SceneVar3B20(a5)
	beq.w	loc_0B6596
	movea.l	g_SceneVar3B20(a5),a0
	move.l	$8(a0),d0
	asr.l	#$8,d0
	move.w	d0,d6
	move.w	d6,d7
	move.w	d7,-$14(a6)
	movea.l	g_SceneVar3B20(a5),a0
	move.l	$C(a0),d0
	asr.l	#$8,d0
	move.w	d0,d5
	move.w	d5,d4
	move.w	d4,-$12(a6)
loc_0B6462:
	move.w	d5,-$4(a6)
	move.w	d4,-$2(a6)
	tst.l	g_SceneVar3B20(a5)
	beq.s	loc_0B64A6
	movea.l	g_SceneVar3B20(a5),a0
	move.l	$8(a0),d4
	asr.l	#$8,d4
	move.l	$C(a0),d5
	asr.l	#$8,d5
	cmp.w	d6,d4
	sgt.b	d3
	neg.b	d3
	beq.s	loc_0B648C
	move.w	d6,d0
	bra.s	loc_0B648E
loc_0B648C:
	move.w	d4,d0
loc_0B648E:
	move.w	d0,-$8(a6)
	cmp.w	d7,d4
	slt.b	d3
	neg.b	d3
	beq.s	loc_0B649E
	move.w	d7,d0
	bra.s	loc_0B64A0
loc_0B649E:
	move.w	d4,d0
loc_0B64A0:
	move.w	d0,-$6(a6)
	bra.s	loc_0B64AE
loc_0B64A6:
	move.w	d6,-$8(a6)
	move.w	d7,-$6(a6)
loc_0B64AE:
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
	ble.s	loc_0B64F4
	ext.l	d6
	ext.l	d7
	move.l	d6,d0
	add.l	d7,d0
	asr.l	#$1,d0
	ext.l	d4
	cmp.l	d0,d4
	bge.s	loc_0B64EE
	move.w	d7,d5
	sub.w	#$70,d5
	bra.s	loc_0B64F4
loc_0B64EE:
	move.w	d6,d5
	add.w	#$70,d5
loc_0B64F4:
	moveq	#$1,d0
	and.w	$4A(a4),d0
	bne.s	loc_0B6546
	ext.l	d5
	move.w	$30(a4),d0
	ext.l	d0
	move.w	-$10(a6),d1
	ext.l	d1
	add.l	d0,d1
	cmp.l	d5,d1
	sgt.b	d3
	neg.b	d3
	beq.s	loc_0B651C
	move.w	d5,d0
	sub.w	-$10(a6),d0
	bra.s	loc_0B6542
loc_0B651C:
	ext.l	d5
	move.w	$30(a4),d0
	ext.l	d0
	move.w	-$E(a6),d1
	ext.l	d1
	add.l	d0,d1
	cmp.l	d5,d1
	slt.b	d3
	neg.b	d3
	beq.s	loc_0B653C
	move.w	d5,d0
	sub.w	-$E(a6),d0
	bra.s	loc_0B6542
loc_0B653C:
	move.w	$30(a4),d0
	ext.l	d0
loc_0B6542:
	move.w	d0,$30(a4)
loc_0B6546:
	moveq	#$2,d0
	and.w	$4A(a4),d0
	bne.s	loc_0B6596
	move.w	$32(a4),d0
	ext.l	d0
	move.w	-$A(a6),d1
	ext.l	d1
	add.l	d0,d1
	move.w	-$2(a6),d0
	ext.l	d0
	cmp.l	d0,d1
	bge.s	loc_0B6572
	move.w	-$2(a6),d0
	sub.w	-$A(a6),d0
	move.w	d0,$32(a4)
loc_0B6572:
	move.w	$32(a4),d0
	ext.l	d0
	move.w	-$C(a6),d1
	ext.l	d1
	add.l	d0,d1
	move.w	-$4(a6),d0
	ext.l	d0
	cmp.l	d0,d1
	ble.s	loc_0B6596
	move.w	-$4(a6),d0
	sub.w	-$C(a6),d0
	move.w	d0,$32(a4)
loc_0B6596:
	movem.l	-$2C(a6),d3-d7/a4
	unlk	a6
	rts
