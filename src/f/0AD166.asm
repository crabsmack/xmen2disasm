; ---------------------------------------------------------------------------
; PerimeterDoor_StateDone - PERIMETERDOOR final state: empty
; In:  8(a6) = this
; Out: none
; Found: link-after-rts
; ---------------------------------------------------------------------------
PerimeterDoor_StateDone:
	link.w	a6,#$0
	unlk	a6
	rts
