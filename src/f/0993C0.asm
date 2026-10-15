; ---------------------------------------------------------------------------
; XClone_EndWave - end the clone wave: collapse effects and end the scene after 600 frames
; In:  none
; Out: none
; Evidence: -$3894 := 0, g_SceneFrameHook := XClone_FrameHookCollapse, Scene_EndAfter(600) (scene exit timer); caller XClone_Kill when -$3C40 > 5
; Found: link-after-rts
; ---------------------------------------------------------------------------
XClone_EndWave:
	link.w	a6,#$0
	clr.b	-$3894(a5)
	lea.l	XClone_FrameHookCollapse(pc),a0
	move.l	a0,g_SceneFrameHook(a5)
	pea.l	($258).w
	jsr	$4F8A(a5)	; -> Scene_EndAfter
	unlk	a6
	rts
