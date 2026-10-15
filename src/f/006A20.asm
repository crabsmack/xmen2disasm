; ---------------------------------------------------------------------------
; Scene_AllocCommonVram - allocate VRAM tiles for the common sprite sets loaded with every scene
; In:  none
; Out: none (advances next-free-tile word -$3598)
; Evidence: saves -$3598 into -$3BB8, then Spr_Init/Spr_PreloadToHeap for one temporary and two persistent slots ($FFE9A4, $FFE798); called from Scene_PostLoadVram; what the sprite sets show is not confirmed
; ---------------------------------------------------------------------------
Scene_AllocCommonVram:
	link.w	a6,#$FFEC
	move.w	g_VramTileCursor(a5),-$3BB8(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	g_VramTileCursor(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	move.l	d0,-(a7)
	lea.l	$2C82(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	-$14(a6)
	jsr	$506A(a5)	; -> Spr_Init
	move.w	g_VramTileCursor(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	pea.l	-$14(a6)
	jsr	$505A(a5)	; -> Spr_PreloadToHeap
	move.w	d0,g_VramTileCursor(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	g_VramTileCursor(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	lea.l	$423A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	-$185C(a5)
	jsr	$506A(a5)	; -> Spr_Init
	move.w	d0,g_VramTileCursor(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	g_VramTileCursor(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	lea.l	$3D92(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	-$1A68(a5)
	jsr	$506A(a5)	; -> Spr_Init
	move.w	d0,g_VramTileCursor(a5)
	unlk	a6
	rts
