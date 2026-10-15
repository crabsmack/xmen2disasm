; ---------------------------------------------------------------------------
; Magneto_AirSteer - MAGNETO slot +$8A: air control; A toggles levitation (hover animation and damping) instead of falling
; In:  8(a6) = player
; Out: none
; Evidence: A latched -> hover animation (jt $487A data); while hovering Magneto_HoverDamp(1,1); else gravity: Down 70, C held or rising char +$E, falling char +$C; Left/Right steering after +$6E; vtable +$7E
; ---------------------------------------------------------------------------
Magneto_AirSteer:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CDB52
	move.w	g_PadMaskA(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1CDB5A
loc_1CDB52:
	move.w	g_PadMaskA(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1CDB5A:
	beq.s	loc_1CDB9E
	tst.b	$9D(a4)
	bne.s	loc_1CDB72
	move.w	g_PadMaskA(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1CDB80
loc_1CDB72:
	move.w	g_PadMaskA(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1CDB80:
	lea.l	$467A(a5),a0
	move.l	$44(a4),d0
	cmp.l	$2(a0),d0
	beq.s	loc_1CDBC0
	lea.l	$467A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
loc_1CDB9E:
	lea.l	$467A(a5),a0
	move.l	$44(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_1CDBC0
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	Magneto_HoverDamp(pc)
	lea.l	$C(a7),a7
	bra.w	loc_1CDCDE
loc_1CDBC0:
	moveq	#$0,d0
	move.l	d0,$44(a4)
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CDBDA
	move.w	g_PadMaskDown(a5),d1
	and.w	g_Pad1Held(a5),d1
	bra.s	loc_1CDBE4
loc_1CDBDA:
	move.w	g_PadMaskDown(a5),d0
	and.w	g_Pad2Held(a5),d0
	move.w	d0,d1
loc_1CDBE4:
	beq.s	loc_1CDBEE
	move.w	#$46,$20(a4)
	bra.s	loc_1CDC28
loc_1CDBEE:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CDC02
	move.w	g_PadMaskC(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CDC0A
loc_1CDC02:
	move.w	g_PadMaskC(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CDC0A:
	bne.s	loc_1CDC12
	tst.w	$18(a4)
	ble.s	loc_1CDC1E
loc_1CDC12:
	movea.l	$8C(a4),a0
	move.w	$E(a0),$20(a4)
	bra.s	loc_1CDC28
loc_1CDC1E:
	movea.l	$8C(a4),a0
	move.w	$C(a0),$20(a4)
loc_1CDC28:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CDC3C
	move.w	g_PadMaskLeftRight(a5),d0
	and.w	g_Pad1Released(a5),d0
	bra.s	loc_1CDC44
loc_1CDC3C:
	move.w	g_PadMaskLeftRight(a5),d0
	and.w	g_Pad2Released(a5),d0
loc_1CDC44:
	beq.s	loc_1CDC70
	clr.w	$1E(a4)
	tst.w	$16(a4)
	slt.b	d3
	neg.b	d3
	beq.s	loc_1CDC62
	movea.l	$8C(a4),a0
	move.w	$16(a0),d0
	ext.l	d0
	neg.l	d0
	bra.s	loc_1CDC6C
loc_1CDC62:
	movea.l	$8C(a4),a0
	move.w	$16(a0),d0
	ext.l	d0
loc_1CDC6C:
	move.w	d0,$16(a4)
loc_1CDC70:
	tst.w	$6E(a4)
	bgt.s	loc_1CDCD2
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CDC8A
	move.w	g_PadMaskLeftRight(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CDC92
loc_1CDC8A:
	move.w	g_PadMaskLeftRight(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CDC92:
	beq.s	loc_1CDCD2
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CDCA8
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CDCB0
loc_1CDCA8:
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CDCB0:
	ext.l	d0
	move.l	d0,-(a7)
	movea.l	$8C(a4),a0
	move.w	$14(a0),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$12(a0),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4BD2(a5)	; -> XPlayer_SteerFacing
	lea.l	$10(a7),a7
loc_1CDCD2:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$7E(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_1CDCDE:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
