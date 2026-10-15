; ---------------------------------------------------------------------------
; EvilGambit_GetSize - vtable +$06: return sizeof(EVILGAMBIT) = $BA bytes
; In:  none
; Out: d0 = $BA
; Evidence: slot +$6 of the EVILGAMBIT descriptor $099E64; never runs in the corpus
; ---------------------------------------------------------------------------
EvilGambit_GetSize:
	link.w	a6,#$0
	move.l	#$BA,d0
	unlk	a6
	rts
