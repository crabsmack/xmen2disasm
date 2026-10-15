; ---------------------------------------------------------------------------
; DropBomb_Nop6A - vtable +$6A: empty hook for DROPBOMB
; In:  8(a6) = this
; Out: none
; Evidence: slot +$6A of the DROPBOMB descriptor $082294; never runs in the corpus
; ---------------------------------------------------------------------------
DropBomb_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
