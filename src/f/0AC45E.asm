; ---------------------------------------------------------------------------
; PerimeterDoor_ClassInit - vtable +$5E: per-level class setup for PERIMETERDOOR: reset the hit counter -$3C34
; Evidence: calls PerimeterDoor_NopStatic, -$3C34 := 0; TAS 30901-32205
; ---------------------------------------------------------------------------
PerimeterDoor_ClassInit:
	link.w	a6,#$0
	jsr	PerimeterDoor_NopStatic(pc)
	clr.w	-$3C34(a5)
	unlk	a6
	rts
