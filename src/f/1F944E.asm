; ---------------------------------------------------------------------------
; Scene_EndAfter - end the current scene after N frames
; In:  8(a6) = word: frames
; Out: none
; Evidence: stores word g_SceneExitTimer(a5); the scene loop PlayerSelect_Run counts it down (by 2 when -$38DE is set) and leaves the scene when it reaches 0; callers pass 2 (demo end, sub_1F9DE8), 1, $C8
; ---------------------------------------------------------------------------
Scene_EndAfter:
	link.w	a6,#$0
	move.w	$A(a6),g_SceneExitTimer(a5)
	unlk	a6
	rts
