; ---------------------------------------------------------------------------
; XClone_NopStatic - empty non-virtual helper (called from XCLONE's ClassInit/Nop6A)
; Out: none
; Evidence: only callers are XCLONE methods; TAS frames 49269-49271 (2 frames active)
; ---------------------------------------------------------------------------
XClone_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
