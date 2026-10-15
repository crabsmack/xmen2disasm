; ---------------------------------------------------------------------------
; AvalonA4_EventZoneFree4 - scene event hook: event 3 and camera zone 4 not set -> 1
; In:  8(a6) = word event
; Out: d0 = 1/0
; Evidence: tests bit $10 of -$3B02; hook -$3206
; ---------------------------------------------------------------------------
AvalonA4_EventZoneFree4:
	link.w	a6,#$0
	moveq	#$3,d0
	cmp.w	$A(a6),d0
	bne.s	loc_035A14
	moveq	#$10,d1
	and.w	-$3B02(a5),d1
	seq.b	d0
	andi.w	#$1,d0
	bra.s	loc_035A16
loc_035A14:
	moveq	#$0,d0
loc_035A16:
	unlk	a6
	rts
