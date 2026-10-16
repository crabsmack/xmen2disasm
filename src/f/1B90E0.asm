; ---------------------------------------------------------------------------
; Psylocke_CrouchCombo2 - second hit of Psylocke's crouching attack combo
; In:  8(a6) = player
; Out: none
; Evidence: sound $92, +$6E = 0, face the held direction, clear B latch, animation (Tbl_PsylockeAnim4_2, jt $4582), delay $FF, next XPlayer_CrouchAttackRecover
; ---------------------------------------------------------------------------
Psylocke_CrouchCombo2:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($92).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($92).w
	jsr	$521A(a5)	; -> Snd_Play
	clr.w	$6E(a4)
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1B9114
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1B911C
loc_1B9114:
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1B911C:
	addq.w	#$8,a7
	beq.s	loc_1B9128
	ori.b	#$10,$2E(a4)
	bra.s	loc_1B914C
loc_1B9128:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1B913C
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1B9144
loc_1B913C:
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1B9144:
	beq.s	loc_1B914C
	andi.b	#$EF,$2E(a4)
loc_1B914C:
	tst.b	$9D(a4)
	bne.s	loc_1B9162
	move.w	g_PadMaskB(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1B9170
loc_1B9162:
	move.w	g_PadMaskB(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1B9170:
	lea.l	$4582(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	$4CD2(a5),a0
	move.l	a0,$5C(a4)
	move.w	#$FF,$6C(a4)
	addq.w	#$8,a7
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
