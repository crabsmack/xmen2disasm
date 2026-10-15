; ---------------------------------------------------------------------------
; LightBeam_Init - vtable +$12 constructor: run the parent's Init(x, y, param), then set up a LIGHTBEAM
; In:  8(a6) = this (LIGHTBEAM object)
; Out: none
; Evidence: class descriptor LIGHTBEAM slot +$12 (tools/classes.py); TAS frames 45425-45425 (1 active)
; ---------------------------------------------------------------------------
LightBeam_Init:
	link.w	a6,#$FFFC
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	d6
	lea.l	$10B2(a5),a0
	movea.l	$2(a0),a0
	move.l	a0,-$4(a6)
	lea.l	(a0),a3
	lea.l	$2(a0),a3
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$10D2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	lea.l	sub_077CBC(pc),a0
	move.l	a0,$5C(a4)
	lea.l	sub_077CBC(pc),a0
	move.l	a0,$64(a4)
	lea.l	sub_077CBC(pc),a0
	move.l	a0,$60(a4)
	ori.w	#$50C3,$6(a4)
	movea.l	$14(a6),a0
	tst.w	$6(a0)
	beq.s	loc_0778B6
	movea.w	$6(a0),a0
	bra.s	loc_0778BA
loc_0778B6:
	movea.w	#$0,a0
loc_0778BA:
	move.w	a0,$90(a4)
	movea.l	$14(a6),a0
	tst.w	$8(a0)
	beq.s	loc_0778CE
	movea.w	$8(a0),a0
	bra.s	loc_0778D2
loc_0778CE:
	movea.w	#$4,a0
loc_0778D2:
	move.w	a0,$92(a4)
	movea.l	$14(a6),a0
	tst.w	$A(a0)
	beq.s	loc_0778E6
	movea.w	$A(a0),a0
	bra.s	loc_0778EA
loc_0778E6:
	movea.w	#$4,a0
loc_0778EA:
	move.w	a0,$94(a4)
	move.w	$90(a4),d0
	lea.l	$10(a7),a7
	beq.s	loc_077902
	subq.w	#$1,d0
	beq.s	loc_077908
	subq.w	#$1,d0
	beq.s	loc_07790E
	bra.s	loc_077912
loc_077902:
	moveq	#$3B,d4
	moveq	#-$1,d5
	bra.s	loc_077912
loc_077908:
	moveq	#$2E,d4
	moveq	#-$1,d5
	bra.s	loc_077912
loc_07790E:
	moveq	#$2E,d4
	moveq	#-$1,d5
loc_077912:
	move.w	$90(a4),d7
	addq.w	#$1,d7
	bra.s	loc_077924
loc_07791A:
	add.w	$2(a3),d6
	addq.w	#$8,a3
	move.w	d7,d0
	subq.w	#$1,d7
loc_077924:
	tst.w	d7
	bne.s	loc_07791A
	move.w	d4,$96(a4)
	move.w	d6,d0
	add.w	d5,d0
	move.w	d0,$98(a4)
	move.w	#$FFFF,$9A(a4)
	move.w	#$FFFF,$9C(a4)
	move.w	#$FFFF,$9E(a4)
	move.w	-$3C5C(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> Obj_SetSpriteDef
	move.w	-$3C5C(a5),$8C(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$2,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.w	$90(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	lea.l	$10(a7),a7
	movem.l	-$1C(a6),d4-d7/a3-a4
	unlk	a6
	rts
