; ---------------------------------------------------------------------------
; XClone_Nop82 - XCLONE slot +$82: empty per-frame hook (XClone_Update calls it every frame; EVILBEAST overrides it)
; In:  8(a6) = this
; Out: none
; Evidence: slot +$82 of Tbl_XClone_vtable; called from XClone_Update; TAS 52267-57465
; Found: jt 716
; ---------------------------------------------------------------------------
XClone_Nop82:
	link.w	a6,#$0
	unlk	a6
	rts
