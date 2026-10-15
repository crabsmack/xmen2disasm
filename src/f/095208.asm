; ---------------------------------------------------------------------------
; XClone_GetSize - vtable +$06: return sizeof(XCLONE) = $BA bytes
; In:  none
; Out: d0 = $BA
; Evidence: slot +$6 of the XCLONE descriptor $099C90; never runs in the corpus
; ---------------------------------------------------------------------------
XClone_GetSize:
	link.w	a6,#$0
	move.l	#$BA,d0
	unlk	a6
	rts
