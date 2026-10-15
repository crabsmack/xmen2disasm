; ---------------------------------------------------------------------------
; Scene_PreLoadReset - scene-load pre hook: clear the ten 14-byte slots at $FFE4C0 and the table set by ICandy_PoolInit, reset a few scene values
; In:  none
; Out: none
; Evidence: installed in g_ScenePreLoadHook by Game_SceneLoop, called at the start of scene load Level_Load; Explosion_ResetAll + ICandy_PoolInit(0,0,0); e4be=$7A1, e4bc=$5F, e4ba=$700 (meaning unknown)
; ---------------------------------------------------------------------------
Scene_PreLoadReset:
	link.w	a6,#$0
	jsr	$2DC2(a5)	; -> Explosion_ResetAll
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	jsr	$2E2A(a5)	; -> ICandy_PoolInit
	move.w	#$7A1,g_HScrollFreeTile(a5)
	move.w	#$5F,g_HScrollFreeCount(a5)
	move.w	#$700,g_VramTileLimit(a5)
	moveq	#$0,d0
	move.l	d0,g_BBoard(a5)
	move.l	d0,g_SyncPool(a5)
	clr.w	g_FloatFallSpeed(a5)
	unlk	a6
	rts
