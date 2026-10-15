; ---------------------------------------------------------------------------
; VDP_ClearVsram - zero the 40 words of VSRAM
; In:  none
; Out: none
; Evidence: command $40000010 (VSRAM write 0), 40 zero words to $C00000
; ---------------------------------------------------------------------------
VDP_ClearVsram:
	move.l	#$40000010,($C00004).l
	moveq	#$0,d1
	moveq	#$27,d0
loc_1FDFDC:
	move.w	d1,($C00000).l
	dbra	d0,loc_1FDFDC
	rts
