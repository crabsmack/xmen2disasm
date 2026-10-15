; ---------------------------------------------------------------------------
; SentinelsA1_InitZapLights - SentinelsA1: set up 5 stacked light sprites (16 px apart) and their palette rows, all idle (frame -1)
; In:  none
; Out: none
; Evidence: Spr_Init on sprite slots $FFCC6A + $14*i, Map_SetRowPalette rows 1-5; counters $FFC6FE..$FFC6F6 = -1; CoreShields_FireZap restarts the chain
; ---------------------------------------------------------------------------
SentinelsA1_InitZapLights:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	lea.l	$2622(a5),a0
	movea.l	$2(a0),a4
	move.w	g_FgTilesEnd(a5),d7
	moveq	#$1,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#$2,d1
	move.l	d1,-(a7)
	moveq	#$7,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites(a5)
	jsr	$506A(a5)	; -> Spr_Init
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.w	g_FgBlockCount(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.l	g_FgBlockDefs(a5),-(a7)
	jsr	$4E12(a5)	; -> Map_SetRowPalette
	addi.w	#$10,d7
	moveq	#$1,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#$2,d1
	move.l	d1,-(a7)
	moveq	#$7,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites+$14(a5)
	jsr	$506A(a5)	; -> Spr_Init
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$2,d1
	move.l	d1,-(a7)
	move.w	g_FgBlockCount(a5),d2
	ext.l	d2
	move.l	d2,-(a7)
	move.l	g_FgBlockDefs(a5),-(a7)
	jsr	$4E12(a5)	; -> Map_SetRowPalette
	addi.w	#$10,d7
	moveq	#$1,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#$2,d1
	move.l	d1,-(a7)
	moveq	#$7,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites+$28(a5)
	jsr	$506A(a5)	; -> Spr_Init
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$3,d1
	move.l	d1,-(a7)
	move.w	g_FgBlockCount(a5),d2
	ext.l	d2
	move.l	d2,-(a7)
	move.l	g_FgBlockDefs(a5),-(a7)
	jsr	$4E12(a5)	; -> Map_SetRowPalette
	addi.w	#$10,d7
	moveq	#$1,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#$2,d1
	move.l	d1,-(a7)
	moveq	#$7,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites+$3C(a5)
	jsr	$506A(a5)	; -> Spr_Init
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$4,d1
	move.l	d1,-(a7)
	move.w	g_FgBlockCount(a5),d2
	ext.l	d2
	move.l	d2,-(a7)
	move.l	g_FgBlockDefs(a5),-(a7)
	jsr	$4E12(a5)	; -> Map_SetRowPalette
	addi.w	#$10,d7
	moveq	#$1,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#$2,d1
	move.l	d1,-(a7)
	moveq	#$7,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites+$50(a5)
	jsr	$506A(a5)	; -> Spr_Init
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$5,d1
	move.l	d1,-(a7)
	move.w	g_FgBlockCount(a5),d2
	ext.l	d2
	move.l	d2,-(a7)
	move.l	g_FgBlockDefs(a5),-(a7)
	jsr	$4E12(a5)	; -> Map_SetRowPalette
	move.w	#$FFFF,-$3B02(a5)
	move.w	#$FFFF,-$3B04(a5)
	move.w	#$FFFF,-$3B06(a5)
	move.w	#$FFFF,-$3B08(a5)
	move.w	#$FFFF,-$3B0A(a5)
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
