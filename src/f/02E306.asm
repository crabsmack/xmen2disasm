; ---------------------------------------------------------------------------
; ExodusBlast_NopStatic - empty non-virtual helper called from EXODUSBLAST's ClassInit
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
ExodusBlast_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
