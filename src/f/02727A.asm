; ---------------------------------------------------------------------------
; Zapper_Init - vtable +$12 constructor: run the parent's Init(x, y, param), then set up a ZAPPER
; In:  8(a6) = this (ZAPPER object)
; Out: none
; Evidence: class descriptor ZAPPER slot +$12 (tools/classes.py); TAS frames 14140-16816 (68 active)
; ---------------------------------------------------------------------------
Zapper_Init:
	link.w	a6,#$FFF0
	movem.l	d6-d7/a3-a4,-(a7)
	move.l	$10(a6),d6
	move.l	$C(a6),d7
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,d0
	bne.s	loc_0272B6
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
loc_0272B6:
	move.l	a3,-(a7)
	move.l	d6,-(a7)
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	lea.l	$5BA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$18(a4)
	clr.w	$20(a4)
	ori.w	#$4082,$6(a4)
	move.w	-$3CCC(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> Obj_SetSpriteDef
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.w	$6(a3),d7
	move.w	d7,d0
	lea.l	$18(a7),a7
	beq.s	loc_027310
	subq.w	#$1,d0
	beq.s	loc_027322
	subq.w	#$1,d0
	beq.s	loc_027334
	clr.w	d7
loc_027310:
	lea.l	sub_027352(pc),a0
	move.l	a0,$5C(a4)
	lea.l	sub_027352(pc),a0
	move.l	a0,$64(a4)
	bra.s	loc_027344
loc_027322:
	lea.l	sub_027388(pc),a0
	move.l	a0,$5C(a4)
	lea.l	sub_027388(pc),a0
	move.l	a0,$64(a4)
	bra.s	loc_027344
loc_027334:
	lea.l	sub_0273BE(pc),a0
	move.l	a0,$5C(a4)
	lea.l	sub_0273BE(pc),a0
	move.l	a0,$64(a4)
loc_027344:
	move.w	d7,$8C(a4)
	movem.l	-$20(a6),d6-d7/a3-a4
	unlk	a6
	rts
