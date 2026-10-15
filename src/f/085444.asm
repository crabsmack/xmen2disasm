; ---------------------------------------------------------------------------
; Teleporter_GetSize - vtable +$06: return sizeof(TELEPORTER) = $92 bytes
; In:  none
; Out: d0 = $92
; Evidence: slot +$6 of the TELEPORTER descriptor $085380; never runs in the corpus
; ---------------------------------------------------------------------------
Teleporter_GetSize:
	link.w	a6,#$0
	move.l	#$92,d0
	unlk	a6
	rts
