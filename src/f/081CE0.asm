; ---------------------------------------------------------------------------
; CloneA2_StartQuake - start the CloneA2 earthquake: camera shake script + rumble sound $91, once
; In:  none
; Out: none
; Evidence: g_CamShake := Tbl_CloneA2QuakeScript, Snd_Stop/Snd_Play $91, g_SceneVar3B08 := 1 (fired flag); called from CloneA2_FrameHook when the current camera zone's trigger point is on screen
; ---------------------------------------------------------------------------
CloneA2_StartQuake:
	link.w	a6,#$0
	lea.l	$115A(a5),a0
	move.l	$2(a0),g_CamShake(a5)
	pea.l	($91).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($91).w
	jsr	$521A(a5)	; -> Snd_Play
	move.w	#$1,g_SceneVar3B08(a5)
	unlk	a6
	rts
