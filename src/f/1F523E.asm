; ---------------------------------------------------------------------------
; Scroll_RequestColumnVs - request a full H-scroll + 40-column VSRAM upload at the next V-blank
; In:  none
; Out: none
; Evidence: clears bytes -$3A56/-$3A58, sets -$3A5A ($FFC7A6) = 1, consumed by VDP_UpdateScroll
; ---------------------------------------------------------------------------
Scroll_RequestColumnVs:
	link.w	a6,#$0
	clr.b	-$3A56(a5)
	clr.b	-$3A58(a5)
	move.b	#$1,-$3A5A(a5)
	unlk	a6
	rts
