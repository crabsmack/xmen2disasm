; ---------------------------------------------------------------------------
; ShootAcolyte_Init - vtable +$12 constructor: run the parent's Init(x, y, param), then set up a SHOOTACOLYTE
; In:  8(a6) = this (SHOOTACOLYTE object)
; Out: none
; Evidence: class descriptor SHOOTACOLYTE slot +$12 (tools/classes.py); TAS frames 11789-12906 (14 active)
; ---------------------------------------------------------------------------
ShootAcolyte_Init:
	link.w	a6,#$FFF0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$39A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$18(a4)
	clr.w	$20(a4)
	lea.l	$3BA(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	lea.l	sub_0181F8(pc),a0
	move.l	a0,$5C(a4)
	lea.l	sub_0181F8(pc),a0
	move.l	a0,$64(a4)
	lea.l	$3C2(a5),a0
	movea.l	$2(a0),a0
	move.l	a0,$8C(a4)
	moveq	#$0,d0
	move.b	$2(a0),d0
	move.w	d0,$68(a4)
	ori.w	#$80,$6(a4)
	lea.l	$3CA(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.l	a3,d0
	lea.l	$18(a7),a7
	bne.s	loc_0180AC
	lea.l	-$10(a6),a3
	clr.l	$6(a3)
	clr.l	$A(a3)
	clr.w	$E(a3)
loc_0180AC:
	move.w	$6(a3),d7
	beq.s	loc_0180E2
	tst.w	d7
	ble.s	loc_0180BE
	move.b	#$1,$A8(a4)
	bra.s	loc_0180C2
loc_0180BE:
	clr.b	$A8(a4)
loc_0180C2:
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_0180D0
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_0180D6
loc_0180D0:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_0180D6:
	move.w	$2(a3),d1
	sub.w	d0,d1
	move.w	d1,$AA(a4)
	bra.s	loc_0180F4
loc_0180E2:
	move.b	#$1,$A8(a4)
	move.w	$2(a3),d0
	sub.w	#$60,d0
	move.w	d0,$AA(a4)
loc_0180F4:
	move.w	$8(a3),d7
	beq.s	loc_018128
	tst.w	d7
	ble.s	loc_018106
	move.b	#$1,$AC(a4)
	bra.s	loc_01810A
loc_018106:
	clr.b	$AC(a4)
loc_01810A:
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_018118
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_01811E
loc_018118:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_01811E:
	add.w	$2(a3),d0
	move.w	d0,$AE(a4)
	bra.s	loc_01813A
loc_018128:
	move.b	#$1,$AC(a4)
	move.w	$2(a3),d0
	add.w	#$60,d0
	move.w	d0,$AE(a4)
loc_01813A:
	move.w	$A(a3),d7
	beq.s	loc_018146
	move.w	d7,$B0(a4)
	bra.s	loc_01814C
loc_018146:
	move.w	#$3C,$B0(a4)
loc_01814C:
	move.w	$C(a3),d7
	beq.s	loc_018158
	move.w	d7,$A4(a4)
	bra.s	loc_01815E
loc_018158:
	move.w	#$2,$A4(a4)
loc_01815E:
	move.w	$E(a3),d7
	beq.s	loc_01816A
	move.w	d7,$A6(a4)
	bra.s	loc_018170
loc_01816A:
	move.w	#$3C,$A6(a4)
loc_018170:
	moveq	#$0,d0
	move.l	d0,$9C(a4)
	clr.w	$A0(a4)
	move.w	$A4(a4),$A2(a4)
	movem.l	-$20(a6),d3/d7/a3-a4
	unlk	a6
	rts
