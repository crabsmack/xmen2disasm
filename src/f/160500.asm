; ---------------------------------------------------------------------------
; Rand_Next_Finish - Rand_Next tail: shift the output history and mask the result to 12 bits
; In:  d0 = mixed value
; Out: d0 = value & $FFF
; Evidence: -$7AA = old -$7AC, -$7AC = new value
; ---------------------------------------------------------------------------
Rand_Next_Finish:
	move.w	g_RandPrev(a5),d1
	move.w	d0,g_RandPrev(a5)
	move.w	d1,g_RandPrev2(a5)
	andi.w	#$FFF,d0
	rts
