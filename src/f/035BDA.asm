; ---------------------------------------------------------------------------
; MagnetoBoss_GetSize - vtable +$06: return sizeof(MAGNETOBOSS) = $B4 bytes
; In:  8(a6) = class descriptor
; Out: d0 = size
; Evidence: class descriptor MAGNETOBOSS slot +$06 (tools/classes.py); not reached by the TAS
; ---------------------------------------------------------------------------
MagnetoBoss_GetSize:
	link.w	a6,#$0
	move.l	#$B4,d0
	unlk	a6
	rts
