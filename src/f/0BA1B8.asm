; ---------------------------------------------------------------------------
; SavageBioBase_Init - vtable +$12 constructor: run the parent's Init, then set up a SAVAGEBIOBASE
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = spawn parameter
; Evidence: slot +$12 of the SAVAGEBIOBASE descriptor $0BD27C; TAS frames 33558-33663 (2 frames active); calls parent BIONPC slot +$12
; ---------------------------------------------------------------------------
SavageBioBase_Init:
	link.w	a6,#$FFF0
	movem.l	d6-d7/a3-a4,-(a7)
	move.l	$10(a6),d6
	move.l	$C(a6),d7
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,d0
	bne.s	loc_0BA1F4
	lea.l	-$10(a6),a3
	move.l	d7,d0
	asr.l	#$8,d0
	move.w	d0,$2(a3)
	move.l	d6,d0
	asr.l	#$8,d0
	move.w	d0,$4(a3)
	clr.l	$6(a3)
	clr.l	$A(a3)
	clr.w	$E(a3)
loc_0BA1F4:
	move.l	a3,-(a7)
	move.l	d6,-(a7)
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	lea.l	$206A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	ori.w	#$1080,$6(a4)
	move.w	#$40,$9E(a4)
	move.w	#$240,$A0(a4)
	move.w	#$60,$A4(a4)
	move.w	#$140,$A2(a4)
	clr.w	$AC(a4)
	move.l	a4,-$3B20(a5)
	clr.w	$9C(a4)
	clr.w	$A6(a4)
	moveq	#$0,d0
	move.l	d0,$A8(a4)
	movem.l	-$20(a6),d6-d7/a3-a4
	unlk	a6
	rts
