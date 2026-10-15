; ---------------------------------------------------------------------------
; BubbleManager_GetSize - vtable +$06: return sizeof(BUBBLEMANAGER) = $A6 bytes
; In:  none
; Out: d0 = $A6
; Evidence: slot +$6 of the BUBBLEMANAGER descriptor $0AAFA8; never runs in the corpus
; ---------------------------------------------------------------------------
BubbleManager_GetSize:
	link.w	a6,#$0
	move.l	#$A6,d0
	unlk	a6
	rts
