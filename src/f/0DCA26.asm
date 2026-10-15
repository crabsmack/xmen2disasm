; ---------------------------------------------------------------------------
; Barrier_NopStatic - empty non-virtual helper (called from BARRIER's ClassInit/Nop6A)
; Out: none
; Evidence: only callers are BARRIER methods; TAS frames 9712-9712 (1 frames active)
; ---------------------------------------------------------------------------
Barrier_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
