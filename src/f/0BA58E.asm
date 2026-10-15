; ---------------------------------------------------------------------------
; SavageBigBio_Init - vtable +$12 constructor: run the parent's Init, then set up a SAVAGEBIGBIO
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = spawn parameter
; Evidence: slot +$12 of the SAVAGEBIGBIO descriptor $0BD30C; TAS frames 33663-33663 (1 frames active); calls parent SAVAGEBIOBASE slot +$12
; ---------------------------------------------------------------------------
SavageBigBio_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2072(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	-$3B06(a5)
	moveq	#$0,d0
	move.l	d0,-$3B18(a5)
	move.l	d0,-$3B1C(a5)
	addi.w	#$30,$9E(a4)
	subi.w	#$30,$A0(a4)
	movea.l	-$3B14(a5),a0
	move.b	-$3B01(a5),$2(a0)
	movea.l	-$3B14(a5),a0
	move.l	a0,$8C(a4)
	moveq	#$0,d1
	move.b	$2(a0),d1
	move.w	d1,$68(a4)
	lea.l	$1E4A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	tst.l	$98(a4)
	lea.l	$18(a7),a7
	bne.s	loc_0BA614
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0BA630
loc_0BA614:
	clr.w	$96(a4)
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_0BA630:
	lea.l	$35A2(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$3,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	moveq	#$0,d0
	move.l	d0,$B0(a4)
	clr.w	$AE(a4)
	move.l	#$580,-$3B24(a5)
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	jsr	$4DD2(a5)	; -> Obj_UpdateBoxes
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$C(a4),-(a7)
	move.l	$8(a4),-(a7)
	lea.l	$33F2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$33F2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	move.l	d0,$B4(a4)
	lea.l	$20(a7),a7
	beq.s	loc_0BA6C6
	movea.l	$B4(a4),a0
	moveq	#-$4,d0
	and.b	$2E(a0),d0
	moveq	#$3,d1
	or.b	d0,d1
	movea.l	$B4(a4),a0
	move.b	d1,$2E(a0)
	pea.l	($FF).w
	movea.l	$B4(a4),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
loc_0BA6C6:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
