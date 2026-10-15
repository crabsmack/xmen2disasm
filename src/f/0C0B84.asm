; ---------------------------------------------------------------------------
; SwampFly_ClassInit - per-level class setup that does nothing: only calls SwampFly_Nop6A (SWAMPFLY override of slot +$5E ClassInit)
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Out: none
; Evidence: slot +$5E of the SWAMPFLY descriptor $0C0CEA; TAS frames 27881-29687 (2 frames active)
; ---------------------------------------------------------------------------
SwampFly_ClassInit:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	jsr	SwampFly_Nop6A(pc)
	addq.w	#$4,a7
	unlk	a6
	rts
