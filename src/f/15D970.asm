; ---------------------------------------------------------------------------
; Actor_Nop5A - ACTOR slot +$5A: empty
; In:  none
; Out: none
; Evidence: link/unlk/rts; ClassList_CallSlot5A calls this slot per class
; ---------------------------------------------------------------------------
Actor_Nop5A:
	link.w	a6,#$0
	unlk	a6
	rts
