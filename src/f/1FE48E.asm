; ---------------------------------------------------------------------------
; Z80_ResetRun - pulse Z80 reset and release the bus so the freshly loaded driver starts
; In:  none
; Out: none
; Evidence: SR masked; $A11200 = 0, short delay, $A11100 = 0, $A11200 = $100; called by Snd_Init after Z80_LoadDriver
; ---------------------------------------------------------------------------
Z80_ResetRun:
	move.w	sr,-(a7)
	ori.w	#$700,sr
	move.w	#$0,($A11200).l
	moveq	#$F,d0
loc_1FE49E:
	subq.l	#$1,d0
	bne.s	loc_1FE49E
	move.w	#$0,($A11100).l
	move.w	#$100,($A11200).l
	move.w	(a7)+,sr
	rts
