; ---------------------------------------------------------------------------
; CursorInput_StatePoll - select-screen cursor input (BOXINPUTACTOR): Start confirms, Left/Right move (with a repeat delay), ignored while a cursor is busy or confirmed
; In:  8(a6) = this (+$8C = cursor)
; Out: d0 = +4 & 8
; Evidence: g_Pad1Pressed/g_Pad2Pressed bit $80, g_Pad1Latch / -$3A30 bits 4/8 by cursor +$3F; next CursorInput_Confirm / CursorInput_MoveLeft / CursorInput_MoveRight
; ---------------------------------------------------------------------------
CursorInput_StatePoll:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	moveq	#$1,d3
	movea.l	-$3B28(a5),a0
	tst.b	$34(a0)
	bne.s	loc_067E82
	movea.l	-$3B2C(a5),a0
	tst.b	$34(a0)
	bne.s	loc_067E82
	moveq	#$0,d3
loc_067E82:
	move.b	d3,d7
	movea.l	$8C(a3),a4
	tst.b	$40(a4)
	bne.w	loc_067FAE
	tst.b	d7
	bne.w	loc_067FAE
	moveq	#$0,d0
	move.b	$3F(a4),d0
	cmpi.w	#$1,d0
	bne.s	loc_067ECA
	move.w	#$80,d0
	and.w	g_Pad1Pressed(a5),d0
	beq.s	loc_067EF4
	movea.l	a4,a0
	move.b	#$1,$34(a0)
	clr.w	$6C(a3)
	lea.l	CursorInput_Confirm(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
	bra.w	loc_067FC0
loc_067ECA:
	move.w	#$80,d0
	and.w	g_Pad2Pressed(a5),d0
	beq.s	loc_067EF4
	movea.l	$8C(a3),a0
	move.b	#$1,$34(a0)
	clr.w	$6C(a3)
	lea.l	CursorInput_Confirm(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
	bra.w	loc_067FC0
loc_067EF4:
	tst.b	$35(a4)
	beq.s	loc_067F08
	tst.w	$3A(a4)
	beq.s	loc_067F08
	subq.w	#$1,$3A(a4)
	bra.w	loc_067FAE
loc_067F08:
	moveq	#$0,d0
	move.b	$3F(a4),d0
	cmpi.w	#$1,d0
	bne.s	loc_067F62
	moveq	#$4,d0
	and.w	g_Pad1Latch(a5),d0
	beq.s	loc_067F3C
	movea.l	$8C(a3),a0
	move.b	#$1,$34(a0)
	clr.w	$6C(a3)
	lea.l	CursorInput_MoveLeft(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
	bra.w	loc_067FC0
loc_067F3C:
	moveq	#$8,d0
	and.w	g_Pad1Latch(a5),d0
	beq.s	loc_067FAE
	movea.l	$8C(a3),a0
	move.b	#$1,$34(a0)
	clr.w	$6C(a3)
	lea.l	CursorInput_MoveRight(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
	bra.s	loc_067FC0
loc_067F62:
	moveq	#$4,d0
	and.w	g_Pad2Latch(a5),d0
	beq.s	loc_067F88
	movea.l	$8C(a3),a0
	move.b	#$1,$34(a0)
	clr.w	$6C(a3)
	lea.l	CursorInput_MoveLeft(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
	bra.s	loc_067FC0
loc_067F88:
	moveq	#$8,d0
	and.w	g_Pad2Latch(a5),d0
	beq.s	loc_067FAE
	movea.l	$8C(a3),a0
	move.b	#$1,$34(a0)
	clr.w	$6C(a3)
	lea.l	CursorInput_MoveRight(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
	bra.s	loc_067FC0
loc_067FAE:
	clr.w	$6C(a3)
	lea.l	CursorInput_StatePoll(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
loc_067FC0:
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
