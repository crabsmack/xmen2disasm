; ---------------------------------------------------------------------------
; TrapDoor_NopStatic - empty non-virtual helper (called from TrapDoor_ClassInit)
; Out: none
; Found: link-after-rts
; ---------------------------------------------------------------------------
TrapDoor_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
