; ---------------------------------------------------------------------------
; Gambit_PointNearBody - is a point inside Gambit's body box widened by margins that depend on the card type (stops a card's trail at Gambit)
; In:  8(a6) = player  $C(a6) = card record  $12(a6)/$16(a6) = word x/y
; Out: d0 = 1 inside, 0 outside
; Evidence: switch on card type +$E: 0 horizontal 50 px (32 airborne), 1 vertical 25 px tall, 2 40 px, 3 diagonal 127/32 (15/16 airborne), 4 34/26; box +$4C..+$52; called per trail sprite by Gambit_UpdateCard
; ---------------------------------------------------------------------------
Gambit_PointNearBody:
	link.w	a6,#$0
	movem.l	d3-d7/a3-a4,-(a7)
	move.w	$16(a6),d4
	move.w	$12(a6),d5
	movea.l	$C(a6),a3
	movea.l	$8(a6),a4
	clr.w	d7
	clr.w	d6
	move.b	$E(a3),d0
	bmi.s	Gambit_PointNearBody_Test
	cmpi.b	#$4,d0
	bgt.s	Gambit_PointNearBody_Test
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_1CF36E(pc,d1.w),d1
	jmp	Sw_1CF36E-2(pc,d1.w)
