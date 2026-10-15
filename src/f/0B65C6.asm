; ---------------------------------------------------------------------------
; SavageA4_RunScene - scene function for 'SavageA4 Chamber': boss stages, level, hooks, camera, run
; In:  none
; Out: none
; Evidence: registered under that name (jt 912); SavageA4_InitBossStages with a stack table in g_SceneVar3B14; Scroll_SetParallax($0B663A); CAMERA +$0A(SavageA4_CamSetHooks); BioBalls_AllocBallList($10); TAS 33301
; Found: jt 912
; ---------------------------------------------------------------------------
SavageA4_RunScene:
	link.w	a6,#$FFF8
	lea.l	-$8(a6),a0
	move.l	a0,g_SceneVar3B14(a5)
	jsr	$1CCA(a5)	; -> SavageA4_InitBossStages
	jsr	SavageA4_CallEmptyStub(pc)
	jsr	SavageA4_LoadLevel(pc)
	jsr	SavageA4_InstallHooks(pc)
	jsr	SavageA4_CallEmptyStub(pc)
	lea.l	$1CAA(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$5102(a5)	; -> Scroll_SetParallax
	moveq	#$0,d0
	move.l	d0,g_SceneVar3B20(a5)
	pea.l	SavageA4_CamSetHooks(pc)
	lea.l	$4DBA(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$4DBA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	move.l	d0,g_Camera(a5)
	jsr	$2E8A(a5)	; -> GaussBullet_InitPool
	moveq	#$10,d0
	move.l	d0,-(a7)
	jsr	$3382(a5)	; -> BioBalls_AllocBallList
	jsr	$5242(a5)	; -> Snd_StopAll
	jsr	$5002(a5)	; -> Level_Run
	jsr	$5242(a5)	; -> Snd_StopAll
	unlk	a6
	rts
