; ---------------------------------------------------------------------------
; TrapDoor_GetSize - vtable +$06: return sizeof(TRAPDOOR) = $A0 bytes
; In:  none
; Out: d0 = $A0
; Evidence: slot +$6 of the TRAPDOOR descriptor $0AD956; never runs in the corpus
; ---------------------------------------------------------------------------
TrapDoor_GetSize:
	link.w	a6,#$0
	move.l	#$A0,d0
	unlk	a6
	rts
