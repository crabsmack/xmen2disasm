; ---------------------------------------------------------------------------
; BoxInputActor_GetSize - vtable +$06: return sizeof(BOXINPUTACTOR) = $90 bytes
; In:  8(a6) = class descriptor
; Out: d0 = size
; Evidence: class descriptor BOXINPUTACTOR slot +$06 (tools/classes.py); not reached by the TAS
; ---------------------------------------------------------------------------
BoxInputActor_GetSize:
	link.w	a6,#$0
	move.l	#$90,d0
	unlk	a6
	rts
