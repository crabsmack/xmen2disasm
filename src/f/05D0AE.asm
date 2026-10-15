; ---------------------------------------------------------------------------
; Tuskette_GetSize - vtable +$06: return sizeof(TUSKETTE) = $A8 bytes
; In:  8(a6) = class descriptor
; Out: d0 = size
; Evidence: class descriptor TUSKETTE slot +$06 (tools/classes.py); not reached by the TAS
; ---------------------------------------------------------------------------
Tuskette_GetSize:
	link.w	a6,#$0
	move.l	#$A8,d0
	unlk	a6
	rts
