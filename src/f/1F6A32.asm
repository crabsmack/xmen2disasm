; ---------------------------------------------------------------------------
; Player_NearestLive - return the live player nearer to an object (Manhattan distance on the 16.16 positions), or the only live one, or 0
; In:  8(a6) = object
; Out: d0 = g_Player1 / g_Player2 / 0
; Evidence: player +4 & $C000 = $8000 = alive; compares |dx|+|dy| of +8/+$C against $FFEAB0/$FFEAB4 (P1) and $FFE9C0/$FFE9C4 (P2); 6 callers
; ---------------------------------------------------------------------------
Player_NearestLive:
	link.w	a6,#$FFF4
	movem.l	d3-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d4
	move.l	$C(a4),d5
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	beq.s	loc_1F6A86
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	beq.s	loc_1F6A7C
	moveq	#$0,d0
	bra.w	loc_1F6B4C
loc_1F6A7C:
	lea.l	g_Player2(a5),a0
	move.l	a0,d0
	bra.w	loc_1F6B4C
loc_1F6A86:
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	beq.s	loc_1F6AC6
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	beq.s	loc_1F6ABC
	moveq	#$0,d0
	bra.w	loc_1F6B4C
loc_1F6ABC:
	lea.l	g_Player1(a5),a0
	move.l	a0,d0
	bra.w	loc_1F6B4C
loc_1F6AC6:
	move.l	d4,-$8(a6)
	move.l	g_Player1+$8(a5),d6
	sub.l	-$8(a6),d6
	move.l	d5,-$4(a6)
	move.l	g_Player1+$C(a5),d7
	sub.l	-$4(a6),d7
	tst.l	d6
	sge.b	d3
	neg.b	d3
	beq.s	loc_1F6AEA
	move.l	d6,d0
	bra.s	loc_1F6AEE
loc_1F6AEA:
	move.l	d6,d0
	neg.l	d0
loc_1F6AEE:
	tst.l	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_1F6AFA
	move.l	d7,d1
	bra.s	loc_1F6AFE
loc_1F6AFA:
	move.l	d7,d1
	neg.l	d1
loc_1F6AFE:
	add.l	d0,d1
	move.l	d1,-$C(a6)
	move.l	g_Player2+$8(a5),d6
	sub.l	-$8(a6),d6
	move.l	g_Player2+$C(a5),d7
	sub.l	-$4(a6),d7
	tst.l	d6
	sge.b	d3
	neg.b	d3
	beq.s	loc_1F6B20
	move.l	d6,d0
	bra.s	loc_1F6B24
loc_1F6B20:
	move.l	d6,d0
	neg.l	d0
loc_1F6B24:
	tst.l	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_1F6B30
	move.l	d7,d1
	bra.s	loc_1F6B34
loc_1F6B30:
	move.l	d7,d1
	neg.l	d1
loc_1F6B34:
	move.l	d1,d5
	add.l	d0,d5
	cmp.l	-$C(a6),d5
	ble.s	loc_1F6B46
	lea.l	g_Player1(a5),a0
	move.l	a0,d0
	bra.s	loc_1F6B4C
loc_1F6B46:
	lea.l	g_Player2(a5),a0
	move.l	a0,d0
loc_1F6B4C:
	movem.l	-$24(a6),d3-d7/a4
	unlk	a6
	rts
