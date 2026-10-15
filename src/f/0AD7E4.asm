; ---------------------------------------------------------------------------
; SavageA2_InitFlood - SavageA2: start the flood line below the bottom camera limit and install its raster hook
; In:  none
; Out: none
; Evidence: level = (max y + $E0) << 8; Water_Init(3, level+1, level+1); -$38F4 := Water_DrawHook; jt 895
; Found: jt 895
; ---------------------------------------------------------------------------
SavageA2_InitFlood:
	link.w	a6,#$0
	move.w	g_CamMaxY(a5),d0
	ext.l	d0
	add.l	#$E0,d0
	lsl.l	#$8,d0
	move.l	d0,g_FloodY88(a5)
	asr.l	#$8,d0
	move.w	d0,g_FloodLineY(a5)
	ext.l	d0
	addq.l	#$1,d0
	move.l	d0,-(a7)
	move.w	g_FloodLineY(a5),d0
	ext.l	d0
	addq.l	#$1,d0
	move.l	d0,-(a7)
	moveq	#$3,d0
	move.l	d0,-(a7)
	jsr	$2302(a5)	; -> Water_Init
	lea.l	$230A(a5),a0
	move.l	a0,g_SceneDrawHook(a5)
	unlk	a6
	rts
