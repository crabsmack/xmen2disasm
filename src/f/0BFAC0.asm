; ---------------------------------------------------------------------------
; SwampBubbles_Nop6A - vtable +$6A: empty hook for SWAMPBUBBLES
; In:  8(a6) = this
; Out: none
; Evidence: slot +$6A of the SWAMPBUBBLES descriptor $0BFCE4; TAS frames 27881-27881 (1 frames active)
; ---------------------------------------------------------------------------
SwampBubbles_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
