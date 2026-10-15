; ---------------------------------------------------------------------------
; Z80_BusFree - release the Z80 bus so the Z80 runs again
; In:  none
; Out: none
; Evidence: writes 0 to $A11100
; ---------------------------------------------------------------------------
Z80_BusFree:
	move.w	#$0,($A11100).l
	rts
