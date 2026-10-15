; ---------------------------------------------------------------------------
; XClone_ClassInit - per-level class setup: clear g_CloneMakerKills, the clone kill count g_CloneWaveKills and g_SceneVar3B06, then XClone_NopStatic (XCLONE override of slot +$5E ClassInit; loads no resources)
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Out: none
; Evidence: slot +$5E of the XCLONE descriptor $099C90; NOTES: 6 kills (g_CloneWaveKills) end the wave; TAS frames 49269-49271 (2 frames active)
; ---------------------------------------------------------------------------
XClone_ClassInit:
	link.w	a6,#$0
	clr.w	g_CloneMakerKills(a5)
	clr.w	g_CloneWaveKills(a5)
	clr.w	g_SceneVar3B06(a5)
	jsr	XClone_NopStatic(pc)
	unlk	a6
	rts
