; ---------------------------------------------------------------------------
; CapedAcolyte_GetSize - vtable +$06: return sizeof(CAPEDACOLYTE) = $B8 bytes
; In:  8(a6) = class descriptor
; Out: d0 = size
; Evidence: class descriptor CAPEDACOLYTE slot +$06 (tools/classes.py); not reached by the TAS
; ---------------------------------------------------------------------------
CapedAcolyte_GetSize:
	link.w	a6,#$0
	move.l	#$B8,d0
	unlk	a6
	rts
