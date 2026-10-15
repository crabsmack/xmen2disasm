; ---------------------------------------------------------------------------
; PerimeterDoor_ClassInit - vtable +$5E: per-level class setup for PERIMETERDOOR
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Evidence: slot +$5E of the PERIMETERDOOR descriptor $0AC3B2; TAS frames 30901-32205 (2 frames active)
; ---------------------------------------------------------------------------
PerimeterDoor_ClassInit:
	link.w	a6,#$0
	jsr	sub_0AC440(pc)
	clr.w	-$3C34(a5)
	unlk	a6
	rts
