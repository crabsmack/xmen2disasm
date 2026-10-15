; ---------------------------------------------------------------------------
; Boulder_GetSize - vtable +$06: return sizeof(BOULDER) = $BC bytes
; In:  8(a6) = class descriptor
; Out: d0 = size
; Evidence: class descriptor BOULDER slot +$06 (tools/classes.py); not reached by the TAS
; ---------------------------------------------------------------------------
Boulder_GetSize:
	link.w	a6,#$0
	move.l	#$BC,d0
	unlk	a6
	rts
