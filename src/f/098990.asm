; ---------------------------------------------------------------------------
; EvilPsylocke_GetSize - vtable +$06: return sizeof(EVILPSYLOCKE) = $BA bytes
; In:  none
; Out: d0 = $BA
; Evidence: slot +$6 of the EVILPSYLOCKE descriptor $09A020; never runs in the corpus
; ---------------------------------------------------------------------------
EvilPsylocke_GetSize:
	link.w	a6,#$0
	move.l	#$BA,d0
	unlk	a6
	rts
