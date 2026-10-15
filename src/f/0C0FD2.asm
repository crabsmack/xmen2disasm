; ---------------------------------------------------------------------------
; Water_DrawHook - scene draw hook with hazard water: start a $24-frame splash when a player drops below the surface, hurt players in the water every 5 frames, then draw the draw list
; In:  none
; Out: none
; Evidence: installed in -$38F4; players below -$3C10 with health: slot +$26 TakeDamage(self, 7, 4, -1, -1) while -$3C14; DrawList_DrawAll; TAS 27885-33098
; Found: jt 1117
; ---------------------------------------------------------------------------
Water_DrawHook:
	link.w	a6,#$0
	tst.w	-$3C08(a5)
	bne.s	loc_0C1032
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0C1032
	move.w	-$3C10(a5),d0
	ext.l	d0
	lsl.l	#$8,d0
	cmp.l	g_Player1+$C(a5),d0
	bge.s	loc_0C1008
	tst.w	-$1740(a5)
	bgt.s	loc_0C101C
loc_0C1008:
	move.w	-$3C10(a5),d0
	ext.l	d0
	lsl.l	#$8,d0
	cmp.l	g_Player1+$C(a5),d0
	bge.s	loc_0C1032
	tst.w	-$1740(a5)
	bge.s	loc_0C1032
loc_0C101C:
	move.l	g_Player1+$8(a5),d0
	asr.l	#$8,d0
	move.w	d0,-$3C00(a5)
	move.w	-$3C12(a5),-$3C02(a5)
	move.w	#$24,-$3C08(a5)
loc_0C1032:
	tst.w	-$3C0A(a5)
	bne.s	loc_0C108E
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0C108E
	move.w	-$3C10(a5),d0
	ext.l	d0
	lsl.l	#$8,d0
	cmp.l	g_Player2+$C(a5),d0
	bge.s	loc_0C1064
	tst.w	-$1830(a5)
	bgt.s	loc_0C1078
loc_0C1064:
	move.w	-$3C10(a5),d0
	ext.l	d0
	lsl.l	#$8,d0
	cmp.l	g_Player2+$C(a5),d0
	bge.s	loc_0C108E
	tst.w	-$1830(a5)
	bge.s	loc_0C108E
loc_0C1078:
	move.l	g_Player2+$8(a5),d0
	asr.l	#$8,d0
	move.w	d0,-$3C04(a5)
	move.w	-$3C12(a5),-$3C06(a5)
	move.w	#$24,-$3C0A(a5)
loc_0C108E:
	tst.w	-$3C08(a5)
	beq.s	loc_0C10BC
	subq.w	#$1,-$3C08(a5)
	move.w	-$3C02(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	-$3C00(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	-$3C08(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	pea.l	g_Player1(a5)
	jsr	Water_DrawSplash(pc)
	lea.l	$10(a7),a7
loc_0C10BC:
	tst.w	-$3C0A(a5)
	beq.s	loc_0C10EA
	subq.w	#$1,-$3C0A(a5)
	move.w	-$3C06(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	-$3C04(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	-$3C0A(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	pea.l	g_Player2(a5)
	jsr	Water_DrawSplash(pc)
	lea.l	$10(a7),a7
loc_0C10EA:
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0C114C
	tst.w	g_Player1+$68(a5)
	ble.s	loc_0C114C
	tst.w	g_Player1+$6A(a5)
	bgt.s	loc_0C114C
	move.w	-$3C10(a5),d0
	ext.l	d0
	lsl.l	#$8,d0
	cmp.l	g_Player1+$C(a5),d0
	bge.s	loc_0C114C
	tst.b	-$3C14(a5)
	beq.s	loc_0C114C
	moveq	#-$1,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$4,d1
	move.l	d1,-(a7)
	moveq	#$7,d0
	move.l	d0,-(a7)
	pea.l	g_Player1(a5)
	pea.l	g_Player1(a5)
	movea.l	g_Player1(a5),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	move.w	#$5,g_Player1+$6A(a5)
	lea.l	$18(a7),a7
loc_0C114C:
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0C11AE
	tst.w	g_Player2+$68(a5)
	ble.s	loc_0C11AE
	tst.w	g_Player2+$6A(a5)
	bgt.s	loc_0C11AE
	move.w	-$3C10(a5),d0
	ext.l	d0
	lsl.l	#$8,d0
	cmp.l	g_Player2+$C(a5),d0
	bge.s	loc_0C11AE
	tst.b	-$3C14(a5)
	beq.s	loc_0C11AE
	moveq	#-$1,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$4,d1
	move.l	d1,-(a7)
	moveq	#$7,d0
	move.l	d0,-(a7)
	pea.l	g_Player2(a5)
	pea.l	g_Player2(a5)
	movea.l	g_Player2(a5),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	move.w	#$5,g_Player2+$6A(a5)
	lea.l	$18(a7),a7
loc_0C11AE:
	jsr	$4F82(a5)	; -> DrawList_DrawAll
	unlk	a6
	rts
