; ---------------------------------------------------------------------------
; Cyclops_Nop6A - CYCLOPS slot +$6A: empty Reset override
; In:  none
; Out: none
; Evidence: single rts
; ---------------------------------------------------------------------------
Cyclops_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
