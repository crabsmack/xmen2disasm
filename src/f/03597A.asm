; ---------------------------------------------------------------------------
; AvalonA4_EventZoneFree0 - scene event hook: event 3 and camera zone 0 not set -> 1
; In:  8(a6) = word event
; Out: d0 = 1/0
; Evidence: tests bit 1 of g_SceneVar3B02; installed in -$3216 by AvalonA4_InstallEventHooks
; ---------------------------------------------------------------------------
AvalonA4_EventZoneFree0:
	link.w	a6,#$0
	moveq	#$3,d0
	cmp.w	$A(a6),d0
	bne.s	loc_035994
	moveq	#$1,d1
	and.w	g_SceneVar3B02(a5),d1
	seq.b	d0
	andi.w	#$1,d0
	bra.s	loc_035996
loc_035994:
	moveq	#$0,d0
loc_035996:
	unlk	a6
	rts
