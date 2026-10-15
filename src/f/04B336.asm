; ---------------------------------------------------------------------------
; Apocalypse_GetSize - vtable +$06: return sizeof(APOCALYPSE) = $BA bytes
; In:  8(a6) = class descriptor
; Out: d0 = size
; Evidence: class descriptor APOCALYPSE slot +$06 (tools/classes.py); not reached by the TAS
; ---------------------------------------------------------------------------
Apocalypse_GetSize:
	link.w	a6,#$0
	move.l	#$BA,d0
	unlk	a6
	rts
