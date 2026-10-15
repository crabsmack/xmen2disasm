; ---------------------------------------------------------------------------
; sub_06DB86	[link-after-rts]
; ---------------------------------------------------------------------------
sub_06DB86:
	link.w	a6,#$FFFE
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.l	d0,d5
	sub.l	#$A0,d5
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.l	d0,d6
	moveq	#$32,d0
	sub.l	d0,d6
	ext.l	d5
	move.l	d5,d1
	add.l	#$140,d1
	move.w	d1,-$2(a6)
	ext.l	d6
	move.l	d6,d4
	moveq	#$64,d1
	add.l	d1,d4
	lea.l	$FF2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	moveq	#$0,d7
	addq.w	#$8,a7
loc_06DBD4:
	tst.l	d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_06DBE4
	lea.l	g_Player1(a5),a3
	move.l	a3,d0
	bra.s	loc_06DBEA
loc_06DBE4:
	lea.l	g_Player2(a5),a3
	move.l	a3,d0
loc_06DBEA:
	movea.l	d0,a0
	move.w	$4(a0),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_06DC64
	cmp.w	$52(a3),d5
	bgt.s	loc_06DC64
	move.w	-$2(a6),d0
	cmp.w	$4E(a3),d0
	blt.s	loc_06DC64
	cmp.w	$50(a3),d6
	bgt.s	loc_06DC64
	cmp.w	$4C(a3),d4
	blt.s	loc_06DC64
	move.l	a3,$9C(a4)
	tst.l	$98(a4)
	bne.s	loc_06DC36
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_06DCA8
loc_06DC36:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_06DC4A
	clr.w	$96(a4)
loc_06DC4A:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_06DCA8
loc_06DC64:
	addq.l	#$1,d7
	moveq	#$2,d0
	cmp.l	d7,d0
	bgt.w	loc_06DBD4
	move.l	$8(a4),d4
	asr.l	#$8,d4
	cmp.w	$A2(a4),d4
	ble.s	loc_06DC80
	cmp.w	$A4(a4),d4
	blt.s	loc_06DCA8
loc_06DC80:
	move.w	#$14,$6E(a4)
	lea.l	$FE2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_06DCB2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_06DCA8:
	movem.l	-$1E(a6),d3-d7/a3-a4
	unlk	a6
	rts
