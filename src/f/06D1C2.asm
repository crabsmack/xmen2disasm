; ---------------------------------------------------------------------------
; Brood_GetSize - vtable +$06: return sizeof(BROOD) = $B6 bytes
; In:  8(a6) = class descriptor
; Out: d0 = size
; Evidence: class descriptor BROOD slot +$06 (tools/classes.py); not reached by the TAS
; ---------------------------------------------------------------------------
Brood_GetSize:
	link.w	a6,#$0
	move.l	#$B6,d0
	unlk	a6
	rts
