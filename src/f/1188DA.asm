; ---------------------------------------------------------------------------
; RThetaObject_GetSize - RThetaObject: return the object size in bytes (class slot 0, +$06)
; In:  none
; Out: d0 = object size in bytes
; Evidence: method 0 of class descriptor $118C8E (name string "RTHETAOBJECT", parent ACTOR)
; ---------------------------------------------------------------------------
RThetaObject_GetSize:
	link.w	a6,#$0
	move.l	#$9E,d0
	unlk	a6
	rts
