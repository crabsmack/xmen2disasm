; ---------------------------------------------------------------------------
; SwampBubbles_GetSize - vtable +$06: return sizeof(SWAMPBUBBLES) = $9A bytes
; In:  none
; Out: d0 = $9A
; Evidence: slot +$6 of the SWAMPBUBBLES descriptor $0BFCE4; never runs in the corpus
; ---------------------------------------------------------------------------
SwampBubbles_GetSize:
	link.w	a6,#$0
	move.l	#$9A,d0
	unlk	a6
	rts
