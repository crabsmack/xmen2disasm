; ---------------------------------------------------------------------------
; SiberiaB1_PreLoad - SiberiaB1 scene pre-load hook: set stage flags, then the standard Scene_PreLoadReset
; In:  none
; Out: none
; Evidence: installed in $FFC918 (g_ScenePreLoadHook, called first by the scene loader Level_Load)
; ---------------------------------------------------------------------------
SiberiaB1_PreLoad:
	link.w	a6,#$0
	clr.b	g_MapStreamNarrow(a5)
	move.b	#$1,g_BgNarrow(a5)
	move.b	#$1,g_SiberiaIntro(a5)
	jsr	$7A(a5)	; -> Scene_PreLoadReset
	unlk	a6
	rts
