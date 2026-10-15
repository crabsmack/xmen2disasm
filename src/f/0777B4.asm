; ---------------------------------------------------------------------------
; LightBeam_GetSize - vtable +$06: return sizeof(LIGHTBEAM) = $A0 bytes
; In:  8(a6) = class descriptor
; Out: d0 = size
; Evidence: class descriptor LIGHTBEAM slot +$06 (tools/classes.py); not reached by the TAS
; ---------------------------------------------------------------------------
LightBeam_GetSize:
	link.w	a6,#$0
	move.l	#$A0,d0
	unlk	a6
	rts
