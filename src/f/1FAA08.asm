; ---------------------------------------------------------------------------
; sub_1FAA08	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1FAA08:
	link.w	a6,#$FDDA
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	-$348C(a5),a3
	movea.l	$8(a6),a0
	move.l	$2(a0),-$226(a6)
	move.l	a3,-$222(a6)
	move.w	$E(a6),d5
	move.l	-$226(a6),-$21E(a6)
	move.l	a3,-$21A(a6)
	clr.w	d7
	moveq	#$24,d3
loc_1FAA34:
	movea.l	-$21E(a6),a0
	addq.l	#$1,-$21E(a6)
	movea.l	-$21A(a6),a1
	addq.l	#$1,-$21A(a6)
	move.b	(a0),(a1)
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_1FAA34
	movea.l	-$222(a6),a0
	move.b	#$20,(a0)
	movea.l	-$226(a6),a0
	moveq	#$0,d0
	move.b	(a0),d0
	cmpi.w	#$19,d0
	bne.s	loc_1FAA7C
	pea.l	-$202(a6)
	movea.l	-$226(a6),a0
	movea.l	a0,a1
	adda.w	$2(a1),a0
	move.l	a0,-(a7)
	jsr	$4112(a5)	; -> sub_15F5CA
	movea.l	d0,a3
	addq.w	#$8,a7
loc_1FAA7C:
	movea.l	-$222(a6),a4
	movea.l	-$21E(a6),a0
	adda.w	$12(a0),a4
	move.l	a4,-$212(a6)
	clr.w	d4
	bra.w	loc_1FAB4E
loc_1FAA92:
	move.l	-$21E(a6),-$206(a6)
	movea.l	-$21A(a6),a3
	clr.w	d7
	moveq	#$14,d3
loc_1FAAA0:
	movea.l	-$206(a6),a0
	addq.l	#$1,-$206(a6)
	move.b	(a0),(a3)+
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_1FAAA0
	movea.l	-$21E(a6),a0
	move.w	$12(a0),d0
	ext.l	d0
	add.l	-$226(a6),d0
	move.l	d0,-$216(a6)
	move.l	a4,d0
	sub.w	-$220(a6),d0
	movea.l	-$21A(a6),a0
	move.w	d0,$12(a0)
	clr.w	-$2(a6)
	clr.w	d6
	bra.s	loc_1FAB2C
loc_1FAADA:
	movea.l	-$216(a6),a0
	move.w	#$FF,d0
	and.w	(a0),d0
	moveq	#$0,d1
	move.w	d0,d1
	lsl.l	#$8,d1
	move.w	#$FF,d0
	and.w	$2(a0),d0
	moveq	#$0,d2
	move.w	d0,d2
	or.l	d1,d2
	move.w	d2,(a4)
	clr.l	$2(a4)
	movea.l	-$216(a6),a0
	move.w	$6(a0),d7
	ble.s	loc_1FAB22
	move.w	#$180F,d0
	and.w	$4(a0),d0
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$4000,d0
	or.w	d1,d0
	move.w	d0,$2(a4)
	move.w	d7,$4(a4)
loc_1FAB22:
	addq.l	#$6,a4
	addq.l	#$8,-$216(a6)
	move.w	d6,d0
	addq.w	#$1,d6
loc_1FAB2C:
	movea.l	-$21E(a6),a0
	move.b	$10(a0),d0
	ext.w	d0
	cmp.w	d6,d0
	bgt.s	loc_1FAADA
	addi.l	#$14,-$21E(a6)
	addi.l	#$14,-$21A(a6)
	move.w	d4,d0
	addq.w	#$1,d4
loc_1FAB4E:
	movea.l	-$226(a6),a0
	move.b	$1(a0),d0
	ext.w	d0
	cmp.w	d4,d0
	bgt.w	loc_1FAA92
	move.l	a4,-$20E(a6)
	move.l	a0,d0
	moveq	#$24,d1
	add.l	d1,d0
	move.l	d0,-$21E(a6)
	move.l	-$222(a6),d0
	add.l	d1,d0
	move.l	d0,-$21A(a6)
	clr.w	d4
	bra.s	loc_1FABC4
loc_1FAB7A:
	movea.l	-$21E(a6),a0
	move.w	$C(a0),d7
	beq.s	loc_1FABB0
	ext.l	d7
	move.l	d7,d0
	add.l	-$226(a6),d0
	move.l	d0,-$216(a6)
	move.l	a4,d0
	sub.w	-$220(a6),d0
	movea.l	-$21A(a6),a0
	move.w	d0,$C(a0)
