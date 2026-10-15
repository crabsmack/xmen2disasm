; ---------------------------------------------------------------------------
; SavageBioBase_Update - vtable +$4A: per-frame update of a SAVAGEBIOBASE
; In:  8(a6) = this
; Evidence: slot +$4A of the SAVAGEBIOBASE descriptor $0BD27C; TAS frames 33560-34355 (704 frames active)
; ---------------------------------------------------------------------------
SavageBioBase_Update:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	-$38DE(a5)
	beq.s	loc_0BA374
	moveq	#$2,d7
	bra.s	loc_0BA376
loc_0BA374:
	moveq	#$1,d7
loc_0BA376:
	move.l	$8(a4),d5
	move.l	$C(a4),d6
	move.w	#$4000,d0
	and.w	$6(a4),d0
	bne.s	loc_0BA3AC
	move.w	#$1800,d0
	and.w	$4(a4),d0
	moveq	#$0,d1
	move.w	d0,d1
	cmpi.l	#$1800,d1
	beq.s	loc_0BA3AC
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$4E(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
loc_0BA3AC:
	moveq	#$4,d0
	and.w	$4(a4),d0
	bne.s	loc_0BA3DC
	move.l	$C(a4),d0
	sub.l	d6,d0
	move.l	d0,-(a7)
	move.l	$8(a4),d0
	sub.l	d5,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	jsr	$412A(a5)	; -> sub_15F8B6
	tst.b	d0
	lea.l	$10(a7),a7
	beq.s	loc_0BA3DC
	ori.w	#$8,$4(a4)
loc_0BA3DC:
	move.w	#$200,d0
	and.w	$4(a4),d0
	bne.s	loc_0BA430
	tst.w	$6E(a4)
	ble.s	loc_0BA3FA
	sub.w	d7,$6E(a4)
	tst.w	$6E(a4)
	bge.s	loc_0BA3FA
	clr.w	$6E(a4)
loc_0BA3FA:
	tst.w	$6C(a4)
	ble.s	loc_0BA418
	cmpi.w	#$FF,$6C(a4)
	bge.s	loc_0BA430
	sub.w	d7,$6C(a4)
	tst.w	$6C(a4)
	bge.s	loc_0BA430
	clr.w	$6C(a4)
	bra.s	loc_0BA430
loc_0BA418:
	move.l	a4,-(a7)
	movea.l	$5C(a4),a0
	jsr	(a0)
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$8000,d1
	and.w	d0,d1
	addq.w	#$4,a7
	beq.s	loc_0BA498
loc_0BA430:
	moveq	#$10,d0
	and.w	$4(a4),d0
	bne.s	loc_0BA498
	cmp.l	$8(a4),d5
	bne.s	loc_0BA444
	cmp.l	$C(a4),d6
	beq.s	loc_0BA44A
loc_0BA444:
	ori.w	#$8,$4(a4)
loc_0BA44A:
	moveq	#$8,d0
	and.w	$4(a4),d0
	beq.s	loc_0BA460
	move.l	a4,-(a7)
	jsr	$4DD2(a5)	; -> Obj_UpdateBoxes
	andi.w	#$FFF7,$4(a4)
	addq.w	#$4,a7
loc_0BA460:
	tst.w	$6A(a4)
	ble.s	loc_0BA46A
	sub.w	d7,$6A(a4)
loc_0BA46A:
	tst.w	$6A(a4)
	bge.s	loc_0BA474
	clr.w	$6A(a4)
loc_0BA474:
	tst.w	$AC(a4)
	ble.s	loc_0BA498
	tst.b	-$38DE(a5)
	beq.s	loc_0BA484
	moveq	#$2,d0
	bra.s	loc_0BA486
loc_0BA484:
	moveq	#$1,d0
loc_0BA486:
	ext.w	d0
	sub.w	d0,$AC(a4)
	tst.w	$AC(a4)
	bgt.s	loc_0BA498
	andi.w	#$FFBF,$6(a4)
loc_0BA498:
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
