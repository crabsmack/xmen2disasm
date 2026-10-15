; ---------------------------------------------------------------------------
; BubbleManager_Nop6A - vtable +$6A: empty hook for BUBBLEMANAGER
; In:  8(a6) = this
; Out: none
; Evidence: slot +$6A of the BUBBLEMANAGER descriptor $0AAFA8; TAS frames 29684-32204 (3 frames active)
; ---------------------------------------------------------------------------
BubbleManager_Nop6A:
	link.w	a6,#$0
	jsr	BubbleManager_NopStatic(pc)
	unlk	a6
	rts
