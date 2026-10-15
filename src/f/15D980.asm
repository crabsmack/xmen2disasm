; ---------------------------------------------------------------------------
; Actor_Nop62 - ACTOR slot +$62: empty
; In:  none
; Out: none
; Evidence: link/unlk/rts; ClassList_CallSlot62 calls this slot per class at scene end
; ---------------------------------------------------------------------------
Actor_Nop62:
	link.w	a6,#$0
	unlk	a6
	rts
