; ---------------------------------------------------------------------------
; sub_006242	[jt 5]
; ---------------------------------------------------------------------------
sub_006242:
	link.w	a6,#$0
	movem.l	d6-d7,-(a7)
	move.l	-$1758(a5),-(a7)
	jsr	sub_0061D0(pc)
	move.w	d0,d7
	move.l	-$1848(a5),-(a7)
	jsr	sub_0061D0(pc)
	move.w	d0,d6
	tst.b	-$3BBA(a5)
	addq.w	#$8,a7
	bne.s	loc_00626A
	moveq	#$0,d0
	bra.s	loc_0062DA
loc_00626A:
	cmpi.w	#$FFFF,d7
	bne.s	loc_006288
loc_006270:
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,d0
	moveq	#$6,d1
	jsr	$3FAA(a5)	; -> sub_15C246
	ext.w	d0
	move.w	d0,d7
	cmp.w	d7,d6
	beq.s	loc_006270
loc_006288:
	move.w	#$700,-$3B94(a5)
	move.w	d7,d0
	bmi.s	loc_0062CC
	cmpi.w	#$5,d0
	bgt.s	loc_0062CC
	add.w	d0,d0
	move.w	$62A2(pc,d0.w),d0
	jmp	$62A0(pc,d0.w)
