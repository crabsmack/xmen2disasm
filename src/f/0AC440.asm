; ---------------------------------------------------------------------------
; PerimeterDoor_NopStatic - empty non-virtual helper (called from PerimeterDoor_ClassInit)
; Out: none
; Evidence: only caller PerimeterDoor_ClassInit; TAS 30901-32205
; Found: link-after-rts
; ---------------------------------------------------------------------------
PerimeterDoor_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
