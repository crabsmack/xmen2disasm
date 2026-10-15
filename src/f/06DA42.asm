; ---------------------------------------------------------------------------
; sub_06DA42	[jt 522]
; ---------------------------------------------------------------------------
sub_06DA42:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	addq.w	#$4,a7
	bge.s	loc_06DA6A
	ori.b	#$10,$2E(a4)
	bra.s	loc_06DA70
loc_06DA6A:
	andi.b	#$EF,$2E(a4)
loc_06DA70:
	lea.l	$FE2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	move.w	$B2(a4),d0
	btst	#$0,d0
	addq.w	#$8,a7
	beq.w	loc_06DB4C
	move.l	$8(a4),d5
	asr.l	#$8,d5
	ext.l	d5
	move.w	$A2(a4),d0
	ext.l	d0
	move.l	d5,d6
	sub.l	d0,d6
	ext.l	d5
	move.w	$A4(a4),d0
	ext.l	d0
	move.l	d5,d7
	sub.l	d0,d7
	tst.w	d6
	sge.b	d3
	neg.b	d3
	beq.s	loc_06DAB8
	ext.l	d6
	move.l	d6,d0
	bra.s	loc_06DABE
loc_06DAB8:
	ext.l	d6
	move.l	d6,d0
	neg.l	d0
loc_06DABE:
	move.w	d0,d6
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_06DACE
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_06DAD4
loc_06DACE:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_06DAD4:
	move.w	d0,d7
	andi.w	#$FFFE,$B2(a4)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_06DB18
	cmpi.w	#$A,d7
	ble.s	loc_06DAFE
	clr.w	$6C(a4)
	lea.l	sub_06DCDC(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_06DB7C
loc_06DAFE:
	move.w	#$32,$6A(a4)
	clr.w	$6C(a4)
	lea.l	sub_06DDA0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_06DB7C
loc_06DB18:
	cmpi.w	#$A,d6
	ble.s	loc_06DB32
	clr.w	$6C(a4)
	lea.l	sub_06DCDC(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_06DB7C
loc_06DB32:
	move.w	#$32,$6A(a4)
	clr.w	$6C(a4)
	lea.l	sub_06DDA0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_06DB7C
loc_06DB4C:
	move.l	$8(a4),d0
	cmp.l	$8(a3),d0
	bge.s	loc_06DB5E
	move.w	$A6(a4),$16(a4)
	bra.s	loc_06DB6A
loc_06DB5E:
	move.w	$A6(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$16(a4)
loc_06DB6A:
	clr.w	$6C(a4)
	lea.l	sub_06DB86(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_06DB7C:
	movem.l	-$18(a6),d3/d5-d7/a3-a4
	unlk	a6
	rts
