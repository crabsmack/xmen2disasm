; ---------------------------------------------------------------------------
; EvilBeast_GetSize - vtable +$06: return sizeof(EVILBEAST) = $C0 bytes
; In:  none
; Out: d0 = $C0
; Evidence: slot +$6 of the EVILBEAST descriptor $099D1E; never runs in the corpus
; ---------------------------------------------------------------------------
EvilBeast_GetSize:
	link.w	a6,#$0
	move.l	#$C0,d0
	unlk	a6
	rts
