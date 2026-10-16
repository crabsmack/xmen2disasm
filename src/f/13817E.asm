; ---------------------------------------------------------------------------
; LaserCannon_Init - LASERCANNON constructor: parent (XNPC) Init, no vertical motion, stats Tbl_LaserCannonStats (jt $38D2) (health = byte 2), state LaserCannon_StateStart, flags |= $4081, sprite Art_LaserCannonSpr (palette 3), h-flip unless placement p6, +$9E = p8 (default 90), +$9C/+$9A = p$A (default 3), +$A0 = p$C (default 40), +$A2 = (p$E != 0) (class slot 3, +$12)
; In:  8(a6) = this  $C/$10(a6) = x, y (16.16)  $14(a6) = placement entry or 0 (a zeroed entry is used then)
; Out: none
; Evidence: method 3 of class descriptor $1386B4 (name string "LASERCANNON", parent XNPC)
; ---------------------------------------------------------------------------
LaserCannon_Init:
	link.w	a6,#$FFF0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$38BA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$18(a4)
	clr.w	$20(a4)
	lea.l	$38D2(a5),a0
	movea.l	$2(a0),a0
	move.l	a0,$8C(a4)
	moveq	#$0,d0
	move.b	$2(a0),d0
	move.w	d0,$68(a4)
	lea.l	LaserCannon_StateStart(pc),a0
	move.l	a0,$5C(a4)
	lea.l	LaserCannon_StateStart(pc),a0
	move.l	a0,$64(a4)
	ori.w	#$4081,$6(a4)
	lea.l	$3882(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$3,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.l	a3,d0
	lea.l	$10(a7),a7
	bne.s	loc_138210
	lea.l	-$10(a6),a3
	clr.l	$6(a3)
	clr.l	$A(a3)
	clr.w	$E(a3)
loc_138210:
	move.w	$6(a3),d7
	beq.s	loc_13821E
	andi.b	#$EF,$2E(a4)
	bra.s	loc_138224
loc_13821E:
	ori.b	#$10,$2E(a4)
loc_138224:
	move.w	$8(a3),d7
	beq.s	loc_138230
	move.w	d7,$9E(a4)
	bra.s	loc_138236
loc_138230:
	move.w	#$5A,$9E(a4)
loc_138236:
	move.w	$A(a3),d7
	beq.s	loc_138242
	move.w	d7,$9C(a4)
	bra.s	loc_138248
loc_138242:
	move.w	#$3,$9C(a4)
loc_138248:
	move.w	$C(a3),d7
	beq.s	loc_138254
	move.w	d7,$A0(a4)
	bra.s	loc_13825A
loc_138254:
	move.w	#$28,$A0(a4)
loc_13825A:
	tst.w	$E(a3)
	beq.s	loc_138264
	moveq	#$1,d0
	bra.s	loc_138266
loc_138264:
	moveq	#$0,d0
loc_138266:
	move.b	d0,$A2(a4)
	moveq	#$0,d0
	move.l	d0,$94(a4)
	clr.w	$98(a4)
	move.w	$9C(a4),$9A(a4)
	movem.l	-$1C(a6),d7/a3-a4
	unlk	a6
	rts
