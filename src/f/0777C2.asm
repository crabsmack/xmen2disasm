; ---------------------------------------------------------------------------
; LightBeam_NopStatic - empty non-virtual helper called from LIGHTBEAM's ClassInit
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
LightBeam_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
