; ---------------------------------------------------------------------------
; EvilDrop_GetSize - vtable +$06: return sizeof(EVILDROP) = $C6 bytes
; In:  none
; Out: d0 = $C6
; Evidence: slot +$6 of the EVILDROP descriptor $095126; never runs in the corpus
; ---------------------------------------------------------------------------
EvilDrop_GetSize:
	link.w	a6,#$0
	move.l	#$C6,d0
	unlk	a6
	rts
