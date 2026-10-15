; ---------------------------------------------------------------------------
; Beast_StateCrouch - Beast's crouch: look down after a while, turn, drop through floors, or roll with jump + direction
; In:  8(a6) = player
; Out: d0
; Evidence: like XPlayer_StateCrouch; C + Left/Right -> Beast_StartRoll; C on a thin floor -> vtable +$86 DropThrough; anything else -> control
; ---------------------------------------------------------------------------
Beast_StateCrouch:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$A6(a4)
	bgt.s	loc_183BFC
	movea.l	g_Camera(a5),a0
	moveq	#$8,d0
	and.w	$4A(a0),d0
	bne.s	loc_183BFC
	moveq	#$0,d0
	move.b	$3A(a4),d0
	cmpi.w	#$FF,d0
	bne.s	loc_183BFC
	move.l	#$200000,d0
	and.l	$90(a4),d0
	bne.s	loc_183BFC
	ori.l	#$40000,$90(a4)
	movea.l	g_Camera(a5),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$2A(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_183BFC:
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_183C60
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_183C1A
	move.w	g_PadMaskDown(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_183C22
loc_183C1A:
	move.w	g_PadMaskDown(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_183C22:
	beq.s	loc_183C60
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_183C38
	move.w	g_PadMaskB(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_183C40
loc_183C38:
	move.w	g_PadMaskB(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_183C40:
	bne.s	loc_183C60
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_183C56
	move.w	g_PadMaskA(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_183C5E
loc_183C56:
	move.w	g_PadMaskA(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_183C5E:
	beq.s	loc_183C7E
loc_183C60:
	andi.l	#$FFDFFFFF,$90(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_183E10
loc_183C7E:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_183C92
	move.w	g_PadMaskC(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_183C9A
loc_183C92:
	move.w	g_PadMaskC(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_183C9A:
	beq.w	loc_183D58
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_183CB2
	move.w	g_PadMaskLeftRight(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_183CBA
loc_183CB2:
	move.w	g_PadMaskLeftRight(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_183CBA:
	beq.s	loc_183CFE
	andi.l	#$FFDFFFFF,$90(a4)
	tst.b	$9D(a4)
	bne.s	loc_183CDA
	move.w	g_PadMaskC(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_183CE8
loc_183CDA:
	move.w	g_PadMaskC(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_183CE8:
	clr.w	$6C(a4)
	lea.l	Beast_StartRoll(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_183E10
loc_183CFE:
	movea.l	$76(a4),a0
	tst.b	$2(a0)
	ble.w	loc_183DEA
	tst.b	$9D(a4)
	bne.s	loc_183D20
	move.w	g_PadMaskC(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_183D2E
loc_183D20:
	move.w	g_PadMaskC(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_183D2E:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$86(a0),a1
	jsr	(a1)
	andi.l	#$FFDFFFFF,$90(a4)
	addq.w	#$4,a7
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_183E10
loc_183D58:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_183D6C
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_183D74
loc_183D6C:
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_183D74:
	beq.s	loc_183DA2
	tst.b	$9D(a4)
	bne.s	loc_183D8C
	move.w	g_PadMaskRight(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_183D9A
loc_183D8C:
	move.w	g_PadMaskRight(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_183D9A:
	andi.b	#$EF,$2E(a4)
	bra.s	loc_183DEA
loc_183DA2:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_183DB6
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_183DBE
loc_183DB6:
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_183DBE:
	beq.s	loc_183DEA
	tst.b	$9D(a4)
	bne.s	loc_183DD6
	move.w	g_PadMaskLeft(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_183DE4
loc_183DD6:
	move.w	g_PadMaskLeft(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_183DE4:
	ori.b	#$10,$2E(a4)
loc_183DEA:
	movea.l	$8C(a4),a0
	movea.l	a0,a1
	adda.w	$46(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	Beast_StateCrouch(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_183E10:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
