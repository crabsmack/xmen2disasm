; ---------------------------------------------------------------------------
; AvalonA4_InstallEventHooks - clear the camera zone bits and install the six AvalonA4 event hooks
; In:  none
; Out: none
; Evidence: g_SceneVar3B02 = 0; -$3216..-$3202 = AvalonA4_EventZoneFree0..5
; ---------------------------------------------------------------------------
AvalonA4_InstallEventHooks:
	link.w	a6,#$0
	clr.w	g_SceneVar3B02(a5)
	lea.l	AvalonA4_EventZoneFree0(pc),a0
	move.l	a0,g_SegTypeHooks+$54(a5)
	lea.l	AvalonA4_EventZoneFree1(pc),a0
	move.l	a0,g_SegTypeHooks+$58(a5)
	lea.l	AvalonA4_EventZoneFree2(pc),a0
	move.l	a0,g_SegTypeHooks+$5C(a5)
	lea.l	AvalonA4_EventZoneFree3(pc),a0
	move.l	a0,-$340A(a5)
	lea.l	AvalonA4_EventZoneFree4(pc),a0
	move.l	a0,g_SegTypeHooks+$64(a5)
	lea.l	AvalonA4_EventZoneFree5(pc),a0
	move.l	a0,g_SegTypeHooks+$68(a5)
	unlk	a6
	rts
