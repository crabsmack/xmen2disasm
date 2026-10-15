; ---------------------------------------------------------------------------
; Tusk_LockArena - install Tusk_HookIsEvent3 as the scene hook -$321A
; In:  none
; Out: none
; Evidence: called by Tusk_StateIntro
; ---------------------------------------------------------------------------
Tusk_LockArena:
	link.w	a6,#$0
	lea.l	Tusk_HookIsEvent3(pc),a0
	move.l	a0,g_SegTypeHooks+$50(a5)
	unlk	a6
	rts
