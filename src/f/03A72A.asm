; ---------------------------------------------------------------------------
; BanimazaDoor_Init - vtable +$12 constructor: run the parent's Init(x, y, param), then set up a BANIMAZADOOR
; In:  8(a6) = this (BANIMAZADOOR object)
; Out: none
; Evidence: class descriptor BANIMAZADOOR slot +$12 (tools/classes.py); TAS frames 23235-23683 (3 active)
; ---------------------------------------------------------------------------
BanimazaDoor_Init:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$8AA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	move.w	$4(a3),$12(a4)
	move.w	$4(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	ori.w	#$4283,$6(a4)
	ori.w	#$4,$4(a4)
	move.w	g_BanimazaDoorSprDef(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> Obj_SetSpriteDef
	move.w	g_BanimazaDoorSprDef(a5),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_SpriteDefs(a5),a0
	moveq	#$0,d1
	or.w	$6(a0,d0.w),d1
	move.w	d1,$9C(a4)
	lea.l	$18(a7),a7
	move.b	#$1,$70(a4)
	move.w	#$4,$68(a4)
	clr.b	$42(a4)
	lea.l	$90A(a5),a0
	move.l	$2(a0),$30(a4)
	move.l	-$3C84(a5),$8C(a4)
	move.w	#$10,$90(a4)
	moveq	#$0,d0
	move.l	d0,$92(a4)
	move.w	#$5A,$9E(a4)
	clr.b	$9A(a4)
	clr.w	$A0(a4)
	lea.l	BanimazaDoor_StateReset(pc),a0
	move.l	a0,$5C(a4)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
