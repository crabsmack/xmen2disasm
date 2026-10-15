; ---------------------------------------------------------------------------
; SmallBrood_ClassInit - vtable +$5E: per-level class setup for SMALLBROOD
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Evidence: slot +$5E of the SMALLBROOD descriptor $0840FE; TAS frames 45409-49271 (3 frames active)
; ---------------------------------------------------------------------------
SmallBrood_ClassInit:
	link.w	a6,#$0
	unlk	a6
	rts
