; ---------------------------------------------------------------------------
; YoyoAcolyte_GetSize - vtable +$06: return sizeof(YOYOACOLYTE) = $BA bytes
; In:  8(a6) = class descriptor
; Out: d0 = size
; Evidence: class descriptor YOYOACOLYTE slot +$06 (tools/classes.py); not reached by the TAS
; ---------------------------------------------------------------------------
YoyoAcolyte_GetSize:
	link.w	a6,#$0
	move.l	#$BA,d0
	unlk	a6
	rts
