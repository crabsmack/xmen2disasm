; ---------------------------------------------------------------------------
; EvilWolverine_GetSize - vtable +$06: return sizeof(EVILWOLVERINE) = $BA bytes
; In:  none
; Out: d0 = $BA
; Evidence: slot +$6 of the EVILWOLVERINE descriptor $09A0B4; never runs in the corpus
; ---------------------------------------------------------------------------
EvilWolverine_GetSize:
	link.w	a6,#$0
	move.l	#$BA,d0
	unlk	a6
	rts
