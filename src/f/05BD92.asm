; ---------------------------------------------------------------------------
; Boulder_Draw - vtable +$1A: draw a BOULDER
; In:  8(a6) = this (BOULDER object)
; Out: none
; Evidence: class descriptor BOULDER slot +$1A (tools/classes.py); TAS frames 20650-20996 (206 active)
; ---------------------------------------------------------------------------
Boulder_Draw:
	link.w	a6,#$0
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	tst.w	$6A(a3)
	ble.s	loc_05BE02
	moveq	#$3,d4
	lea.l	$8C(a3),a4
	clr.w	d7
loc_05BDAC:
	move.w	(a4),d0
	asr.w	#$2,d0
	ext.l	d0
	move.w	-$348E(a5),d1
	ext.l	d1
	move.l	d0,d5
	sub.l	d1,d5
	move.w	$2(a4),d0
	asr.w	#$2,d0
	ext.l	d0
	move.w	-$3490(a5),d1
	ext.l	d1
	move.l	d0,d6
	sub.l	d1,d6
	cmpi.w	#$6,d4
	ble.s	loc_05BDD6
	moveq	#$3,d4
loc_05BDD6:
	move.w	d4,d0
	addq.w	#$1,d4
	move.b	d0,$2F(a3)
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	pea.l	$2E(a3)
	jsr	$508A(a5)	; -> sub_1FB346
	lea.l	$C(a7),a7
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$8,a4
	cmpi.w	#$3,d7
	blt.s	loc_05BDAC
	bra.w	loc_05BF40
loc_05BE02:
	move.w	$4E(a3),d0
	ext.l	d0
	moveq	#$28,d1
	sub.l	d1,d0
	move.w	-$348E(a5),d2
	ext.l	d2
	sub.l	d2,d0
	cmpi.l	#$140,d0
	bgt.w	loc_05BF40
	move.w	$52(a3),d0
	ext.l	d0
	moveq	#$28,d1
	add.l	d1,d0
	move.w	-$348E(a5),d2
	ext.l	d2
	sub.l	d2,d0
	blt.w	loc_05BF40
	move.w	$4C(a3),d0
	ext.l	d0
	moveq	#$28,d1
	sub.l	d1,d0
	move.w	-$3490(a5),d2
	ext.l	d2
	sub.l	d2,d0
	cmpi.l	#$E0,d0
	bgt.w	loc_05BF40
	move.w	$50(a3),d0
	ext.l	d0
	moveq	#$28,d1
	add.l	d1,d0
	move.w	-$3490(a5),d2
	ext.l	d2
	sub.l	d2,d0
	blt.w	loc_05BF40
	tst.l	$B8(a3)
	beq.s	loc_05BE98
	move.w	$24(a3),d0
	ext.l	d0
	move.w	-$3490(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,-(a7)
	move.w	$22(a3),d0
	ext.l	d0
	move.w	-$348E(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,-(a7)
	pea.l	$A4(a3)
	jsr	$508A(a5)	; -> sub_1FB346
	lea.l	$C(a7),a7
loc_05BE98:
	moveq	#$0,d3
	tst.l	$44(a3)
	beq.s	loc_05BEB8
	movea.l	$44(a3),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$30,d1
	and.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	cmpi.w	#$30,d0
	bne.s	loc_05BEB8
	moveq	#$1,d3
loc_05BEB8:
	tst.b	d3
	beq.s	loc_05BED4
	move.w	$4A(a3),d0
	ext.l	d0
	move.l	$C(a3),d1
	sub.l	d0,d1
	asr.l	#$8,d1
	move.w	-$3490(a5),d0
	ext.l	d0
	sub.l	d0,d1
	bra.s	loc_05BEE4
loc_05BED4:
	move.l	$C(a3),d0
	asr.l	#$8,d0
	move.w	-$3490(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,d1
loc_05BEE4:
	move.l	d1,-(a7)
	moveq	#$0,d3
	tst.l	$44(a3)
	beq.s	loc_05BF06
	movea.l	$44(a3),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$30,d1
	and.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	cmpi.w	#$20,d0
	bne.s	loc_05BF06
	moveq	#$1,d3
loc_05BF06:
	tst.b	d3
	beq.s	loc_05BF22
	move.w	$4A(a3),d0
	ext.l	d0
	move.l	$8(a3),d1
	sub.l	d0,d1
	asr.l	#$8,d1
	move.w	-$348E(a5),d0
	ext.l	d0
	sub.l	d0,d1
	bra.s	loc_05BF32
loc_05BF22:
	move.l	$8(a3),d0
	asr.l	#$8,d0
	move.w	-$348E(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,d1
loc_05BF32:
	move.l	d1,-(a7)
	pea.l	$2E(a3)
	jsr	$508A(a5)	; -> sub_1FB346
	lea.l	$C(a7),a7
loc_05BF40:
	movem.l	-$1C(a6),d3-d7/a3-a4
	unlk	a6
	rts
