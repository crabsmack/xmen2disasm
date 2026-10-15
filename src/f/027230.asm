; ---------------------------------------------------------------------------
; Zapper_GetSize - vtable +$06: return sizeof(ZAPPER) = $8E bytes
; In:  8(a6) = class descriptor
; Out: d0 = size
; Evidence: class descriptor ZAPPER slot +$06 (tools/classes.py); not reached by the TAS
; ---------------------------------------------------------------------------
Zapper_GetSize:
	link.w	a6,#$0
	move.l	#$8E,d0
	unlk	a6
	rts
