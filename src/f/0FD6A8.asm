; ---------------------------------------------------------------------------
; SiberiaB1_RunScene - scene "SiberiaB1 Blizzard" (first stage and power-on demo): set load hooks, load, start music $27, run the level loop
; In:  none
; Out: none
; Evidence: registered by Scene_RegisterAll (jt of SiberiaB1_RunScene); g_MusicTrack = $27; TAS frame 7
; ---------------------------------------------------------------------------
SiberiaB1_RunScene:
	link.w	a6,#$0
	jsr	$5242(a5)	; -> Snd_StopAll
	moveq	#$1F,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$1F,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	jsr	SiberiaB1_CallEmptyStub(pc)
	lea.l	SiberiaB1_PreLoad(pc),a0
	move.l	a0,g_ScenePreLoadHook(a5)
	lea.l	SiberiaB1_PostLoad(pc),a0
	move.l	a0,g_ScenePostLoadHook(a5)
	jsr	SiberiaB1_LoadLevel(pc)
	jsr	SiberiaB1_InstallHooks(pc)
	jsr	SiberiaB1_CallEmptyStub(pc)
	move.b	#$1,g_BgLockToObj(a5)
	clr.b	g_PalBaseDirty(a5)
	jsr	$2322(a5)	; -> Music_SetPlayerParams
	move.w	#$27,g_MusicTrack(a5)
	moveq	#$27,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	jsr	$524A(a5)	; -> Snd_SetParam
	moveq	#$27,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$27,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	jsr	$5002(a5)	; -> Level_Run
	jsr	$2332(a5)	; -> Music_StopStage
	unlk	a6
	rts
