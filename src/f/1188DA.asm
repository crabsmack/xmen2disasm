; ---------------------------------------------------------------------------
; RThetaObject_GetSize - return sizeof(RTHETAOBJECT object) = $9E bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $9E
; Evidence: method 0 of class descriptor $118C8E (name string "RTHETAOBJECT", parent ACTOR)
; ---------------------------------------------------------------------------
RThetaObject_GetSize:
	link.w	a6,#$0
	move.l	#$9E,d0
	unlk	a6
	rts
