; ---------------------------------------------------------------------------
; AvalonB2_NopStatic - empty helper called once by AvalonB2_RunScene
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
AvalonB2_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
