; ---------------------------------------------------------------------------
; MagnetoBoss_Init - vtable +$12 constructor: run the parent's Init(x, y, param), then set up a MAGNETOBOSS
; In:  8(a6) = this (MAGNETOBOSS object)
; Out: none
; Evidence: class descriptor MAGNETOBOSS slot +$12 (tools/classes.py); TAS frames 18542-18542 (1 active)
; ---------------------------------------------------------------------------
MagnetoBoss_Init:
	link.w	a6,#$FFDC
	movem.l	d3-d7/a3-a4,-(a7)
	move.l	$C(a6),d4
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	clr.w	d7
	move.w	-$3598(a5),d5
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	d4,-(a7)
	move.l	a4,-(a7)
	lea.l	$772(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$18(a4)
	clr.w	$20(a4)
	move.w	#$32,$68(a4)
	move.w	#$600,$22(a4)
	ori.w	#$1083,$6(a4)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	lea.l	$3D9A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	-$24(a6)
	jsr	$506A(a5)	; -> sub_1FB026
	move.w	d0,d6
	cmp.w	d7,d6
	slt.b	d3
	neg.b	d3
	beq.s	loc_036124
	move.w	d7,d0
	bra.s	loc_036126
loc_036124:
	move.w	d6,d0
loc_036126:
	move.w	d0,d7
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	lea.l	$3DA2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	-$24(a6)
	jsr	$506A(a5)	; -> sub_1FB026
	move.w	d0,d6
	cmp.w	d7,d6
	slt.b	d3
	neg.b	d3
	beq.s	loc_036156
	move.w	d7,d0
	bra.s	loc_036158
loc_036156:
	move.w	d6,d0
loc_036158:
	move.w	d0,d7
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	lea.l	$3D8A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	-$24(a6)
	jsr	$506A(a5)	; -> sub_1FB026
	move.w	d0,d6
	cmp.w	d7,d6
	slt.b	d3
	neg.b	d3
	beq.s	loc_036188
	move.w	d7,d0
	bra.s	loc_03618A
loc_036188:
	move.w	d6,d0
loc_03618A:
	move.w	d0,d7
	addq.w	#$7,d0
	add.w	d0,-$3598(a5)
	move.w	-$3598(a5),d0
	subq.w	#$7,d0
	move.w	d0,$AE(a4)
	move.w	d5,$B0(a4)
	moveq	#$0,d0
	move.l	d0,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	lea.l	$3D8A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	$2E(a4)
	jsr	$506A(a5)	; -> sub_1FB026
	moveq	#$0,d0
	move.l	d0,$8C(a4)
	move.b	#$10,$9B(a4)
	move.b	#$FF,$9C(a4)
	lea.l	$76A(a5),a0
	move.l	$2(a0),$94(a4)
	clr.b	$98(a4)
	move.b	#$9,$99(a4)
	move.b	#$8,$9A(a4)
	move.l	a3,d1
	lea.l	$80(a7),a7
	bne.s	loc_036220
	lea.l	-$10(a6),a3
	move.l	d4,d0
	asr.l	#$8,d0
	move.w	d0,$2(a3)
	move.l	$10(a6),d0
	asr.l	#$8,d0
	move.w	d0,$4(a3)
	move.w	#$D2,$6(a3)
	clr.w	$8(a3)
	move.w	#$5,$A(a3)
	clr.l	$C(a3)
loc_036220:
	move.w	$6(a3),d7
	beq.s	loc_03622C
	move.w	d7,$AA(a4)
	bra.s	loc_036232
loc_03622C:
	move.w	#$D2,$AA(a4)
loc_036232:
	move.w	$A(a3),d7
	beq.s	loc_03623E
	move.b	d7,$9D(a4)
	bra.s	loc_036244
loc_03623E:
	move.b	#$5,$9D(a4)
loc_036244:
	move.w	$AA(a4),$AC(a4)
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	a4,-$3AFE(a5)
	lea.l	sub_036C0A(pc),a0
	move.l	a0,$5C(a4)
	lea.l	sub_036C0A(pc),a0
	move.l	a0,$64(a4)
	clr.b	$B2(a4)
	andi.b	#$F1,$9B(a4)
	move.w	#$FF9C,$A6(a4)
	move.w	#$1F40,$A8(a4)
	addq.w	#$8,a7
	movem.l	-$40(a6),d3-d7/a3-a4
	unlk	a6
	rts
