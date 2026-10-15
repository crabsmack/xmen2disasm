; ---------------------------------------------------------------------------
; Exodus_Init - register as the scene's EXODUS (-$3CB8), parent Init, then flags |= $3182, sprite set -$3CB4 (palette 1), state Exodus_StateStart (+$5C/+$64), health 30, base position (+$8C/+$90) = position, attack parameters +$A0 = 3, +$A1 = 6, death-effect kind +$A6 = 3, +$A8 = 1, motion flags +$AC = 0 (EXODUS override of slot +$12 Init)
; In:  8(a6) = this (EXODUS object), $C(a6)/$10(a6) = x/y (8.8 fixed), $14(a6) = spawn param
; Out: none
; Evidence: class descriptor EXODUS slot +$12 (tools/classes.py); TAS frames 17199-17199 (1 active)
; ---------------------------------------------------------------------------
Exodus_Init:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a4,g_ExodusObj(a5)
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
	move.w	g_ExodusSprDef(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> Obj_SetSpriteDef
	lea.l	$18(a7),a7
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	lea.l	Exodus_StateStart(pc),a0
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
