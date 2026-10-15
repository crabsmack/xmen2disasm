; ---------------------------------------------------------------------------
; BaniMazaB2_RunScene - scene function for 'BaniMazaB2 Exterior': set up the stage, start music $25, run the level loop, stop the music
; In:  none
; Out: none
; Evidence: Scene_RegisterAll entry; Music_PlayStage($25) before and Music_StopStage after the level loop Level_Run (same pattern as CloneA2_RunScene)
; ---------------------------------------------------------------------------
BaniMazaB2_RunScene:
	link.w	a6,#$0
	jsr	BaniMazaB2_LoadLevel(pc)
	jsr	BaniMazaB2_InstallTileHooks(pc)
	jsr	BaniMazaB2_PlacePlayers(pc)
	jsr	BaniMazaB2_InitCamera(pc)
	jsr	BaniMazaB2_SetParallax(pc)
	jsr	BaniMazaB2_InitPalette(pc)
	jsr	BaniMazaB2_InstallFrameHook(pc)
	moveq	#$25,d0
	move.l	d0,-(a7)
	jsr	$232A(a5)	; -> Music_PlayStage
	jsr	$5002(a5)	; -> Level_Run
	jsr	$2332(a5)	; -> Music_StopStage
	unlk	a6
	rts
