; ---------------------------------------------------------------------------
; XPlayer_Init - XPLAYER slot +$12: clear and initialise a player object (full health, empty meter, pad, safe spot)
; In:  8(a6) = player, $C/$10(a6) = x/y (8 fraction bits), $14(a6) = spawn param
; Out: none
; Evidence: Mem_Set(obj+4, 0, GetSize-4) keeping +$15; ACTOR Init; +$15 = 0 for g_Player1 else 1; +$90 = $2000; +$68 = $900; +$9E = 0; +$94 = 0; +$98/+$9A = pixel pos
; ---------------------------------------------------------------------------
XPlayer_Init:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	(a4),a0
	movea.l	$6(a0),a1
	jsr	(a1)
	move.w	d0,d7
	movea.l	a4,a3
	addq.l	#$4,a3
	subq.w	#$4,d7
	move.b	$15(a4),d6
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	jsr	$4DB2(a5)	; -> Mem_Set
	move.b	d6,$15(a4)
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2B8A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	andi.w	#$BFFF,$4(a4)
	lea.l	g_Player1(a5),a0
	cmpa.l	a4,a0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F229C
	moveq	#$0,d0
	bra.s	loc_1F229E
loc_1F229C:
	moveq	#$1,d0
loc_1F229E:
	move.b	d0,$15(a4)
	move.l	#$2000,$90(a4)
	lea.l	g_Player1(a5),a0
	cmpa.l	a4,a0
	lea.l	$1C(a7),a7
	bne.s	loc_1F22BC
	clr.b	-$18A8(a5)
	bra.s	loc_1F22C0
loc_1F22BC:
	clr.b	-$18AA(a5)
loc_1F22C0:
	clr.b	$70(a4)
	clr.b	$9D(a4)
	move.w	#$900,$68(a4)
	clr.w	$9E(a4)
	clr.l	$A4(a4)
	clr.l	$A8(a4)
	moveq	#$0,d0
	move.l	d0,$AC(a4)
	move.l	d0,$B4(a4)
	move.l	d0,$94(a4)
	move.l	$8(a4),d1
	asr.l	#$8,d1
	move.w	d1,$98(a4)
	move.l	$C(a4),d1
	asr.l	#$8,d1
	move.w	d1,$9A(a4)
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
