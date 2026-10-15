; ---------------------------------------------------------------------------
; MagnetoBoss_Activate - vtable +$3E: activate a MAGNETOBOSS (entered the active window)
; In:  8(a6) = this (MAGNETOBOSS object)
; Out: none
; Evidence: class descriptor MAGNETOBOSS slot +$3E (tools/classes.py); TAS frames 18543-18543 (1 active)
; ---------------------------------------------------------------------------
MagnetoBoss_Activate:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.b	$2E(a4),d6
	move.b	$2F(a4),d7
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	$B0(a4),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$3,d1
	and.b	$2E(a4),d1
	moveq	#$0,d2
	move.b	d1,d2
	move.l	d2,-(a7)
	moveq	#-$1,d1
	move.l	d1,-(a7)
	move.l	$30(a4),-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	$2E(a4)
	jsr	$506A(a5)	; -> Spr_Init
	move.w	d0,d5
	cmp.w	-$1D46(a5),d5
	lea.l	$1C(a7),a7
	ble.s	loc_0362EA
	movea.l	$30(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	cmpi.w	#$20,d0
	bne.w	loc_036398
loc_0362EA:
	moveq	#$0,d5
	move.b	$3B(a4),d5
	move.b	d6,$2E(a4)
	move.b	d7,$2F(a4)
	andi.w	#$B7FF,$4(a4)
	tst.l	$7C(a4)
	beq.s	loc_03630E
	move.l	$7C(a4),-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	addq.w	#$4,a7
loc_03630E:
	moveq	#$1,d0
	and.w	$6(a4),d0
	bne.s	loc_036340
	moveq	#$10,d0
	and.w	$6(a4),d0
	beq.s	loc_036330
	pea.l	-$165E(a5)
	move.l	a4,-(a7)
	jsr	$4062(a5)	; -> sub_15DF2A
	move.l	d0,$80(a4)
	addq.w	#$8,a7
	bra.s	loc_036340
loc_036330:
	pea.l	-$1656(a5)
	move.l	a4,-(a7)
	jsr	$4062(a5)	; -> sub_15DF2A
	move.l	d0,$80(a4)
	addq.w	#$8,a7
loc_036340:
	moveq	#$2,d0
	and.w	$6(a4),d0
	bne.s	loc_036360
	moveq	#$10,d0
	and.w	$6(a4),d0
	bne.s	loc_036360
	pea.l	-$1652(a5)
	move.l	a4,-(a7)
	jsr	$4062(a5)	; -> sub_15DF2A
	move.l	d0,$84(a4)
	addq.w	#$8,a7
loc_036360:
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	and.w	$6(a4),d1
	moveq	#$0,d2
	move.w	d1,d2
	move.l	d2,-(a7)
	moveq	#$0,d1
	move.b	$42(a4),d1
	move.l	d1,-(a7)
	moveq	#$4,d1
	and.b	$2E(a4),d1
	moveq	#$0,d2
	move.b	d1,d2
	move.l	d2,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	move.l	$1A(a0),-(a7)
	jsr	$4F6A(a5)	; -> DrawList_Add
	move.w	d0,$88(a4)
	lea.l	$18(a7),a7
loc_036398:
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
