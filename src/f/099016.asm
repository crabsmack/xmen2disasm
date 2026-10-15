; ---------------------------------------------------------------------------
; XClone_StartMakerMode - switch the CloneA? scene into clone-maker mode: reset counters, allocate the clone table, install its hooks, load the clone resources
; In:  none
; Out: none
; Evidence: clears -$3B30/-$3C40/-$3B06/-$3B08, -$3B04 = sub_09989E() count, Mem_StackAlloc -> -$3B20; segment hooks g_SegTypeHooks[$19] (-$3406) := sub_099C22 and [$1A] (-$3402) := CloneA5_SegHook16 (always 1), g_SceneFrameHook := sub_09984A; CloneA2_FlickerInit; sub_15B0E6(XClone_LoadResources, 1); jt 793; caller EvilMaker_StateWaitKills; TAS 52804
; Found: jt 793
; ---------------------------------------------------------------------------
XClone_StartMakerMode:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-$3B30(a5)
	clr.w	-$3C40(a5)
	clr.w	-$3B06(a5)
	clr.w	-$3B08(a5)
	jsr	sub_09989E(pc)
	move.w	d0,-$3B04(a5)
	pea.l	Str_Empty_099078(pc)
	move.w	-$3B04(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.l	d0,-$3B20(a5)
	lea.l	sub_099C22(pc),a0
	move.l	a0,-$3406(a5)
	lea.l	$1432(a5),a0
	move.l	a0,-$3402(a5)
	jsr	$1312(a5)	; -> unk_CloneA5_085932
	lea.l	sub_09984A(pc),a0
	move.l	a0,g_SceneFrameHook(a5)
	jsr	$1162(a5)	; -> CloneA2_FlickerInit
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	XClone_LoadResources(pc)
	jsr	$3F3A(a5)	; -> sub_15B0E6
	unlk	a6
	rts
