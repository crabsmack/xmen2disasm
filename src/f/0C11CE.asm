; ---------------------------------------------------------------------------
; SavageC1_RunScene - scene function for 'SavageC1 Jungle_1'
; In:  none
; Out: none
; Evidence: registered under that name (jt 1118); level, players, sounds $47/$51, hooks, parallax, water at $528/$520, Level_Run, Music_StopStage; TAS 27717
; Found: jt 1118
; ---------------------------------------------------------------------------
SavageC1_RunScene:
	link.w	a6,#$0
	jsr	SavageJungle_EmptyStub(pc)
	jsr	SavageC1_LoadLevel(pc)
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
	jsr	SavageC1_InstallHooks(pc)
	jsr	SavageJungle_ClearColor0(pc)
	jsr	SavageC1_SetParallax(pc)
	pea.l	($520).w
	pea.l	($528).w
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	Water_Init(pc)
	jsr	$5002(a5)	; -> Level_Run
	jsr	Music_StopStage(pc)
	unlk	a6
	rts
