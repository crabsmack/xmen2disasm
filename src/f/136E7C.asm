; ---------------------------------------------------------------------------
; Hornet_Init - Hornet: constructor: chain to the parent Init, then set this class's fields (class slot 3, +$12)
; In:  8(a6) = this  $C/$10(a6) = x, y (16.16)  $14(a6) = spawn record or 0
; Out: none
; Evidence: method 3 of class descriptor $137252 (name string "HORNET", parent XNPC)
; ---------------------------------------------------------------------------
Hornet_Init:
	link.w	a6,#$0
	movem.l	d3-d7/a3-a4,-(a7)
	move.l	$10(a6),d6
	move.l	$C(a6),d7
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,d0
	beq.s	loc_136EB8
	move.w	$2(a3),d4
	move.w	$4(a3),d5
	ext.l	d4
	move.l	d4,d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	move.l	d0,d7
	ext.l	d5
	move.l	d5,d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	move.l	d0,d6
loc_136EB8:
	move.l	a3,-(a7)
	move.l	d6,-(a7)
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	lea.l	$383A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	$37EA(a5),a0
	movea.l	$2(a0),a0
	move.l	a0,$8C(a4)
	moveq	#$0,d0
	move.b	$2(a0),d0
	move.w	d0,$68(a4)
	lea.l	sub_136B44(pc),a0
	move.l	a0,$5C(a4)
	move.w	-$1A82(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> Obj_SetSpriteDef
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$3,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.b	#$1,$70(a4)
	ori.w	#$80,$6(a4)
	lea.l	sub_136584(pc),a0
	move.l	a0,$94(a4)
	clr.w	$A0(a4)
	clr.w	$A8(a4)
	tst.w	$6(a3)
	beq.s	loc_136F40
	move.w	$6(a3),d0
	bra.s	loc_136F42
loc_136F40:
	moveq	#$40,d0
loc_136F42:
	move.w	d0,$AA(a4)
	tst.w	$8(a3)
	beq.s	loc_136F52
	move.w	$8(a3),d0
	bra.s	loc_136F54
loc_136F52:
	moveq	#$2,d0
loc_136F54:
	move.w	d0,$AC(a4)
	tst.w	$A(a3)
	beq.s	loc_136F64
	move.w	$A(a3),d0
	bra.s	loc_136F66
loc_136F64:
	moveq	#$3C,d0
loc_136F66:
	move.w	d0,$A6(a4)
	tst.w	$C(a3)
	beq.s	loc_136F76
	move.w	$C(a3),d0
	bra.s	loc_136F78
loc_136F76:
	moveq	#$1,d0
loc_136F78:
	move.w	d0,$A4(a4)
	tst.w	$E(a3)
	beq.s	loc_136F88
	move.w	$E(a3),d0
	bra.s	loc_136F8A
loc_136F88:
	moveq	#$A,d0
loc_136F8A:
	move.w	d0,$A2(a4)
	tst.w	$AC(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_136FA0
	move.l	#$FFFFFF4C,d0
	bra.s	loc_136FA2
loc_136FA0:
	moveq	#$0,d0
loc_136FA2:
	move.w	d0,$AE(a4)
	tst.w	$AC(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_136FB8
	move.w	$AA(a4),d0
	ext.l	d0
	bra.s	loc_136FC0
loc_136FB8:
	move.w	$AA(a4),d0
	ext.l	d0
	neg.l	d0
loc_136FC0:
	move.w	d0,$B0(a4)
	move.w	#$8,$B2(a4)
	move.w	#$9,$B4(a4)
	lea.l	$37E2(a5),a0
	move.l	$2(a0),$98(a4)
	move.w	#$4,$9C(a4)
	move.w	#$1E0,$B6(a4)
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	lea.l	$18(a7),a7
	bne.s	loc_13701A
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_137012
	ori.b	#$4,$2E(a4)
	bra.s	loc_137060
loc_137012:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_137060
loc_13701A:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_13704A
	moveq	#$4,d0
	and.b	-$181A(a5),d0
	beq.s	loc_137042
	ori.b	#$4,$2E(a4)
	bra.s	loc_137060
loc_137042:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_137060
loc_13704A:
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_13705A
	ori.b	#$4,$2E(a4)
	bra.s	loc_137060
loc_13705A:
	andi.b	#$FB,$2E(a4)
loc_137060:
	lea.l	$37CA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	movem.l	-$1C(a6),d3-d7/a3-a4
	unlk	a6
	rts
