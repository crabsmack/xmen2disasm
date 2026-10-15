; ---------------------------------------------------------------------------
; Spr_EmitPre - append the hardware sprites of a preloaded (type $20) sprite frame that is fully on screen to g_SpriteTable
; In:  8(a6) = sprite instance   $C(a6)/$10(a6) = word: x, y in sprite space (+$80)   $14(a6) = word: tile base
; Out: none
; Evidence: reads the RAM frame record (def+$24+frame*$14: +$10 piece count, +$12 piece list offset); pieces of 6 bytes {byte x, byte y, word size/flip attr, word tile}; flips mirror with Tbl_SprWidthPre/Tbl_SprHeightPre; follows the link bytes from write pointer -$1FE6, stops at 80 sprites (count -$1FE2); chosen by Spr_Draw
; ---------------------------------------------------------------------------
Spr_EmitPre:
	link.w	a6,#$FFFC
	movem.l	d3-d7/a2-a4,-(a7)
	moveq	#$0,d2
	movea.l	$8(a6),a0
	movea.l	$2(a0),a1
	move.b	(a0),d1
	move.b	$A(a0),d2
	bmi.w	loc_1FB898
	moveq	#$50,d3
	sub.w	-$1FE2(a5),d3
	ble.w	loc_1FB898
	lea.l	$24(a1),a2
	lsl.w	#$2,d2
	adda.w	d2,a2
	lsl.w	#$2,d2
	adda.w	d2,a2
	cmp.b	$10(a2),d3
	ble.s	loc_1FB796
	move.b	$10(a2),d3
loc_1FB796:
	movea.l	-$1FE6(a5),a4
	moveq	#$0,d5
	move.w	$16(a6),d7
	sf.b	-$1(a6)
	sf.b	-$2(a6)
	move.b	d1,d0
	ror.l	#$3,d0
	swap	d0
	or.w	d0,d7
	btst	#$4,d1
	beq.s	loc_1FB7BE
	st.b	-$1(a6)
	ori.w	#$800,d7
loc_1FB7BE:
	btst	#$3,d1
	beq.s	loc_1FB7CC
	st.b	-$2(a6)
	ori.w	#$1000,d7
loc_1FB7CC:
	move.w	d7,$16(a6)
	movea.l	a1,a3
	moveq	#$0,d0
	move.w	$12(a2),d0
	adda.l	d0,a3
	moveq	#$40,d1
	moveq	#$0,d5
	bra.w	loc_1FB88A
loc_1FB7E2:
	move.w	$4(a3),d7
	move.w	$16(a6),d6
	andi.w	#$F800,d6
	move.w	$2(a3),d4
	move.w	d4,d0
	andi.w	#$1800,d0
	eor.w	d0,d6
	or.w	d6,d7
	swap	d7
	andi.w	#$F,d4
	add.w	d4,d4
	move.b	(a3),d7
	ext.w	d7
	move.b	$1(a3),d6
	add.b	d1,d6
	ext.w	d6
	sub.w	d1,d6
	tst.b	-$1(a6)
	beq.s	loc_1FB81E
	neg.w	d7
	sub.w	Tbl_SprWidthPre(pc,d4.w),d7
loc_1FB81E:
	add.w	$E(a6),d7
	tst.b	-$2(a6)
	beq.s	loc_1FB82E
	neg.w	d6
	sub.w	Tbl_SprHeightPre(pc,d4.w),d6
loc_1FB82E:
	add.w	$12(a6),d6
	bra.s	Spr_EmitPre_Piece
