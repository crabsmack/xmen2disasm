; ---------------------------------------------------------------------------
; Scroll_RequestColumnVs - request a full H-scroll + 40-column VSRAM upload at the next V-blank
; In:  none
; Out: none
; Evidence: clears bytes g_FgScrollDirty/g_BgScrollDirty, sets g_ColumnVsReq ($FFC7A6) = 1, consumed by VDP_UpdateScroll
; ---------------------------------------------------------------------------
Scroll_RequestColumnVs:
	link.w	a6,#$0
	clr.b	g_FgScrollDirty(a5)
	clr.b	g_BgScrollDirty(a5)
	move.b	#$1,g_ColumnVsReq(a5)
	unlk	a6
	rts
