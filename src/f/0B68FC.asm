; ---------------------------------------------------------------------------
; BrainChild_GetSize - vtable +$06: return sizeof(BRAINCHILD) = $A6 bytes
; In:  none
; Out: d0 = $A6
; Evidence: slot +$6 of the BRAINCHILD descriptor $0B7BAC; never runs in the corpus
; ---------------------------------------------------------------------------
BrainChild_GetSize:
	link.w	a6,#$0
	move.l	#$A6,d0
	unlk	a6
	rts
