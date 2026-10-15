; ---------------------------------------------------------------------------
; EvilMaker_NopStatic - empty non-virtual helper (called from EVILMAKER's ClassInit/Nop6A)
; Out: none
; Evidence: only callers are EVILMAKER methods; never runs in the corpus
; ---------------------------------------------------------------------------
EvilMaker_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
