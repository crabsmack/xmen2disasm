; ---------------------------------------------------------------------------
; Platform1_SteerByPad_UpDown - case of Platform1_SteerByPad: Down gives +speed, Up gives -speed
; In:  a3 = player, a4 = this, d7 = speed
; Out: -
; Evidence: switch target inside Platform1_SteerByPad (masks -$3BA0/-$3B9E)
; ---------------------------------------------------------------------------
Platform1_SteerByPad_UpDown:
	tst.b	$9D(a3)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1070A6
	move.w	g_PadMaskDown(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1070AE
loc_1070A6:
	move.w	g_PadMaskDown(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1070AE:
	beq.s	loc_1070B6
	move.w	d7,$16(a4)
	bra.s	loc_1070DE
loc_1070B6:
	tst.b	$9D(a3)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1070CA
	move.w	g_PadMaskUp(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1070D2
loc_1070CA:
	move.w	g_PadMaskUp(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1070D2:
	beq.s	loc_1070DE
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	move.w	d0,$16(a4)
loc_1070DE:
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
