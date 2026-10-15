; ---------------------------------------------------------------------------
; AvalonA2_InstallEventHooks - install AvalonA2's two scene hooks at -$341A/-$3416 ($FFCDE6/$FFCDEA)
; In:  none
; Out: none
; Evidence: AvalonA2_HookReturn0 -> -$341A, AvalonA2_HookEndOnEvent3 -> -$3416
; ---------------------------------------------------------------------------
AvalonA2_InstallEventHooks:
	link.w	a6,#$0
	lea.l	AvalonA2_HookReturn0(pc),a0
	move.l	a0,-$341A(a5)
	lea.l	AvalonA2_HookEndOnEvent3(pc),a0
	move.l	a0,-$3416(a5)
	unlk	a6
	rts
