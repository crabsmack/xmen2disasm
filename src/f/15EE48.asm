; ---------------------------------------------------------------------------
; Map_StreamRows - vertical scrolling: draw the tile rows uncovered since the last frame for plane A and (when enabled) plane B
; In:  none
; Out: none
; Evidence: drawn y $FFC734 moves 8 px per row toward camera y $FFC73C (Map_DrawRowA); plane B $FFC730 toward $FFC738 when $FFC79C and not locked ($FFC74A); skipped rows while $FFC74E
; ---------------------------------------------------------------------------
Map_StreamRows:
	movem.l	d1-d7/a1-a4,-(a7)
	movea.l	g_FgBlockMap(a5),a4
	movea.l	g_FgBlockDefs(a5),a2
	move.w	g_FgStreamX(a5),d7
	add.w	g_FgScrollAdjX(a5),d7
	asr.w	#$3,d7
	andi.w	#$3F,d7
	move.w	g_FgStreamX(a5),d4
	lsr.w	#$3,d4
	move.w	g_FgStreamY(a5),d6
	add.w	g_FgScrollAdjY(a5),d6
	asr.w	#$3,d6
	andi.w	#$1F,d6
	move.w	g_FgStreamY(a5),d5
	lsr.w	#$3,d5
	move.w	g_FgStreamY(a5),d0
	move.w	d0,d1
	sub.w	g_FgScrollY(a5),d0
	bmi.s	loc_15EEB2
	addq.w	#$7,d0
	asr.w	#$3,d1
	asr.w	#$3,d0
	cmp.w	d1,d0
	ble.s	loc_15EEAC
	move.w	d1,d0
	bra.s	loc_15EEAC
loc_15EE96:
	subq.w	#$8,g_FgStreamY(a5)
	subq.w	#$1,d5
	subq.w	#$1,d6
	andi.w	#$1F,d6
	tst.b	g_MapDrawOff(a5)
	bne.s	loc_15EEAC
	bsr.w	Map_DrawRowA
loc_15EEAC:
	dbra	d0,loc_15EE96
	bra.s	loc_15EEEA
loc_15EEB2:
	addi.w	#$20,d5
	addi.w	#$18,d0
	bpl.s	loc_15EEEA
	neg.w	d0
	asr.w	#$3,d0
	sub.w	g_FgMapExtraH(a5),d1
	neg.w	d1
	asr.w	#$3,d1
	cmp.w	d1,d0
	ble.s	loc_15EEE6
	move.w	d1,d0
	bra.s	loc_15EEE6
loc_15EED0:
	tst.b	g_MapDrawOff(a5)
	bne.s	loc_15EEDA
	bsr.w	Map_DrawRowA
loc_15EEDA:
	addq.w	#$8,g_FgStreamY(a5)
	addq.w	#$1,d5
	addq.w	#$1,d6
	andi.w	#$1F,d6
loc_15EEE6:
	dbra	d0,loc_15EED0
loc_15EEEA:
	tst.b	g_BgMapPresent(a5)
	beq.w	loc_15EF8A
	tst.b	g_BgWrapY(a5)
	bne.w	loc_15EF8A
	movea.l	g_BgBlockMap(a5),a4
	movea.l	g_BgBlockDefs(a5),a2
	move.w	g_BgStreamX(a5),d7
	add.w	g_BgScrollAdjX(a5),d7
	asr.w	#$3,d7
	andi.w	#$3F,d7
	move.w	g_BgStreamX(a5),d4
	lsr.w	#$3,d4
	move.w	g_BgStreamY(a5),d6
	add.w	g_BgScrollAdjY(a5),d6
	asr.w	#$3,d6
	andi.w	#$1F,d6
	move.w	g_BgStreamY(a5),d5
	lsr.w	#$3,d5
	move.w	g_BgStreamY(a5),d0
	move.w	d0,d1
	sub.w	g_BgScrollY(a5),d0
	bmi.s	loc_15EF60
	addq.w	#$7,d0
	asr.w	#$3,d1
	asr.w	#$3,d0
	cmp.w	d1,d0
	ble.s	loc_15EF5A
	move.w	d1,d0
	bra.s	loc_15EF5A
loc_15EF44:
	subq.w	#$8,g_BgStreamY(a5)
	subq.w	#$1,d5
	subq.w	#$1,d6
	andi.w	#$1F,d6
	tst.b	g_MapDrawOff(a5)
	bne.s	loc_15EF5A
	bsr.w	Map_DrawRowB
loc_15EF5A:
	dbra	d0,loc_15EF44
	bra.s	loc_15EF8A
loc_15EF60:
	addi.w	#$20,d5
	addi.w	#$18,d0
	bpl.s	loc_15EF8A
	neg.w	d0
	asr.w	#$3,d0
	bra.s	loc_15EF86
loc_15EF70:
	tst.b	g_MapDrawOff(a5)
	bne.s	loc_15EF7A
	bsr.w	Map_DrawRowB
loc_15EF7A:
	addq.w	#$8,g_BgStreamY(a5)
	addq.w	#$1,d5
	addq.w	#$1,d6
	andi.w	#$1F,d6
loc_15EF86:
	dbra	d0,loc_15EF70
loc_15EF8A:
	movem.l	(a7)+,d1-d7/a1-a4
	rts
