; ---------------------------------------------------------------------------
; sub_13F4D4	[jt 1896]
; ---------------------------------------------------------------------------
sub_13F4D4:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$C(a6),a3
	move.w	$A(a6),d6
	move.w	d6,d1
	ext.l	d1
	lsl.l	#$2,d1
	move.l	d1,d0
	lsl.l	#$2,d1
	add.l	d0,d1
	move.w	d1,d7
	pea.l	$13F588(pc)
	ext.l	d7
	move.l	d7,d0
	moveq	#$C,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	movea.l	d0,a4
	clr.b	(a4)
	move.b	d6,$1(a4)
	move.w	#$190,$2(a4)
	move.l	a3,d0
	addq.w	#$8,a7
	beq.s	loc_13F530
	move.b	$13(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,$4(a4)
	addq.w	#$8,a7
	bra.s	loc_13F536
loc_13F530:
	move.w	#$FFFF,$4(a4)
loc_13F536:
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	pea.l	sub_13F728(pc)
	jsr	$4FD2(a5)	; -> Timer_Create
	move.l	d0,$6(a4)
	lea.l	$10(a7),a7
	beq.s	loc_13F55C
	move.l	$6(a4),-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	addq.w	#$4,a7
loc_13F55C:
	moveq	#$4,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	sub_13F498(pc)
	lea.l	$C(a4),a3
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	jsr	$4DB2(a5)	; -> Mem_Set
	move.l	a4,d0
	lea.l	$14(a7),a7
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
