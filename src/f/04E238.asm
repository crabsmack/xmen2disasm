; ---------------------------------------------------------------------------
; ApocBomb_Update - vtable +$4A: per-frame update of a APOCBOMB
; In:  8(a6) = this (APOCBOMB object)
; Out: none
; Evidence: class descriptor APOCBOMB slot +$4A (tools/classes.py); TAS frames 24410-26319 (1722 active)
; ---------------------------------------------------------------------------
ApocBomb_Update:
	link.w	a6,#$FFF8
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$2E(a4),a3
	moveq	#$0,d7
	move.b	$1(a3),d7
	move.w	d7,-$6(a6)
	moveq	#$4,d4
	and.b	(a3),d4
	move.b	d4,-$3(a6)
	move.b	$42(a4),d6
	move.b	d6,-$2(a6)
	move.l	$8C(a4),d5
	asr.l	#$8,d5
	clr.b	-$1(a6)
	tst.b	-$38DE(a5)
	beq.s	loc_04E27A
	move.w	#$2,-$8(a6)
	bra.s	loc_04E280
loc_04E27A:
	move.w	#$1,-$8(a6)
loc_04E280:
	move.w	-$8(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$4E(a0),a1
	jsr	(a1)
	moveq	#$4,d0
	and.w	$92(a4),d0
	addq.w	#$8,a7
	beq.s	loc_04E2B0
	move.w	-$3B08(a5),d0
	subq.w	#$1,-$3B08(a5)
	move.l	a4,-(a7)
	jsr	$3AD2(a5)	; -> sub_13DE4A
	addq.w	#$4,a7
	bra.w	loc_04E3EC
loc_04E2B0:
	cmpi.w	#$3C,d5
	bge.s	loc_04E2BC
	clr.w	d7
	moveq	#$20,d6
	bra.s	loc_04E32C
loc_04E2BC:
	cmpi.w	#$55,d5
	bge.s	loc_04E2CA
	moveq	#$1,d7
	moveq	#$40,d6
	clr.b	d4
	bra.s	loc_04E32C
loc_04E2CA:
	cmpi.w	#$69,d5
	bge.s	loc_04E2D6
	moveq	#$2,d7
	moveq	#$60,d6
	bra.s	loc_04E32C
loc_04E2D6:
	cmpi.w	#$7D,d5
	bge.s	loc_04E2E4
	moveq	#$3,d7
	move.b	#$80,d6
	bra.s	loc_04E32C
loc_04E2E4:
	cmpi.w	#$B4,d5
	bge.s	loc_04E2F2
	moveq	#$4,d7
	move.b	#$C0,d6
	bra.s	loc_04E32C
loc_04E2F2:
	cmpi.w	#$EB,d5
	bge.s	loc_04E300
	moveq	#$4,d7
	move.b	#$A0,d6
	bra.s	loc_04E32C
loc_04E300:
	cmpi.w	#$FF,d5
	bge.s	loc_04E30E
	moveq	#$3,d7
	move.b	#$80,d6
	bra.s	loc_04E32C
loc_04E30E:
	cmpi.w	#$113,d5
	bge.s	loc_04E31A
	moveq	#$2,d7
	moveq	#$60,d6
	bra.s	loc_04E32C
loc_04E31A:
	cmpi.w	#$12C,d5
	bge.s	loc_04E328
	moveq	#$1,d7
	moveq	#$40,d6
	moveq	#$4,d4
	bra.s	loc_04E32C
loc_04E328:
	clr.w	d7
	moveq	#$10,d6
loc_04E32C:
	ext.l	d7
	move.l	d7,d0
	moveq	#$A,d1
	add.l	d1,d0
	move.b	d0,$A4(a4)
	moveq	#$10,d0
	and.w	$98(a4),d0
	beq.s	loc_04E354
	addq.w	#$5,d7
	cmpi.w	#$5,d7
	bne.s	loc_04E34E
	clr.w	$6A(a4)
	bra.s	loc_04E354
loc_04E34E:
	move.w	#$1E,$6A(a4)
loc_04E354:
	cmpi.w	#$B4,d5
	bge.s	loc_04E362
	ori.b	#$10,$2E(a4)
	bra.s	loc_04E368
loc_04E362:
	andi.b	#$EF,$2E(a4)
loc_04E368:
	cmp.w	-$6(a6),d7
	beq.s	loc_04E384
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.b	#$1,-$1(a6)
	addq.w	#$8,a7
loc_04E384:
	cmp.b	-$2(a6),d6
	beq.s	loc_04E394
	move.b	d6,$42(a4)
	move.b	#$1,-$1(a6)
loc_04E394:
	cmp.b	-$3(a6),d4
	beq.s	loc_04E3AE
	tst.b	d4
	beq.s	loc_04E3A4
	ori.b	#$4,(a3)
	bra.s	loc_04E3A8
loc_04E3A4:
	andi.b	#$FB,(a3)
loc_04E3A8:
	move.b	#$1,-$1(a6)
loc_04E3AE:
	tst.b	-$1(a6)
	beq.s	loc_04E3E4
	moveq	#$8,d0
	and.w	$6(a4),d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.b	$42(a4),d0
	move.l	d0,-(a7)
	moveq	#$4,d0
	and.b	$2E(a4),d0
	moveq	#$0,d1
	move.b	d0,d1
	move.l	d1,-(a7)
	move.w	$88(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$4F7A(a5)	; -> DrawList_SetPriority
	lea.l	$10(a7),a7
loc_04E3E4:
	move.l	a4,-(a7)
	jsr	$4DD2(a5)	; -> Obj_UpdateBoxes
	addq.w	#$4,a7
loc_04E3EC:
	movem.l	-$20(a6),d4-d7/a3-a4
	unlk	a6
	rts
