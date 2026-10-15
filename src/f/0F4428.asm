; ---------------------------------------------------------------------------
; SentinelsB1_RunScene - scene "SentinelsB1 Exterior_3": load the level, install hooks, run the level loop
; In:  none
; Out: none
; Evidence: registered by Scene_RegisterAll (jt of sub_0F4428); sub_1FA6FE; TAS frame 5052 (girder stage, screenshots f005400-f007200)
; ---------------------------------------------------------------------------
SentinelsB1_RunScene:
	link.w	a6,#$0
	jsr	SentinelsB1_LoadLevel(pc)
	jsr	SentinelsB1_InstallHooks(pc)
	jsr	SentinelsB1_InstallSegHooks(pc)
	jsr	$5002(a5)	; -> sub_1FA6FE
	unlk	a6
	rts
