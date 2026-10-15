; ---------------------------------------------------------------------------
; AvalonA4_EventZoneFree2 - scene event hook: event 3 and camera zone 2 not set -> 1
; In:  8(a6) = word event
; Out: d0 = 1/0
; Evidence: tests bit 4 of g_SceneVar3B02; hook -$320E
; ---------------------------------------------------------------------------
AvalonA4_EventZoneFree2:
	link.w	a6,#$0
	moveq	#$3,d0
	cmp.w	$A(a6),d0
	bne.s	loc_0359D4
	moveq	#$4,d1
	and.w	g_SceneVar3B02(a5),d1
	seq.b	d0
	andi.w	#$1,d0
	bra.s	loc_0359D6
loc_0359D4:
	moveq	#$0,d0
loc_0359D6:
	unlk	a6
	rts
