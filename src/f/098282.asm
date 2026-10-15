; ---------------------------------------------------------------------------
; EvilCyclops_GetSize - vtable +$06: return sizeof(EVILCYCLOPS) = $BA bytes
; In:  none
; Out: d0 = $BA
; Evidence: slot +$6 of the EVILCYCLOPS descriptor $099DD2; never runs in the corpus
; ---------------------------------------------------------------------------
EvilCyclops_GetSize:
	link.w	a6,#$0
	move.l	#$BA,d0
	unlk	a6
	rts
