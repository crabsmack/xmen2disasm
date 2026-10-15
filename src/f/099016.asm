; ---------------------------------------------------------------------------
; XClone_StartMakerMode - switch the CloneA? scene into clone-maker mode: reset counters, allocate the clone table, install its hooks, load the clone resources
; In:  none
; Out: none
; Evidence: clears -$3B30/-$3C40/-$3B06/-$3B08, -$3B04 = XClone_MakerBufSize() count, Mem_StackAlloc -> -$3B20; segment hooks g_SegTypeHooks[$19] (-$3406) := XClone_SegHookArenaLocked and [$1A] (-$3402) := CloneA5_SegHook16 (always 1), g_SceneFrameHook := XClone_FrameHook; CloneA2_FlickerInit; Spr_ReloadDefs(XClone_LoadResources, 1); jt 793; caller EvilMaker_StateWaitKills; TAS 52804
; Found: jt 793
; ---------------------------------------------------------------------------
XClone_StartMakerMode:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,g_SceneVar3B30(a5)
	clr.w	g_CloneWaveKills(a5)
	clr.w	g_SceneVar3B06(a5)
	clr.w	g_SceneVar3B08(a5)
	jsr	XClone_MakerBufSize(pc)
	move.w	d0,g_SceneVar3B04(a5)
	pea.l	Str_Empty_099078(pc)
	move.w	g_SceneVar3B04(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.l	d0,g_SceneVar3B20(a5)
	lea.l	XClone_SegHookArenaLocked(pc),a0
	move.l	a0,g_SegTypeHooks+$64(a5)
	lea.l	$1432(a5),a0
	move.l	a0,g_SegTypeHooks+$68(a5)
	jsr	$1312(a5)	; -> unk_CloneA5_085932
	lea.l	XClone_FrameHook(pc),a0
	move.l	a0,g_SceneFrameHook(a5)
	jsr	$1162(a5)	; -> CloneA2_FlickerInit
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	XClone_LoadResources(pc)
	jsr	$3F3A(a5)	; -> Spr_ReloadDefs
	unlk	a6
	rts
