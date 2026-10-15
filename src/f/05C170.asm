; ---------------------------------------------------------------------------
; Tusk_GetSize - vtable +$06: return sizeof(TUSK) = $9C bytes
; In:  8(a6) = class descriptor
; Out: d0 = size
; Evidence: class descriptor TUSK slot +$06 (tools/classes.py); not reached by the TAS
; ---------------------------------------------------------------------------
Tusk_GetSize:
	link.w	a6,#$0
	move.l	#$9C,d0
	unlk	a6
	rts
