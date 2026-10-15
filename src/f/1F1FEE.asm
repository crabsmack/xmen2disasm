; ---------------------------------------------------------------------------
; XPlayer_Attack - XPLAYER slot +$22: hit a target with the current attack and show a hit spark sized by the attack strength
; In:  8(a6) = player, $C(a6) = target, $10(a6) = byte damage type, $14(a6) = word damage, $18/$1C(a6) = words spark x/y (-1 none)
; Out: none
; Evidence: only when +$70 (attack strength) != 0; type 9 becomes 10 when the target is to the right; target vtable +$26; +$6A = 15; spark sprite $FFE9A4 frame 1-3 and timer +$A4 8-14 by strength 1/2/4/8
; ---------------------------------------------------------------------------
XPlayer_Attack:
	link.w	a6,#$0
	movem.l	d5-d7/a3-a4,-(a7)
	move.w	$1E(a6),d5
	move.w	$1A(a6),d6
	move.b	$13(a6),d7
	movea.l	$C(a6),a3
	movea.l	$8(a6),a4
	tst.b	$70(a4)
	beq.w	loc_1F20C6
	cmpi.b	#$9,d7
	bne.s	loc_1F2028
	move.l	a3,d0
	beq.s	loc_1F2028
	move.l	$8(a4),d0
	cmp.l	$8(a3),d0
	bge.s	loc_1F2028
	moveq	#$A,d7
loc_1F2028:
	clr.l	$A6(a4)
	ext.l	d5
	move.l	d5,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	move.w	$16(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	ext.w	d7
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	move.w	#$F,$6A(a4)
	cmpi.w	#$FFFF,d6
	lea.l	$18(a7),a7
	beq.s	loc_1F20C6
	moveq	#$4,d0
	and.b	$2E(a4),d0
	beq.s	loc_1F206E
	ori.b	#$4,g_HitSparkSpr(a5)
	bra.s	loc_1F2074
loc_1F206E:
	andi.b	#$FB,g_HitSparkSpr(a5)
loc_1F2074:
	move.w	d6,$A0(a4)
	move.w	d5,$A2(a4)
	move.b	$70(a4),d0
	subq.b	#$1,d0
	beq.s	loc_1F2090
	subq.b	#$1,d0
	beq.s	loc_1F209E
	subq.b	#$2,d0
	beq.s	loc_1F20AC
	subq.b	#$4,d0
	beq.s	loc_1F20BA
loc_1F2090:
	move.w	#$8,$A4(a4)
	move.b	#$1,-$185B(a5)
	bra.s	loc_1F20C6
loc_1F209E:
	move.w	#$A,$A4(a4)
	move.b	#$2,-$185B(a5)
	bra.s	loc_1F20C6
loc_1F20AC:
	move.w	#$C,$A4(a4)
	move.b	#$3,-$185B(a5)
	bra.s	loc_1F20C6
loc_1F20BA:
	move.w	#$E,$A4(a4)
	move.b	#$3,-$185B(a5)
loc_1F20C6:
	movem.l	-$14(a6),d5-d7/a3-a4
	unlk	a6
	rts
