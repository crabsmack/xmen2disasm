; ---------------------------------------------------------------------------
; SwampBubbles_ClassInit - vtable +$5E: per-level class setup for SWAMPBUBBLES
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Evidence: slot +$5E of the SWAMPBUBBLES descriptor $0BFCE4; TAS frames 27881-27881 (1 frames active)
; ---------------------------------------------------------------------------
SwampBubbles_ClassInit:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	jsr	SwampBubbles_Nop6A(pc)
	addq.w	#$4,a7
	unlk	a6
	rts
