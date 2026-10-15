; ---------------------------------------------------------------------------
; SpaceElev_EmptyHook2 - SpaceA1: second empty hook
; In:  none
; Out: none
; Evidence: body is link/unlk/rts; only caller SpaceElev_Setup
; ---------------------------------------------------------------------------
SpaceElev_EmptyHook2:
	link.w	a6,#$0
	unlk	a6
	rts
