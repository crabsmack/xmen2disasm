; ---------------------------------------------------------------------------
; BroodClaw_Init - vtable +$12 constructor: run the parent's Init, then set up a BROODCLAW
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = spawn parameter
; Evidence: slot +$12 of the BROODCLAW descriptor $09B98C; TAS frames 49291-51133 (3 frames active); calls parent ACTOR slot +$12
; ---------------------------------------------------------------------------
BroodClaw_Init:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$1A7A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.w	$2(a3),$10(a4)
	move.w	$4(a3),d0
	add.w	#$FFE4,d0
	move.w	d0,$12(a4)
	move.w	$10(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	move.w	$12(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	move.w	-$3C4C(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> Obj_SetSpriteDef
	ori.w	#$1082,$6(a4)
	lea.l	sub_09B45E(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	clr.b	$8B(a4)
	clr.b	$91(a4)
	lea.l	sub_09B224(pc),a0
	move.l	a0,$92(a4)
	moveq	#$0,d0
	move.l	d0,$96(a4)
	move.w	#$32,$9A(a4)
	move.l	d0,$9C(a4)
	move.w	$10(a4),$A0(a4)
	move.l	a4,-(a7)
	jsr	$4DD2(a5)	; -> Obj_UpdateBoxes
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
