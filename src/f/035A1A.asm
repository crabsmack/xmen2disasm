; ---------------------------------------------------------------------------
; AvalonA4_EventZoneFree5 - scene event hook: event 3 and camera zone 5 not set -> 1
; In:  8(a6) = word event
; Out: d0 = 1/0
; Evidence: tests bit $20 of g_SceneVar3B02; hook -$3202
; ---------------------------------------------------------------------------
AvalonA4_EventZoneFree5:
	link.w	a6,#$0
	moveq	#$3,d0
	cmp.w	$A(a6),d0
	bne.s	loc_035A34
	moveq	#$20,d1
	and.w	g_SceneVar3B02(a5),d1
	seq.b	d0
	andi.w	#$1,d0
	bra.s	loc_035A36
loc_035A34:
	moveq	#$0,d0
loc_035A36:
	unlk	a6
	rts
