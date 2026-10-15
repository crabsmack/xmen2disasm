; ---------------------------------------------------------------------------
; BanimazaDoor_GetSize - vtable +$06: return sizeof(BANIMAZADOOR) = $A2 bytes
; In:  8(a6) = class descriptor
; Out: d0 = size
; Evidence: class descriptor BANIMAZADOOR slot +$06 (tools/classes.py); not reached by the TAS
; ---------------------------------------------------------------------------
BanimazaDoor_GetSize:
	link.w	a6,#$0
	move.l	#$A2,d0
	unlk	a6
	rts
