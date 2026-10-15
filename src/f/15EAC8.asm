; ---------------------------------------------------------------------------
; Actor_Nop6A - ACTOR slot +$6A: empty
; In:  none
; Out: none
; Evidence: link/unlk/rts
; ---------------------------------------------------------------------------
Actor_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
