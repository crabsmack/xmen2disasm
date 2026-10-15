; ---------------------------------------------------------------------------
; Barbarian_GetSize - vtable +$06: return sizeof(BARBARIAN) = $C2 bytes
; In:  none
; Out: d0 = $C2
; Evidence: slot +$6 of the BARBARIAN descriptor $0BE74E; never runs in the corpus
; ---------------------------------------------------------------------------
Barbarian_GetSize:
	link.w	a6,#$0
	move.l	#$C2,d0
	unlk	a6
	rts
