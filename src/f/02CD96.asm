; ---------------------------------------------------------------------------
; Exodus_GetSize - vtable +$06: return sizeof(EXODUS) = $AE bytes
; In:  8(a6) = class descriptor
; Out: d0 = size
; Evidence: class descriptor EXODUS slot +$06 (tools/classes.py); not reached by the TAS
; ---------------------------------------------------------------------------
Exodus_GetSize:
	link.w	a6,#$0
	move.l	#$AE,d0
	unlk	a6
	rts
