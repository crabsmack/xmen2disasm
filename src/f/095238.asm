; ---------------------------------------------------------------------------
; XClone_ClassInit - vtable +$5E: per-level class setup for XCLONE
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Evidence: slot +$5E of the XCLONE descriptor $099C90; TAS frames 49269-49271 (2 frames active)
; ---------------------------------------------------------------------------
XClone_ClassInit:
	link.w	a6,#$0
	clr.w	-$3C3C(a5)
	clr.w	-$3C40(a5)
	clr.w	-$3B06(a5)
	jsr	XClone_NopStatic(pc)
	unlk	a6
	rts
