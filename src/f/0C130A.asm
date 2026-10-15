; ---------------------------------------------------------------------------
; SavageB1_RunScene - scene function for 'SavageB1 Jungle_2'
; In:  none
; Out: none
; Evidence: registered under that name (jt 1119); level, players, sounds $47/$51, music $48, palette phases, hooks, water at $282, Level_Run, Music_StopStage; TAS 29531
; Found: jt 1119
; ---------------------------------------------------------------------------
SavageB1_RunScene:
	link.w	a6,#$0
	jsr	SavageJungle_EmptyStub(pc)
	jsr	SavageB1_LoadLevel(pc)
	jsr	SavageJungle_PlacePlayers(pc)
	jsr	$5242(a5)	; -> Snd_StopAll
	moveq	#$47,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$47,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	moveq	#$51,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$51,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	moveq	#$48,d0
	move.l	d0,-(a7)
	jsr	Music_PlayStage(pc)
	jsr	$21F2(a5)	; -> SavageJungle_InitPalPhases
	jsr	SavageB1_InstallHooks(pc)
	jsr	SavageJungle_ClearColor0(pc)
	jsr	SavageB1_SetParallax(pc)
	pea.l	($282).w
	pea.l	($282).w
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	Water_Init(pc)
	jsr	$5002(a5)	; -> Level_Run
	jsr	Music_StopStage(pc)
	unlk	a6
	rts
