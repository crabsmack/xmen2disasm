; ---------------------------------------------------------------------------
; SwampBubbles_ClassInit - per-level class setup that does nothing: only calls SwampBubbles_Nop6A (SWAMPBUBBLES override of slot +$5E ClassInit)
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Out: none
; Evidence: slot +$5E of the SWAMPBUBBLES descriptor $0BFCE4; TAS frames 27881-27881 (1 frames active)
; ---------------------------------------------------------------------------
SwampBubbles_ClassInit:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	jsr	SwampBubbles_Nop6A(pc)
	addq.w	#$4,a7
	unlk	a6
	rts
