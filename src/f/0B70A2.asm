; ---------------------------------------------------------------------------
; ChildShip_GetSize - vtable +$06: return sizeof(CHILDSHIP) = $AE bytes
; In:  none
; Out: d0 = $AE
; Evidence: slot +$6 of the CHILDSHIP descriptor $0B7C3A; never runs in the corpus
; ---------------------------------------------------------------------------
ChildShip_GetSize:
	link.w	a6,#$0
	move.l	#$AE,d0
	unlk	a6
	rts
