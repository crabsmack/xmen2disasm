; ---------------------------------------------------------------------------
; XPlayer_StateStand - standing state: idle animation (random idle variant), hold Up to look up, any action returns to control
; In:  8(a6) = player
; Out: d0
; Evidence: XPlayer_ActionPressed or airborne -> control (re-latch direction); Up held with the +$A6 timer -> XPlayer_StartLookUp; anim ended -> Rand_Next > char +$26 ? anim char +$44 : char +$42
; ---------------------------------------------------------------------------
XPlayer_StateStand:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	XPlayer_ActionPressed(pc)
	tst.b	d0
	addq.w	#$4,a7
	bne.s	loc_1F385E
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.w	loc_1F38F2
loc_1F385E:
	andi.l	#$FFBFFFFF,$90(a4)
	andi.l	#$FFDFFFFF,$90(a4)
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F3882
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1F388A
loc_1F3882:
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1F388A:
	beq.s	loc_1F38A6
	tst.b	$9D(a4)
	bne.s	loc_1F389C
	move.w	g_PadMaskRight(a5),d0
	or.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1F38DC
loc_1F389C:
	move.w	g_PadMaskRight(a5),d0
	or.w	d0,g_Pad2Latch(a5)
	bra.s	loc_1F38DC
loc_1F38A6:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F38BA
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1F38C2
loc_1F38BA:
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1F38C2:
	beq.s	loc_1F38DC
	tst.b	$9D(a4)
	bne.s	loc_1F38D4
	move.w	g_PadMaskLeft(a5),d0
	or.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1F38DC
loc_1F38D4:
	move.w	g_PadMaskLeft(a5),d0
	or.w	d0,g_Pad2Latch(a5)
loc_1F38DC:
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1F39BA
loc_1F38F2:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F3906
	move.w	g_PadMaskUp(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1F390E
loc_1F3906:
	move.w	g_PadMaskUp(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1F390E:
	beq.s	loc_1F3950
	moveq	#$3,d0
	cmp.w	$A6(a4),d0
	ble.s	loc_1F3950
	tst.w	$A6(a4)
	ble.s	loc_1F394A
	movea.l	g_Camera(a5),a0
	moveq	#$4,d0
	and.w	$4A(a0),d0
	bne.s	loc_1F394A
	move.l	#$400000,d0
	and.l	$90(a4),d0
	bne.s	loc_1F394A
	clr.w	$6C(a4)
	lea.l	XPlayer_StartLookUp(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1F39BA
loc_1F394A:
	move.w	#$32,$A6(a4)
loc_1F3950:
	tst.l	$44(a4)
	beq.s	loc_1F396A
	clr.w	$6C(a4)
	lea.l	XPlayer_StateStand(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1F39BA
loc_1F396A:
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	tst.l	d1
	movea.l	$8C(a4),a0
	move.w	$26(a0),d0
	ext.l	d0
	cmp.l	d1,d0
	bge.s	loc_1F3994
	movea.l	a0,a1
	adda.w	$44(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	bra.s	loc_1F39A8
loc_1F3994:
	movea.l	$8C(a4),a0
	movea.l	a0,a1
	adda.w	$42(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
loc_1F39A8:
	clr.w	$6C(a4)
	lea.l	XPlayer_StateStand(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1F39BA:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
