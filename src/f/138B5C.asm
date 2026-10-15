; ---------------------------------------------------------------------------
; MaintRobot_Init - MaintRobot: constructor: chain to the parent Init, then set this class's fields (class slot 3, +$12)
; In:  8(a6) = this  $C/$10(a6) = x, y (16.16)  $14(a6) = spawn record or 0
; Out: none
; Evidence: method 3 of class descriptor $1391FE (name string "MAINTROBOT", parent XNPC)
; ---------------------------------------------------------------------------
MaintRobot_Init:
	link.w	a6,#$0
	movem.l	d3/a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$3962(a5),a0
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
	clr.w	$20(a4)
	lea.l	sub_139108(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	moveq	#-$1,d0
	cmp.w	-$1A7E(a5),d0
	lea.l	$10(a7),a7
	bne.s	loc_138BD8
	lea.l	$3982(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	bra.s	loc_138BE8
loc_138BD8:
	move.w	-$1A7E(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> Obj_SetSpriteDef
	addq.w	#$8,a7
loc_138BE8:
	ori.w	#$80,$6(a4)
	lea.l	$2C72(a5),a0
	movea.l	$2(a0),a0
	move.l	a0,$8C(a4)
	moveq	#$0,d0
	move.b	$2(a0),d0
	move.w	d0,$68(a4)
	move.b	#$10,$42(a4)
	clr.w	$98(a4)
	tst.w	$6(a3)
	beq.s	loc_138C1E
	move.w	$6(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	bra.s	loc_138C24
loc_138C1E:
	move.l	#$200,d0
loc_138C24:
	move.w	d0,$9C(a4)
	tst.w	$8(a3)
	beq.s	loc_138C34
	move.w	$8(a3),d0
	bra.s	loc_138C36
loc_138C34:
	moveq	#$3C,d0
loc_138C36:
	move.w	d0,$9E(a4)
	tst.w	$A(a3)
	beq.s	loc_138C46
	move.w	$A(a3),d0
	bra.s	loc_138C48
loc_138C46:
	moveq	#$2,d0
loc_138C48:
	move.w	d0,$A0(a4)
	tst.w	$C(a3)
	beq.s	loc_138C58
	move.w	$C(a3),d0
	bra.s	loc_138C5A
loc_138C58:
	moveq	#$14,d0
loc_138C5A:
	move.w	d0,$A2(a4)
	tst.w	$E(a3)
	beq.s	loc_138C6A
	move.w	$E(a3),d0
	bra.s	loc_138C6C
loc_138C6A:
	moveq	#$0,d0
loc_138C6C:
	move.b	d0,$A7(a4)
	clr.w	$A4(a4)
	clr.b	$A6(a4)
	move.w	$9C(a4),$9A(a4)
	move.w	$9C(a4),$16(a4)
	moveq	#$0,d0
	move.l	d0,$94(a4)
	move.w	-$1754(a5),d1
	ext.l	d1
	move.w	#$C000,d2
	and.w	d1,d2
	moveq	#$0,d1
	move.w	d2,d1
	cmpi.l	#$8000,d1
	seq.b	d3
	neg.b	d3
	beq.s	loc_138CAE
	lea.l	g_Player1(a5),a0
	move.l	a0,d1
	bra.s	loc_138CB4
loc_138CAE:
	lea.l	g_Player2(a5),a0
	move.l	a0,d1
loc_138CB4:
	movea.l	d1,a0
	moveq	#$4,d0
	and.b	$2E(a0),d0
	beq.s	loc_138CC4
	ori.b	#$4,$2E(a4)
loc_138CC4:
	move.l	a4,-(a7)
	jsr	$4EC2(a5)	; -> sub_1F6B9C
	addq.w	#$4,a7
	movem.l	-$C(a6),d3/a3-a4
	unlk	a6
	rts
