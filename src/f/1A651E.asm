; ---------------------------------------------------------------------------
; sub_1A651E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1A651E:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$4C(a4),d7
	move.b	#$1,g_CamModeSwitched(a5)
	lea.l	$4472(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	move.l	a4,-(a7)
	jsr	$4DDA(a5)	; -> Obj_UpdateBox
	movea.l	$BC(a4),a0
	move.w	$E(a0),d0
	ext.l	d0
	move.w	$4C(a4),d1
	ext.l	d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	add.l	d0,$C(a4)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	lea.l	$C(a7),a7
	beq.s	loc_1A659E
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1A6580
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1A6588
loc_1A6580:
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1A6588:
	beq.s	loc_1A65D0
	clr.w	$6C(a4)
	lea.l	sub_1A64C4(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1A65E2
loc_1A659E:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1A65B2
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1A65BA
loc_1A65B2:
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1A65BA:
	beq.s	loc_1A65D0
	clr.w	$6C(a4)
	lea.l	sub_1A646A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1A65E2
loc_1A65D0:
	clr.w	$6C(a4)
	lea.l	sub_1A6C48(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1A65E2:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
