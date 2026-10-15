; ---------------------------------------------------------------------------
; EvilMagneto_GetSize - vtable +$06: return sizeof(EVILMAGNETO) = $BC bytes
; In:  none
; Out: d0 = $BC
; Evidence: slot +$6 of the EVILMAGNETO descriptor $099EF6; never runs in the corpus
; ---------------------------------------------------------------------------
EvilMagneto_GetSize:
	link.w	a6,#$0
	move.l	#$BC,d0
	unlk	a6
	rts
