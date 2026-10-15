; ---------------------------------------------------------------------------
; XClone_Nop6A - vtable +$6A: empty hook for XCLONE (only calls the empty XClone_NopStatic)
; In:  8(a6) = this
; Out: none
; Evidence: slot +$6A of the XCLONE descriptor $099C90; never runs in the corpus
; ---------------------------------------------------------------------------
XClone_Nop6A:
	link.w	a6,#$0
	jsr	XClone_NopStatic(pc)
	unlk	a6
	rts
