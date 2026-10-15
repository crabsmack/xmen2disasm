; ---------------------------------------------------------------------------
; ToxicCan_NopStatic - empty helper called by ToxicCan_ClassInit
; In:  none
; Out: none
; Evidence: bare body
; ---------------------------------------------------------------------------
ToxicCan_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
