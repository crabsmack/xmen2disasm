; ---------------------------------------------------------------------------
; EvilMaker_GetSize - vtable +$06: return sizeof(EVILMAKER) = $92 bytes
; In:  none
; Out: d0 = $92
; Evidence: slot +$6 of the EVILMAKER descriptor $094BAC; never runs in the corpus
; ---------------------------------------------------------------------------
EvilMaker_GetSize:
	link.w	a6,#$0
	move.l	#$92,d0
	unlk	a6
	rts
