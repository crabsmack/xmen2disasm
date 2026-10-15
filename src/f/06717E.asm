; ---------------------------------------------------------------------------
; ScalingActor_GetSize - vtable +$06: return sizeof(SCALINGACTOR) = $A6 bytes
; In:  8(a6) = class descriptor
; Out: d0 = size
; Evidence: class descriptor SCALINGACTOR slot +$06 (tools/classes.py); not reached by the TAS
; ---------------------------------------------------------------------------
ScalingActor_GetSize:
	link.w	a6,#$0
	move.l	#$A6,d0
	unlk	a6
	rts
