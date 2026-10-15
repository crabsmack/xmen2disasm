; ---------------------------------------------------------------------------
; Platform1_StateRide - Platform1 mode 1: while its switch flag ($200 in g_BBoard) is set, a player standing on it steers it; otherwise it stops
; In:  8(a6) = this
; Out: none
; Evidence: rider = player whose segment (+$76: $FFEB1E/$FFEA2E) is the platform segment +$8C; Platform1_SteerByPad
; ---------------------------------------------------------------------------
Platform1_StateRide:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.b	$8B(a4),d0
	movea.l	g_BBoard(a5),a0
	add.l	d0,d0
	move.w	#$200,d7
	and.w	$6(a0,d0.l),d7
	tst.w	d7
	bne.s	loc_107126
	tst.w	$16(a4)
	beq.w	loc_1071A0
	move.w	$16(a4),$92(a4)
	clr.w	$16(a4)
	move.w	#$A,$6E(a4)
	bra.s	loc_1071A0
loc_107126:
	moveq	#$0,d3
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_10714C
	move.l	g_Player1+$76(a5),d0
	cmp.l	$8C(a4),d0
	bne.s	loc_10714C
	moveq	#$1,d3
loc_10714C:
	move.b	d3,d6
	moveq	#$0,d3
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_107174
	move.l	g_Player2+$76(a5),d0
	cmp.l	$8C(a4),d0
	bne.s	loc_107174
	moveq	#$1,d3
loc_107174:
	move.b	d3,d7
	tst.b	d6
	beq.s	loc_107188
	pea.l	g_Player1(a5)
	move.l	a4,-(a7)
	jsr	Platform1_SteerByPad(pc)
	addq.w	#$8,a7
	bra.s	loc_1071A0
loc_107188:
	tst.b	d7
	beq.s	loc_10719A
	pea.l	g_Player2(a5)
	move.l	a4,-(a7)
	jsr	Platform1_SteerByPad(pc)
	addq.w	#$8,a7
	bra.s	loc_1071A0
loc_10719A:
	move.w	$94(a4),$16(a4)
loc_1071A0:
	movem.l	-$10(a6),d3/d6-d7/a4
	unlk	a6
	rts
