; ---------------------------------------------------------------------------
; SentinelsB1_RunScene - scene "SentinelsB1 Exterior_3": load the level, install hooks, run the level loop
; In:  none
; Out: none
; Evidence: registered by Scene_RegisterAll (jt of SentinelsB1_RunScene); Level_Run; TAS frame 5052 (girder stage, screenshots f005400-f007200)
; ---------------------------------------------------------------------------
SentinelsB1_RunScene:
	link.w	a6,#$0
	jsr	SentinelsB1_LoadLevel(pc)
	jsr	SentinelsB1_InstallHooks(pc)
	jsr	SentinelsB1_InstallSegHooks(pc)
	jsr	$5002(a5)	; -> Level_Run
	unlk	a6
	rts
