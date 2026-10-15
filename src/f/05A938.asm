; ---------------------------------------------------------------------------
; BaniMazaB2_NopStatic - empty helper called by BaniMazaB2_CrackFloorHook for objects standing on a breaking floor
; In:  8(a6) = object
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
BaniMazaB2_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
