; ---------------------------------------------------------------------------
; BigAcolyte_GetSize - vtable +$06: return sizeof(BIGACOLYTE) = $AA bytes
; In:  8(a6) = class descriptor
; Out: d0 = size
; Evidence: class descriptor BIGACOLYTE slot +$06 (tools/classes.py); not reached by the TAS
; ---------------------------------------------------------------------------
BigAcolyte_GetSize:
	link.w	a6,#$0
	move.l	#$AA,d0
	unlk	a6
	rts
