; ---------------------------------------------------------------------------
; RollingDiscs_InitStub - empty helper called from ROLLINGDISCS's Init
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
RollingDiscs_InitStub:
	link.w	a6,#$0
	unlk	a6
	rts
