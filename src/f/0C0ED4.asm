; ---------------------------------------------------------------------------
; SavageJungle_ClearColor0 - Savage jungle: palette colour 0 := 0
; In:  none
; Out: none
; Evidence: g_PalBase word 0; both jungle scenes
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageJungle_ClearColor0:
	link.w	a6,#$0
	clr.w	g_PalBase(a5)
	unlk	a6
	rts
