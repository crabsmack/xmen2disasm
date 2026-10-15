; ---------------------------------------------------------------------------
; SwampFly_Init - parent (BIONPC) Init, then flags |= $4080, stats jt $2C72 (health), sprite def jt $239A (priority, palette 1), position = placement, flight parameters +$B2/+$AF = placement bytes +7/+9, +$B0/+$B1 = words +$A/+$C plus 8, flap rate +$AE = 2, state SwampFly_StateStart (+$5C/+$64) (SWAMPFLY override of slot +$12 Init)
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = placement entry
; Out: none
; Evidence: slot +$12 of the SWAMPFLY descriptor $0C0CEA; TAS frames 27911-30514 (32 frames active)
; ---------------------------------------------------------------------------
SwampFly_Init:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$22EA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	ori.w	#$4080,$6(a4)
	lea.l	$2C72(a5),a0
	movea.l	$2(a0),a0
	move.l	a0,$8C(a4)
	moveq	#$0,d0
	move.b	$2(a0),d0
	move.w	d0,$68(a4)
	lea.l	$10(a7),a7
	lea.l	$239A(a5),a0
	move.l	$2(a0),$30(a4)
	ori.b	#$4,$2E(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.w	$2(a3),$10(a4)
	move.w	$4(a3),$12(a4)
	move.w	$2(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	move.w	$4(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	move.l	a3,d0
	beq.s	loc_0C0CC4
	move.b	$7(a3),$B2(a4)
	move.b	$9(a3),$AF(a4)
	move.w	$A(a3),d0
	ext.l	d0
	addq.l	#$8,d0
	move.b	d0,$B0(a4)
	move.w	$C(a3),d0
	ext.l	d0
	addq.l	#$8,d0
	move.b	d0,$B1(a4)
loc_0C0CC4:
	clr.b	$B3(a4)
	moveq	#$0,d0
	move.l	d0,$96(a4)
	move.b	#$2,$AE(a4)
	lea.l	SwampFly_StateStart(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
