; ---------------------------------------------------------------------------
; SpaceElev_EmptyHook - SpaceA1 elevator stage: empty hook
; In:  none
; Out: none
; Evidence: body is link/unlk/rts; only caller SpaceElev_CallEmptyHook
; ---------------------------------------------------------------------------
SpaceElev_EmptyHook:
	link.w	a6,#$0
	unlk	a6
	rts
