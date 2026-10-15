; ---------------------------------------------------------------------------
; RetractFloor_GetSize - vtable +$06: return sizeof(RETRACTFLOOR) = $94 bytes
; In:  8(a6) = class descriptor
; Out: d0 = size
; Evidence: class descriptor RETRACTFLOOR slot +$06 (tools/classes.py); not reached by the TAS
; ---------------------------------------------------------------------------
RetractFloor_GetSize:
	link.w	a6,#$0
	move.l	#$94,d0
	unlk	a6
	rts
