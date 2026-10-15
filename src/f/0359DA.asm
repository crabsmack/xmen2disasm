; ---------------------------------------------------------------------------
; AvalonA4_EventZoneFree3 - scene event hook: event 3 and camera zone 3 not set -> 1
; In:  8(a6) = word event
; Out: d0 = 1/0
; Evidence: tests bit 8 of -$3B02; hook -$320A
; ---------------------------------------------------------------------------
AvalonA4_EventZoneFree3:
	link.w	a6,#$0
	moveq	#$3,d0
	cmp.w	$A(a6),d0
	bne.s	loc_0359F4
	moveq	#$8,d1
	and.w	g_SceneVar3B02(a5),d1
	seq.b	d0
	andi.w	#$1,d0
	bra.s	loc_0359F6
loc_0359F4:
	moveq	#$0,d0
loc_0359F6:
	unlk	a6
	rts
