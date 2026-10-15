; ---------------------------------------------------------------------------
; ThronePhone_GetSize - vtable +$06: return sizeof(THRONEPHONE) = $A8 bytes
; In:  8(a6) = class descriptor
; Out: d0 = size
; Evidence: class descriptor THRONEPHONE slot +$06 (tools/classes.py); not reached by the TAS
; ---------------------------------------------------------------------------
ThronePhone_GetSize:
	link.w	a6,#$0
	move.l	#$A8,d0
	unlk	a6
	rts
