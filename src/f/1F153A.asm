; ---------------------------------------------------------------------------
; sub_1F153A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F153A:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$4000,d0
	and.w	$6(a4),d0
	bne.w	loc_1F163A
	move.w	#$1800,d0
	and.w	$4(a4),d0
	moveq	#$0,d1
	move.w	d0,d1
	cmpi.l	#$1800,d1
	beq.s	loc_1F157A
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$4E(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
loc_1F157A:
	move.w	#$80,d0
	and.w	$6(a4),d0
	bne.w	loc_1F163A
	move.l	$8(a4),d7
	move.b	#$FF,$7B(a4)
	moveq	#$0,d5
	move.b	$42(a4),d5
	move.l	a4,-(a7)
	jsr	sub_1F0582(pc)
	move.b	d0,d6
	move.l	a4,-(a7)
	jsr	$4DDA(a5)	; -> Obj_UpdateBox
	tst.b	d6
	addq.w	#$8,a7
	bne.s	loc_1F15B2
	move.l	a4,-(a7)
	jsr	$4F5A(a5)	; -> sub_1F8B42
	addq.w	#$4,a7
loc_1F15B2:
	moveq	#$0,d0
	move.b	$3A(a4),d0
	cmpi.w	#$FF,d0
	beq.s	loc_1F15CA
	move.l	a4,-(a7)
	move.l	$76(a4),-(a7)
	jsr	$4EF2(a5)	; -> sub_1F71F2
	addq.w	#$8,a7
loc_1F15CA:
	tst.w	$AA(a4)
	ble.s	loc_1F1600
	move.l	$8(a4),d6
	sub.l	d7,d6
	cmpi.l	#$200,d6
	ble.s	loc_1F15EC
	move.l	d7,d0
	add.l	#$200,d0
	move.l	d0,$8(a4)
	bra.s	loc_1F1600
loc_1F15EC:
	cmpi.l	#$FFFFFE00,d6
	bge.s	loc_1F1600
	move.l	d7,d0
	sub.l	#$200,d0
	move.l	d0,$8(a4)
loc_1F1600:
	moveq	#$0,d0
	move.b	$42(a4),d0
	cmp.w	d5,d0
	beq.s	loc_1F163A
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
loc_1F163A:
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
