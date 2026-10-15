; ---------------------------------------------------------------------------
; PerimeterDoor_ClassInit - vtable +$5E: per-level class setup for PERIMETERDOOR: reset the hit counter g_PerimeterDoorHits
; Evidence: calls PerimeterDoor_NopStatic, g_PerimeterDoorHits := 0; TAS 30901-32205
; ---------------------------------------------------------------------------
PerimeterDoor_ClassInit:
	link.w	a6,#$0
	jsr	PerimeterDoor_NopStatic(pc)
	clr.w	g_PerimeterDoorHits(a5)
	unlk	a6
	rts
