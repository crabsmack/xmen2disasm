; ---------------------------------------------------------------------------
; CloneA1_InitSprites - set up the three CloneA1 sprite slots (jt $7658A frames 0-2) with their map rows
; In:  none
; Out: none
; Evidence: Spr_Init on g_SceneSprites/-$3582/-$356E at tile g_FgTilesEnd + 0/$10/$20; Map_SetRowPriority/Map_SetRowPalette on the map at g_FgBlockDefs
; ---------------------------------------------------------------------------
CloneA1_InitSprites:
	link.w	a6,#$0
	jsr	CloneA1_NopStatic(pc)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	g_FgTilesEnd(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$2,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$10A2(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites(a5)
	jsr	$506A(a5)	; -> Spr_Init
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	g_FgBlockCount(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.l	g_FgBlockDefs(a5),-(a7)
	jsr	$4E0A(a5)	; -> Map_SetRowPriority
	moveq	#$2,d0
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	move.w	g_FgBlockCount(a5),d2
	ext.l	d2
	move.l	d2,-(a7)
	move.l	g_FgBlockDefs(a5),-(a7)
	jsr	$4E12(a5)	; -> Map_SetRowPalette
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	g_FgTilesEnd(a5),d1
	ext.l	d1
	moveq	#$10,d2
	add.l	d2,d1
	move.l	d1,-(a7)
	moveq	#$2,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$10A2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	pea.l	g_SceneSprites+$14(a5)
	jsr	$506A(a5)	; -> Spr_Init
	moveq	#$2,d0
	move.l	d0,-(a7)
	move.w	g_FgBlockCount(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.l	g_FgBlockDefs(a5),-(a7)
	jsr	$4E0A(a5)	; -> Map_SetRowPriority
	moveq	#$2,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.w	g_FgBlockCount(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.l	g_FgBlockDefs(a5),-(a7)
	jsr	$4E12(a5)	; -> Map_SetRowPalette
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	g_FgTilesEnd(a5),d1
	ext.l	d1
	moveq	#$20,d2
	add.l	d2,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$2,d0
	move.l	d0,-(a7)
	lea.l	$10A2(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites+$28(a5)
	jsr	$506A(a5)	; -> Spr_Init
	unlk	a6
	rts
