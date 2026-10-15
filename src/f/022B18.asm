; ---------------------------------------------------------------------------
; AvalonA2_HookReturn0 - scene hook in -$321A that always returns 0
; In:  none
; Out: d0 = 0
; Evidence: installed by AvalonA2_InstallEventHooks
; ---------------------------------------------------------------------------
AvalonA2_HookReturn0:
	link.w	a6,#$0
	moveq	#$3,d0
	cmp.w	$A(a6),d0
	bne.s	loc_022B28
	moveq	#$0,d0
	bra.s	loc_022B2A
loc_022B28:
	moveq	#$0,d0
loc_022B2A:
	unlk	a6
	rts