loc_1FAB9E:
	movea.l	-$216(a6),a0
	move.w	(a0),d7
	addq.l	#$2,-$216(a6)
	move.w	d7,(a4)
	addq.l	#$2,a4
	tst.w	d7
	bne.s	loc_1FAB9E
loc_1FABB0:
	addi.l	#$14,-$21E(a6)
	addi.l	#$14,-$21A(a6)
	move.w	d4,d0
	addq.w	#$1,d4
loc_1FABC4:
	movea.l	-$226(a6),a0
	move.b	$1(a0),d0
	ext.w	d0
	cmp.w	d4,d0
	bgt.s	loc_1FAB7A
	move.l	-$212(a6),-$206(a6)
	bra.w	loc_1FACBC
loc_1FABDC:
	movea.l	-$206(a6),a0
	move.w	#$4000,d0
	and.w	$2(a0),d0
	beq.w	loc_1FACB8
	move.w	$4(a0),d7
	ext.l	d7
	move.l	d7,d0
	add.l	-$226(a6),d0
	move.l	d0,-$20A(a6)
	move.b	$3(a0),d0
	ext.w	d0
	move.w	d0,d6
	movea.l	a0,a3
	bra.s	loc_1FAC24
loc_1FAC08:
	cmp.w	$4(a3),d7
	bne.s	loc_1FAC22
	move.w	#$4000,d0
	and.w	$2(a3),d0
	beq.s	loc_1FAC22
	andi.w	#$BFFF,$2(a3)
	move.w	d5,$4(a3)
loc_1FAC22:
	addq.l	#$6,a3
loc_1FAC24:
	cmpa.l	-$20E(a6),a3
	bcs.s	loc_1FAC08
	lea.l	$515A(a5),a0
	ext.l	d6
	move.l	d6,d0
	add.l	$2(a0),d0
	movea.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	move.w	d0,d4
	movea.l	-$226(a6),a0
	moveq	#$0,d0
	move.b	(a0),d0
	cmpi.w	#$19,d0
	bne.s	loc_1FAC72
	ext.l	d5
	move.l	d5,d0
	lsl.l	#$5,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	ext.l	d4
	move.l	d4,d1
	lsl.l	#$3,d1
	move.l	d1,-(a7)
	pea.l	-$202(a6)
	move.l	-$20A(a6),-(a7)
	jsr	$4102(a5)	; -> sub_15F37C
	lea.l	$14(a7),a7
	bra.s	loc_1FACB6
loc_1FAC72:
	ext.l	d5
	move.l	d5,d0
	lsl.l	#$5,d0
	move.l	#$3FFF,d1
	and.l	d0,d1
	swap	d1
	clr.w	d1
	add.l	#$40000000,d1
	ext.l	d5
	move.l	d5,d0
	lsl.l	#$5,d0
	move.l	#$C000,d2
	and.l	d0,d2
	moveq	#$E,d0
	lsr.l	d0,d2
	add.l	d1,d2
	move.l	d2,($C00004).l
	ext.l	d4
	move.l	d4,d0
	lsl.l	#$4,d0
	move.l	d0,-(a7)
	move.l	-$20A(a6),-(a7)
	jsr	$519A(a5)	; -> VDP_WriteWords
	addq.w	#$8,a7
loc_1FACB6:
	add.w	d4,d5
loc_1FACB8:
	addq.l	#$6,-$206(a6)
loc_1FACBC:
	move.l	-$206(a6),d0
	cmp.l	-$20E(a6),d0
	bcs.w	loc_1FABDC
	movea.l	$8(a6),a0
	move.l	-$222(a6),$2(a0)
	move.l	a4,-$348C(a5)
	move.l	a4,d0
	btst	#$0,d0
	beq.s	loc_1FACE4
	move.l	a4,d0
	addq.l	#$1,-$348C(a5)
loc_1FACE4:
	move.w	d5,d0
	sub.w	$E(a6),d0
	movea.l	$8(a6),a0
	move.w	d0,$8(a0)
	movea.l	$8(a6),a0
	move.w	$E(a6),$6(a0)
	move.w	d5,d0
	movem.l	-$242(a6),d3-d7/a3-a4
	unlk	a6
	rts
