; ---------------------------------------------------------------------------
; AvalonA4_InstallEventHooks - clear the camera zone bits and install the six AvalonA4 event hooks
; In:  none
; Out: none
; Evidence: -$3B02 = 0; -$3216..-$3202 = AvalonA4_EventZoneFree0..5
; ---------------------------------------------------------------------------
AvalonA4_InstallEventHooks:
	link.w	a6,#$0
	clr.w	-$3B02(a5)
	lea.l	AvalonA4_EventZoneFree0(pc),a0
	move.l	a0,-$3416(a5)
	lea.l	AvalonA4_EventZoneFree1(pc),a0
	move.l	a0,-$3412(a5)
	lea.l	AvalonA4_EventZoneFree2(pc),a0
	move.l	a0,-$340E(a5)
	lea.l	AvalonA4_EventZoneFree3(pc),a0
	move.l	a0,-$340A(a5)
	lea.l	AvalonA4_EventZoneFree4(pc),a0
	move.l	a0,-$3406(a5)
	lea.l	AvalonA4_EventZoneFree5(pc),a0
	move.l	a0,-$3402(a5)
	unlk	a6
	rts
