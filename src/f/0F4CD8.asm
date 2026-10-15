; ---------------------------------------------------------------------------
; SentinelsB2_RunScene - scene "SentinelsB2 Exterior_Escape": load, install hooks, run the level loop, wait for the fade, stop all sound
; In:  none
; Out: none
; Evidence: registered by Scene_RegisterAll (jt of sub_0F4CD8); TAS frame 9574 (escape after the CoolantCore)
; ---------------------------------------------------------------------------
SentinelsB2_RunScene:
	link.w	a6,#$0
	jsr	SentinelsB2_LoadLevel(pc)
	jsr	SentinelsB2_InstallHooks(pc)
	jsr	SentinelsB2_InstallSegHooks(pc)
	jsr	$5002(a5)	; -> sub_1FA6FE
	bra.s	loc_0F4CF2
loc_0F4CEE:
	jsr	$5112(a5)	; -> VDP_WaitVBlank
loc_0F4CF2:
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_0F4CEE
	jsr	$5242(a5)	; -> Snd_StopAll
	unlk	a6
	rts
