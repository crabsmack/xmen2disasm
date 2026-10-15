; ---------------------------------------------------------------------------
; SprDef_Add - append a sprite definition to g_SpriteDefs, preloading its tiles at the VRAM tile cursor
; In:  8(a6) = sprite-def pointer   $C(a6) = word: frame
; Out: none
; Evidence: entry g_SpriteDefs + word g_SpriteDefCount(a5)*$14: Spr_Init(entry, 0, def, frame, 0, cursor g_VramTileCursor(a5), 0), Spr_PreloadToHeap(entry, cursor) -> new cursor -$3598; count -$34A2 += 1; Obj_SetSpriteDef later copies entries into objects
; ---------------------------------------------------------------------------
SprDef_Add:
	link.w	a6,#$0
	move.l	d3,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	g_VramTileCursor(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.w	$E(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.l	d0,-(a7)
	move.l	$8(a6),-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	move.w	g_SpriteDefCount(a5),d2
	ext.l	d2
	lsl.l	#$2,d2
	move.l	d2,d3
	lsl.l	#$2,d2
	add.l	d3,d2
	lea.l	g_SpriteDefs(a5),a0
	pea.l	(a0,d2.w)
	jsr	$506A(a5)	; -> Spr_Init
	move.w	g_VramTileCursor(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	g_SpriteDefCount(a5),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_SpriteDefs(a5),a0
	pea.l	(a0,d0.w)
	jsr	$505A(a5)	; -> Spr_PreloadToHeap
	move.w	d0,g_VramTileCursor(a5)
	move.w	g_SpriteDefCount(a5),d0
	addq.w	#$1,g_SpriteDefCount(a5)
	move.l	-$4(a6),d3
	unlk	a6
	rts
