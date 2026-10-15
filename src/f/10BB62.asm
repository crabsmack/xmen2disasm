; ---------------------------------------------------------------------------
; SpaceElev_CallEmptyHook - SpaceA1 elevator stage: first init step, calls an empty hook
; In:  none
; Out: none
; Evidence: only caller SpaceElev_Main
; ---------------------------------------------------------------------------
SpaceElev_CallEmptyHook:
	link.w	a6,#$0
	jsr	SpaceElev_EmptyHook(pc)
	unlk	a6
	rts
