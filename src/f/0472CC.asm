; ---------------------------------------------------------------------------
; BaniMazaA2_InitDebrisBuf - register the BaniMazaA2 debris buffer (on BaniMazaA2_RunScene's stack) and mark it empty
; In:  8(a6) = buffer (4 groups of $86 bytes)
; Out: none
; Evidence: g_SceneVar3B14 = buffer; +$84 timer = 0
; ---------------------------------------------------------------------------
BaniMazaA2_InitDebrisBuf:
	link.w	a6,#$0
	movea.l	$8(a6),a0
	move.l	a0,g_SceneVar3B14(a5)
	clr.w	$84(a0)
	unlk	a6
	rts
