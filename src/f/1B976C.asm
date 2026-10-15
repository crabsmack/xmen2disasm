; ---------------------------------------------------------------------------
; Psylocke_Crouch - PSYLOCKE slot +$B2: crouch, facing the held direction
; In:  8(a6) = player
; Out: d0 = +4 flag 8
; Evidence: stop, Obj_ChangeAnim(char +$46), +$A6 = 60, state Psylocke_StateCrouch
; ---------------------------------------------------------------------------
Psylocke_Crouch:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$1E(a4)
	clr.w	$16(a4)
	movea.l	$8C(a4),a0
	movea.l	a0,a1
	adda.w	$46(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1B97A6
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1B97AE
loc_1B97A6:
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1B97AE:
	addq.w	#$8,a7
	beq.s	loc_1B97BA
	andi.b	#$EF,$2E(a4)
	bra.s	loc_1B97DE
loc_1B97BA:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1B97CE
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1B97D6
loc_1B97CE:
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1B97D6:
	beq.s	loc_1B97DE
	ori.b	#$10,$2E(a4)
loc_1B97DE:
	move.w	#$3C,$A6(a4)
	clr.w	$6C(a4)
	lea.l	Psylocke_StateCrouch(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
