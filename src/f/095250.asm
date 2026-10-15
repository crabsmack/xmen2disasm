; ---------------------------------------------------------------------------
; XClone_Init - vtable +$12 constructor: run the parent's Init, then set up a XCLONE
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = spawn parameter
; Evidence: slot +$12 of the XCLONE descriptor $099C90; TAS frames 52266-57222 (8 frames active); calls parent BIONPC slot +$12; state handler(s) put in +$5C: sub_095CB2
; ---------------------------------------------------------------------------
XClone_Init:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$1902(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	sub_095CB2(pc),a0
	move.l	a0,$5C(a4)
	lea.l	sub_095CB2(pc),a0
	move.l	a0,$64(a4)
	lea.l	$197A(a5),a0
	move.l	$2(a0),$A8(a4)
	lea.l	$1972(a5),a0
	move.l	$2(a0),$AC(a4)
	movea.l	$A8(a4),a0
	movea.l	a0,a1
	adda.w	$8(a1),a0
	move.l	a0,-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	lea.l	$2C7A(a5),a0
	movea.l	$2(a0),a0
	move.l	a0,$8C(a4)
	moveq	#$0,d0
	move.b	$2(a0),d0
	move.w	d0,$68(a4)
	move.w	#$20,$68(a4)
	ori.w	#$82,$6(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$2,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	lea.l	$18(a7),a7
	bne.s	loc_095326
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_09531E
	ori.b	#$4,$2E(a4)
	bra.s	loc_09536C
loc_09531E:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_09536C
loc_095326:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_095356
	moveq	#$4,d0
	and.b	-$181A(a5),d0
	beq.s	loc_09534E
	ori.b	#$4,$2E(a4)
	bra.s	loc_09536C
loc_09534E:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_09536C
loc_095356:
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_095366
	ori.b	#$4,$2E(a4)
	bra.s	loc_09536C
loc_095366:
	andi.b	#$FB,$2E(a4)
loc_09536C:
	moveq	#$0,d0
	move.l	d0,$9C(a4)
	move.w	#$300,$B2(a4)
	move.w	#$60,$B4(a4)
	move.w	$8(a3),d7
	beq.s	loc_095388
	move.w	d7,d1
	bra.s	loc_09538C
loc_095388:
	move.w	#$A0,d1
loc_09538C:
	move.w	$2(a3),d0
	sub.w	d1,d0
	move.w	d0,$A0(a4)
	addi.w	#$18,$A0(a4)
	move.w	$8(a3),d7
	beq.s	loc_0953A6
	move.w	d7,d0
	bra.s	loc_0953AA
loc_0953A6:
	move.w	#$A0,d0
loc_0953AA:
	add.w	$2(a3),d0
	move.w	d0,$A2(a4)
	subi.w	#$18,$A2(a4)
	move.w	$4(a3),$A6(a4)
	clr.b	$B9(a4)
	move.w	$2(a3),d7
	move.w	$4(a3),d6
	moveq	#$0,d0
	move.l	d0,-(a7)
	ext.l	d6
	move.l	d6,d1
	moveq	#$20,d2
	add.l	d2,d1
	move.l	d1,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$3F02(a5)	; -> sub_15AA20
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$C(a7),a7
	beq.s	loc_095408
	move.w	$A(a3),d0
	cmp.w	$E(a3),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_0953FE
	move.w	$A(a3),d0
	bra.s	loc_095402
loc_0953FE:
	move.w	$E(a3),d0
loc_095402:
	move.w	d0,$A4(a4)
	bra.s	loc_095412
loc_095408:
	move.w	d6,d0
	sub.w	#$C0,d0
	move.w	d0,$A4(a4)
loc_095412:
	moveq	#$19,d0
	move.l	d0,-(a7)
	ext.l	d6
	move.l	d6,d1
	moveq	#$20,d2
	add.l	d2,d1
	move.l	d1,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$3F0A(a5)	; -> sub_15AB44
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$C(a7),a7
	beq.s	loc_095450
	move.w	$8(a3),d0
	cmp.w	$C(a3),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_095446
	move.w	$8(a3),d0
	bra.s	loc_09544A
loc_095446:
	move.w	$C(a3),d0
loc_09544A:
	move.w	d0,-$3B2C(a5)
	bra.s	loc_09545A
loc_095450:
	move.w	d7,d0
	sub.w	#$A0,d0
	move.w	d0,-$3B2C(a5)
loc_09545A:
	moveq	#$19,d0
	move.l	d0,-(a7)
	ext.l	d6
	move.l	d6,d1
	moveq	#$20,d2
	add.l	d2,d1
	move.l	d1,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$3F12(a5)	; -> sub_15AC68
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$C(a7),a7
	beq.s	loc_095498
	move.w	$8(a3),d0
	cmp.w	$C(a3),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_09548E
	move.w	$8(a3),d0
	bra.s	loc_095492
loc_09548E:
	move.w	$C(a3),d0
loc_095492:
	move.w	d0,-$3B2A(a5)
	bra.s	loc_0954A2
loc_095498:
	move.w	d7,d0
	add.w	#$A0,d0
	move.w	d0,-$3B2A(a5)
loc_0954A2:
	clr.b	$B7(a4)
	clr.b	$B8(a4)
	clr.b	$B0(a4)
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
