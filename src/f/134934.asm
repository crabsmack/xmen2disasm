; ---------------------------------------------------------------------------
; FlyBrood_Init - FlyBrood: constructor: chain to the parent Init, then set this class's fields (class slot 3, +$12)
; In:  8(a6) = this  $C/$10(a6) = x, y (16.16)  $14(a6) = spawn record or 0
; Out: none
; Evidence: method 3 of class descriptor $134518 (name string "FLYBROOD", parent ACTOR)
; ---------------------------------------------------------------------------
FlyBrood_Init:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$3732(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	move.w	$2(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	move.w	$4(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	clr.w	$18(a4)
	clr.w	$20(a4)
	moveq	#$0,d0
	move.b	-$3B5C(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	lea.l	$10(a7),a7
	beq.s	loc_1349A4
	move.w	-$1A84(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> Obj_SetSpriteDef
	addq.w	#$8,a7
	bra.s	loc_1349BC
loc_1349A4:
	lea.l	$37BA(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$2,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
loc_1349BC:
	ori.w	#$4080,$6(a4)
	lea.l	FlyBrood_ActRestartScript(pc),a0
	move.l	a0,$5C(a4)
	lea.l	FlyBrood_StateHit(pc),a0
	move.l	a0,$60(a4)
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_134A02
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_1349FA
	ori.b	#$4,$2E(a4)
	bra.s	loc_134A48
loc_1349FA:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_134A48
loc_134A02:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_134A32
	moveq	#$4,d0
	and.b	-$181A(a5),d0
	beq.s	loc_134A2A
	ori.b	#$4,$2E(a4)
	bra.s	loc_134A48
loc_134A2A:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_134A48
loc_134A32:
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_134A42
	ori.b	#$4,$2E(a4)
	bra.s	loc_134A48
loc_134A42:
	andi.b	#$FB,$2E(a4)
loc_134A48:
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	$8C(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	move.b	#$1,$96(a4)
	move.b	#$1,$97(a4)
	move.w	$2(a3),d0
	sub.w	#$A0,d0
	move.w	d0,$92(a4)
	move.w	$2(a3),d0
	add.w	#$A0,d0
	move.w	d0,$94(a4)
	move.w	$4(a3),d0
	sub.w	#$80,d0
	move.w	d0,$98(a4)
	clr.l	$9A(a4)
	andi.b	#$EF,$2E(a4)
	clr.b	$A6(a4)
	moveq	#$0,d0
	move.l	d0,$9E(a4)
	move.l	d0,$A2(a4)
	move.w	#$1,$A8(a4)
	move.w	#$200,$AA(a4)
	clr.b	$A7(a4)
	move.w	#$3,$B0(a4)
	clr.w	$AC(a4)
	move.w	#$4,$AE(a4)
	move.w	$8(a3),d1
	addq.w	#$8,a7
	bmi.s	FlyBrood_Init_Case0
	cmpi.w	#$7,d1
	bgt.s	FlyBrood_Init_Case0
	add.w	d1,d1
	move.w	Sw_134934(pc,d1.w),d1
	jmp	Sw_134934-2(pc,d1.w)
