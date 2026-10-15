; ---------------------------------------------------------------------------
; FarAcolyte_Init - parent Init, then anchor = placement pixel position (+$10/+$12, home +$B8/+$BC), no vertical speed, states FarAcolyte_StateWaitOnScreen (+$5C/+$64) and FarAcolyte_StateDie (hurt +$60), flags |= $4082, sprite set jt $2C2, no orb/bolt (+$92 = 0, records +$94/+$A4 cleared), x range +$8C..+$8E = x -/+ (placement +6 or $60), +$90 = placement +8 or $78, hover table jt $342 (FARACOLYTE override of slot +$12 Init)
; In:  8(a6) = this (FARACOLYTE object), $C(a6)/$10(a6) = x/y (8.8 fixed), $14(a6) = placement entry
; Out: none
; Evidence: class descriptor FARACOLYTE slot +$12 (tools/classes.py); TAS frames 10665-12919 (9 active)
; ---------------------------------------------------------------------------
FarAcolyte_Init:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$33A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	move.w	$2(a3),$10(a4)
	move.w	$4(a3),$12(a4)
	move.w	$10(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$B8(a4)
	move.w	$12(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$BC(a4)
	clr.w	$18(a4)
	clr.w	$20(a4)
	lea.l	FarAcolyte_StateWaitOnScreen(pc),a0
	move.l	a0,$5C(a4)
	lea.l	FarAcolyte_StateWaitOnScreen(pc),a0
	move.l	a0,$64(a4)
	lea.l	FarAcolyte_StateDie(pc),a0
	move.l	a0,$60(a4)
	ori.w	#$4082,$6(a4)
	lea.l	$2C2(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	clr.w	$92(a4)
	tst.w	$6(a3)
	beq.s	loc_017328
	move.w	$2(a3),d0
	sub.w	$6(a3),d0
	move.w	d0,$8C(a4)
	move.w	$6(a3),d0
	add.w	$2(a3),d0
	move.w	d0,$8E(a4)
	bra.s	loc_017340
loc_017328:
	move.w	$2(a3),d0
	sub.w	#$60,d0
	move.w	d0,$8C(a4)
	move.w	$2(a3),d0
	add.w	#$60,d0
	move.w	d0,$8E(a4)
loc_017340:
	tst.w	$8(a3)
	beq.s	loc_01734E
	move.w	$8(a3),$90(a4)
	bra.s	loc_017354
loc_01734E:
	move.w	#$78,$90(a4)
loc_017354:
	lea.l	$94(a4),a3
	moveq	#$0,d0
	move.l	d0,(a3)
	move.l	d0,$4(a3)
	clr.l	$8(a3)
	clr.w	$C(a3)
	lea.l	$A4(a4),a3
	move.l	d0,(a3)
	move.l	d0,$4(a3)
	clr.l	$8(a3)
	clr.l	$C(a3)
	lea.l	$342(a5),a0
	move.l	$2(a0),$B4(a4)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
