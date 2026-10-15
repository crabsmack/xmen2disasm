; ---------------------------------------------------------------------------
; SavageA3_RunScene - scene function for 'SavageA3 Perimeter_2': set up the level (reusing the SavageA2 lights and flood), run it, stop all sounds
; In:  none
; Out: none
; Evidence: registered under that name (jt 906); SavageA2_InitLights, SavageA2_InitFlood; TAS 32058
; Found: jt 906
; ---------------------------------------------------------------------------
SavageA3_RunScene:
	link.w	a6,#$0
	jsr	SavageA3_EmptyStub1(pc)
	jsr	SavageA3_LoadLevel(pc)
	jsr	SavageA3_PlacePlayers(pc)
	jsr	SavageA3_InstallTileHooks(pc)
	jsr	$1BFA(a5)	; -> SavageA2_InitLights
	jsr	SavageA3_LoadResources(pc)
	jsr	SavageA3_EmptyStub2(pc)
	jsr	SavageA3_InitCamera(pc)
	jsr	$1C1A(a5)	; -> SavageA2_InitFlood
	jsr	SavageA3_InstallFrameHook(pc)
	jsr	$2E8A(a5)	; -> GaussBullet_InitPool
	jsr	$5002(a5)	; -> Level_Run
	jsr	$5242(a5)	; -> Snd_StopAll
	unlk	a6
	rts
