; ---------------------------------------------------------------------------
; BubbleManager_NopStatic - empty non-virtual helper (called from BUBBLEMANAGER's ClassInit/Nop6A)
; Out: none
; Evidence: only callers are BUBBLEMANAGER methods; TAS frames 29684-32204 (3 frames active)
; ---------------------------------------------------------------------------
BubbleManager_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
