; ---------------------------------------------------------------------------
; SavageA2_RunScene - scene function for 'SavageA2 Perimeter_1': set up the level, run it, stop all sounds
; In:  none
; Out: none
; Evidence: registered under that name (jt 896); calls the SavageA2 setup functions, GaussBullet_InitPool, Level_Run, Snd_StopAll; TAS 30752
; Found: jt 896
; ---------------------------------------------------------------------------
SavageA2_RunScene:
	link.w	a6,#$0
	jsr	SavageA2_EmptyStub1(pc)
	jsr	SavageA2_LoadLevel(pc)
	jsr	SavageA2_PlacePlayers(pc)
	jsr	SavageA2_LoadResources(pc)
	jsr	SavageA2_InstallTileHooks(pc)
	jsr	SavageA2_InitLights(pc)
	jsr	SavageA2_EmptyStub2(pc)
	jsr	SavageA2_InitCamera(pc)
	jsr	SavageA2_InitFlood(pc)
	jsr	SavageA2_InstallFrameHook(pc)
	jsr	$2E8A(a5)	; -> GaussBullet_InitPool
	jsr	$5002(a5)	; -> Level_Run
	jsr	$5242(a5)	; -> Snd_StopAll
	unlk	a6
	rts
