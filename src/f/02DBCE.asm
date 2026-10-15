; ---------------------------------------------------------------------------
; Exodus_Init - vtable +$12 constructor: run the parent's Init(x, y, param), then set up a EXODUS
; In:  8(a6) = this (EXODUS object)
; Out: none
; Evidence: class descriptor EXODUS slot +$12 (tools/classes.py); TAS frames 17199-17199 (1 active)
; ---------------------------------------------------------------------------
Exodus_Init:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a4,-$3CB8(a5)
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$67A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	ori.w	#$3182,$6(a4)
	move.w	-$3CB4(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> sub_1F6334
	lea.l	$18(a7),a7
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	lea.l	sub_02CDA4(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	move.w	#$1E,$68(a4)
	move.l	a3,d0
	move.l	$8(a4),$8C(a4)
	move.l	$C(a4),$90(a4)
	move.b	#$3,$A0(a4)
	move.b	#$6,$A1(a4)
	clr.w	$A2(a4)
	clr.b	$A4(a4)
	move.b	#$3,$A6(a4)
	clr.b	$A7(a4)
	move.b	#$1,$A8(a4)
	clr.b	$A9(a4)
	clr.b	$AB(a4)
	clr.w	$AC(a4)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
