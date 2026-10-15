; ---------------------------------------------------------------------------
; TrapDoor_ClassInit - does nothing: only calls the empty TrapDoor_NopStatic (this class's override of: per-level class setup for TRAPDOOR)
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Evidence: slot +$5E of the TRAPDOOR descriptor $0AD956; TAS frames 30901-32205 (2 frames active)
; ---------------------------------------------------------------------------
TrapDoor_ClassInit:
	link.w	a6,#$0
	jsr	TrapDoor_NopStatic(pc)
	unlk	a6
	rts
