; ---------------------------------------------------------------------------
; CloneA2_RunScene - scene function for 'CloneA2 Vertical_Corridor_1': set up the level, run it, stop the music
; In:  none
; Out: none
; Evidence: registered under that name in the scene table (sub_0054C6, jt 557); calls the CloneA2 setup functions, sub_0C1478($5F) (music $5F, writes g_MusicTrack), Level_Run (scene loop), sub_0C14B4; TAS frame 47751
; ---------------------------------------------------------------------------
CloneA2_RunScene:
	link.w	a6,#$0
	jsr	CloneA2_CallEmptyStubs(pc)
	jsr	CloneA2_LoadLevel(pc)
	jsr	CloneA2_InstallHooks(pc)
	jsr	CloneA2_StartBgPalTimer(pc)
	jsr	CloneA2_InitCamera(pc)
	jsr	CloneA2_StartCamera(pc)
	jsr	$2E8A(a5)	; -> GaussBullet_InitPool
	moveq	#$5F,d0
	move.l	d0,-(a7)
	jsr	$232A(a5)	; -> sub_0C1478
	jsr	$5002(a5)	; -> Level_Run
	jsr	$2332(a5)	; -> sub_0C14B4
	unlk	a6
	rts
