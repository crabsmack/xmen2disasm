; ---------------------------------------------------------------------------
; DropBomb_GetSize - vtable +$06: return sizeof(DROPBOMB) = $90 bytes
; In:  none
; Out: d0 = $90
; Evidence: slot +$6 of the DROPBOMB descriptor $082294; never runs in the corpus
; ---------------------------------------------------------------------------
DropBomb_GetSize:
	link.w	a6,#$0
	move.l	#$90,d0
	unlk	a6
	rts
