; ---------------------------------------------------------------------------
; sub_0062E4	[jt 6]
; ---------------------------------------------------------------------------
sub_0062E4:
	link.w	a6,#$0
	movem.l	d6-d7,-(a7)
	move.l	-$1758(a5),-(a7)
	jsr	sub_0061D0(pc)
	move.w	d0,d6
	move.l	-$1848(a5),-(a7)
	jsr	sub_0061D0(pc)
	move.w	d0,d7
	tst.b	-$3BBA(a5)
	addq.w	#$8,a7
	bne.s	loc_00630C
	moveq	#$0,d0
	bra.s	loc_00637C
loc_00630C:
	cmpi.w	#$FFFF,d7
	bne.s	loc_00632A
loc_006312:
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,d0
	moveq	#$6,d1
	jsr	$3FAA(a5)	; -> sub_15C246
	ext.w	d0
	move.w	d0,d7
	cmp.w	d6,d7
	beq.s	loc_006312
loc_00632A:
	move.w	#$700,-$3B96(a5)
	move.w	d7,d0
	bmi.s	loc_00636E
	cmpi.w	#$5,d0
	bgt.s	loc_00636E
	add.w	d0,d0
	move.w	$6344(pc,d0.w),d0
	jmp	$6342(pc,d0.w)
