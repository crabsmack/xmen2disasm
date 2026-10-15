; ---------------------------------------------------------------------------
; Psylocke_GroundAttackDown - PSYLOCKE slot +$DA: Down+B: crouching kick combo (first hit)
; In:  8(a6) = player
; Out: d0 = +4 flag 8
; Evidence: sound $92, stop, clear B latch, +$6E = $18 combo window, animation (jt $8EF8 thunk), state Psylocke_StateCrouchCombo
; ---------------------------------------------------------------------------
Psylocke_GroundAttackDown:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($92).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($92).w
	jsr	$521A(a5)	; -> Snd_Play
	clr.w	$1E(a4)
	clr.w	$16(a4)
	tst.b	$9D(a4)
	addq.w	#$8,a7
	bne.s	loc_1B9282
	move.w	g_PadMaskB(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1B9290
loc_1B9282:
	move.w	g_PadMaskB(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1B9290:
	move.w	#$18,$6E(a4)
	lea.l	$457A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	Psylocke_StateCrouchCombo(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
