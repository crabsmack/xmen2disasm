; ---------------------------------------------------------------------------
; RollingDiscs_NopStatic - empty non-virtual helper called from ROLLINGDISCS's ClassInit
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
RollingDiscs_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
