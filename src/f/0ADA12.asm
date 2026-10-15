; ---------------------------------------------------------------------------
; TrapDoor_ClassInit - vtable +$5E: per-level class setup for TRAPDOOR
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Evidence: slot +$5E of the TRAPDOOR descriptor $0AD956; TAS frames 30901-32205 (2 frames active)
; ---------------------------------------------------------------------------
TrapDoor_ClassInit:
	link.w	a6,#$0
	jsr	sub_0AD9F4(pc)
	unlk	a6
	rts
