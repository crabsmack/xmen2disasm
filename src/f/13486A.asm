; ---------------------------------------------------------------------------
; FlyBrood_MoveSine - FLYBROOD mover: fly horizontally while y follows a sine wave around +$9C
; In:  8(a6) = this  $E(a6) = word steps
; Out: none
; Evidence: Math_SinDeg, phase +$AC, step +$AE, shift +$A8
; ---------------------------------------------------------------------------
FlyBrood_MoveSine:
	link.w	a6,#$FFF8
	movem.l	d4-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$AC(a4),d7
	move.w	$AE(a4),-$8(a6)
	move.w	$A8(a4),-$6(a6)
	move.l	$8(a4),d5
	move.w	$16(a4),d4
loc_13488E:
	ext.l	d4
	add.l	d4,d5
	add.w	-$8(a6),d7
	cmpi.w	#$168,d7
	ble.s	loc_1348A2
	subi.w	#$168,d7
	bra.s	loc_1348AA
loc_1348A2:
	tst.w	d7
	bge.s	loc_1348AA
	addi.w	#$168,d7
loc_1348AA:
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$517A(a5)	; -> Math_SinDeg
	move.w	-$6(a6),d1
	move.l	d0,d6
	asr.l	d1,d6
	move.w	$9C(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	add.l	d6,d0
	move.l	d0,-$4(a6)
	addq.w	#$4,a7
	subq.w	#$1,$E(a6)
	bne.s	loc_13488E
	move.l	d5,$8(a4)
	move.l	-$4(a6),$C(a4)
	move.w	d7,$AC(a4)
	movem.l	-$1C(a6),d4-d7/a4
	unlk	a6
	rts
