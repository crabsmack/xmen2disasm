; ---------------------------------------------------------------------------
; Z80_BusRelease - give the Z80 its bus back and undo Z80_BusAcquire's frame, returning from the function that acquired it
; In:  the frame Z80_BusAcquire built in the current function: saved SR, d1/a1, old a6
; Out: SR, d1, a1, a6 restored; returns to the acquiring function's caller
; Evidence: $A11100 = 0, then pops SR, d1/a1, unlk a6, rts; reached only by jmp/bne from the Snd_* functions (Snd_SendByte, Snd_Play, Snd_StopAll...) after their ring writes
; ---------------------------------------------------------------------------
Z80_BusRelease:
	move.w	#$0,($A11100).l
	move.w	(a7)+,sr
	movem.l	(a7)+,d1/a1
	unlk	a6
	rts
