; ---------------------------------------------------------------------------
; SpaceB1_RunScene - scene "SpaceB1 Maintenance_Shaft": load, install hooks, run the level loop
; In:  none
; Out: none
; Evidence: registered by Scene_RegisterAll (jt of sub_10778C); sub_1FA6FE; TAS frame 34816
; ---------------------------------------------------------------------------
SpaceB1_RunScene:
	link.w	a6,#$0
	jsr	SpaceB1_CallEmptyStub(pc)
	jsr	SpaceB1_LoadLevel(pc)
	jsr	SpaceB1_InstallHooks(pc)
	jsr	SpaceB1_CallEmptyStub(pc)
	jsr	$2E8A(a5)	; -> sub_1190D6
	jsr	$5002(a5)	; -> Level_Run
	unlk	a6
	rts
