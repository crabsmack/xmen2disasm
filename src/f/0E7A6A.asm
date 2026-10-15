; ---------------------------------------------------------------------------
; SentinelsA1_RunScene - scene "SentinelsA1 CoolantCore": load the level, install hooks, run the level loop
; In:  none
; Out: none
; Evidence: registered by Scene_RegisterAll (jt of SentinelsA1_RunScene); calls Level_Run (level main loop); TAS frame 7448 once (Hologram boss room, screenshots f007800-f009000)
; ---------------------------------------------------------------------------
SentinelsA1_RunScene:
	link.w	a6,#$0
	jsr	SentinelsA1_CallEmptyStub(pc)
	jsr	SentinelsA1_LoadLevel(pc)
	jsr	SentinelsA1_InstallHooks(pc)
	jsr	SentinelsA1_CallEmptyStub(pc)
	moveq	#$0,d0
	move.l	d0,-$3B20(a5)
	jsr	$5002(a5)	; -> Level_Run
	unlk	a6
	rts
