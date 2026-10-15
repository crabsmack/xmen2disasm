; ---------------------------------------------------------------------------
; sub_157D5E	[jt 1976]
; ---------------------------------------------------------------------------
sub_157D5E:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$30(a4)
	beq.s	loc_157D9E
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	$A4(a4),d1
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
	jsr	$506A(a5)	; -> sub_1FB026
	lea.l	$1C(a7),a7
loc_157D9E:
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_157DCE
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_157DC6
	ori.b	#$4,$2E(a4)
	bra.s	loc_157E14
loc_157DC6:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_157E14
loc_157DCE:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_157DFE
	moveq	#$4,d0
	and.b	-$181A(a5),d0
	beq.s	loc_157DF6
	ori.b	#$4,$2E(a4)
	bra.s	loc_157E14
loc_157DF6:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_157E14
loc_157DFE:
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_157E0E
	ori.b	#$4,$2E(a4)
	bra.s	loc_157E14
loc_157E0E:
	andi.b	#$FB,$2E(a4)
loc_157E14:
	tst.l	$7C(a4)
	beq.s	loc_157E24
	move.l	$7C(a4),-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	addq.w	#$4,a7
loc_157E24:
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
	movea.l	-$4(a6),a4
	unlk	a6
	rts
