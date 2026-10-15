; ---------------------------------------------------------------------------
; loc_1F89A4	[runtime: executed in tas]
; ---------------------------------------------------------------------------
loc_1F89A4:
	move.w	$4E(a4),d0
	cmp.w	$C(a3),d0
	bge.w	loc_1F8ACA
	move.w	$52(a4),d0
	cmp.w	$8(a3),d0
	blt.w	loc_1F8ACA
	cmp.w	$C(a3),d7
	bge.w	loc_1F8ACA
	cmp.w	$8(a3),d7
	blt.w	loc_1F8ACA
	moveq	#$0,d3
	move.w	$4(a3),d3
	beq.s	loc_1F89F8
	move.w	d7,d1
	sub.w	$8(a3),d1
	cmpi.w	#$100,d3
	bne.s	loc_1F89E6
	move.w	d1,d3
	ext.l	d3
	bra.s	loc_1F89F8
loc_1F89E6:
	cmpi.w	#$FF00,d3
	bne.s	loc_1F89F4
	move.w	d1,d3
	neg.w	d3
	ext.l	d3
	bra.s	loc_1F89F8
loc_1F89F4:
	muls.w	d1,d3
	asr.l	#$8,d3
loc_1F89F8:
	move.w	$A(a3),d1
	sub.w	$4C(a4),d1
	ext.l	d1
	add.l	d1,d3
	tst.l	d3
	ble.w	loc_1F8ACA
	moveq	#$40,d0
	cmp.l	d0,d3
	bgt.w	loc_1F8ACA
	move.b	d3,$4(a2)
	bra.w	loc_1F8AD6
loc_1F8A1A:
	move.l	$76(a4),d0
	beq.s	loc_1F8A2C
	movea.l	d0,a0
	moveq	#$3,d0
	cmp.b	$1(a0),d0
	beq.w	loc_1F8ACA
loc_1F8A2C:
	cmp.w	$C(a3),d7
	bge.w	loc_1F8ACA
	cmp.w	$8(a3),d7
	blt.w	loc_1F8ACA
	moveq	#$0,d3
	move.w	$4(a3),d3
	beq.s	loc_1F8A68
	move.w	d7,d1
	sub.w	$8(a3),d1
	cmpi.w	#$100,d3
	bne.s	loc_1F8A56
	move.w	d1,d3
	ext.l	d3
	bra.s	loc_1F8A68
loc_1F8A56:
	cmpi.w	#$FF00,d3
	bne.s	loc_1F8A64
	move.w	d1,d3
	neg.w	d3
	ext.l	d3
	bra.s	loc_1F8A68
loc_1F8A64:
	muls.w	d1,d3
	asr.l	#$8,d3
loc_1F8A68:
	move.w	$A(a3),d1
	sub.w	$50(a4),d1
	ext.l	d1
	add.l	d1,d3
	tst.l	d3
	bge.w	loc_1F8AE2
	moveq	#-$40,d0
	cmp.l	d0,d3
	blt.w	loc_1F8ACA
	move.b	$1(a3),d0
	cmpi.b	#$E,d0
	bne.s	loc_1F8AA4
	cmpi.b	#$2,$15(a4)
	bge.w	loc_1F8ACA
	move.b	#$2,$7(a2)
	ori.w	#$8000,(a2)
	bra.w	loc_1F8AD6
loc_1F8AA4:
	cmpi.b	#$F,d0
	bne.s	loc_1F8ABE
	cmpi.b	#$2,$15(a4)
	blt.w	loc_1F8ACA
	move.b	#$3,$7(a2)
	ori.w	#$8000,(a2)
loc_1F8ABE:
	move.b	d3,$4(a2)
	ori.w	#$8,(a2)
	bra.w	loc_1F8AD6
