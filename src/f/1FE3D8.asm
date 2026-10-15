; ---------------------------------------------------------------------------
; Z80_BusRequest - request the Z80 bus and spin until it is granted (no SR change)
; In:  none
; Out: none (Z80 stopped)
; Evidence: writes $100 to $A11100 and polls bit 0 until clear; paired with Z80_BusFree (Z80_DriverResume, Snd_ReadDriverByte, Pad_Get)
; ---------------------------------------------------------------------------
Z80_BusRequest:
	move.w	#$100,($A11100).l
loc_1FE3E0:
	btst	#$0,($A11100).l
	bne.s	loc_1FE3E0
	rts
