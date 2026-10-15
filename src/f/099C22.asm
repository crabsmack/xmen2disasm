; ---------------------------------------------------------------------------
; XClone_SegHookArenaLocked - floor-segment hook for type $19: solid only while a clone arena is locked (g_SceneVar3B08 bit 0)
; Out: d0 = g_SceneVar3B08 & 1
; Evidence: installed in g_SegTypeHooks[$19] by XClone_StartMakerMode; TAS 52808-57383
; Found: link-after-rts
; ---------------------------------------------------------------------------
XClone_SegHookArenaLocked:
	link.w	a6,#$0
	moveq	#$1,d1
	and.w	g_SceneVar3B08(a5),d1
	seq.b	d0
	andi.w	#$1,d0
	unlk	a6
	rts
