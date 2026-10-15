; ---------------------------------------------------------------------------
; Scroll_RequestVsram - request a VSRAM upload of both plane vertical scroll values at the next V-blank
; In:  none
; Out: none
; Evidence: clears bytes g_FgScrollDirty/g_BgScrollDirty, sets g_VsramReq ($FFC7A4) = 1, which VDP_UpdateScroll consumes
; ---------------------------------------------------------------------------
Scroll_RequestVsram:
	link.w	a6,#$0
	clr.b	g_FgScrollDirty(a5)
	clr.b	g_BgScrollDirty(a5)
	move.b	#$1,g_VsramReq(a5)
	unlk	a6
	rts
