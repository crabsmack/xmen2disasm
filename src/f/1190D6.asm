; ---------------------------------------------------------------------------
; sub_1190D6	[jt 1485]
; ---------------------------------------------------------------------------
sub_1190D6:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	moveq	#$3,d0
	move.l	d0,-(a7)
	lea.l	$2E9A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$1CA8(a5)
	pea.l	Str_Empty_11918E(pc)
	pea.l	($C8).w
	jsr	$5032(a5)	; -> Mem_StackAlloc
	movea.l	d0,a4
	move.l	a4,d0
	lea.l	$10(a7),a7
	beq.s	loc_119156
	move.l	a4,-$1CAC(a5)
	lea.l	$2E6A(a5),a0
	movea.l	-$1CAC(a5),a1
	move.l	$2(a0),$4(a1)
	movea.l	-$1CAC(a5),a0
	clr.w	(a0)
	movea.l	-$1CAC(a5),a0
	move.w	#$6,$2(a0)
	movea.l	-$1CAC(a5),a0
	lea.l	$8(a0),a4
	bra.s	loc_119140
loc_119134:
	lea.l	$2E72(a5),a0
	move.l	$2(a0),(a4)
	lea.l	$20(a4),a4
loc_119140:
	movea.l	-$1CAC(a5),a0
	move.w	$2(a0),d0
	ext.l	d0
	asl.l	#$5,d0
	lea.l	$8(a0,d0.l),a0
	cmpa.l	a4,a0
	bhi.s	loc_119134
	bra.s	loc_11915C
loc_119156:
	moveq	#$0,d0
	move.l	d0,-$1CAC(a5)
loc_11915C:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	pea.l	sub_119086(pc)
	jsr	$4FD2(a5)	; -> Timer_Create
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$10(a7),a7
	beq.s	loc_119184
	move.l	a3,$10(a3)
	move.l	a3,-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	addq.w	#$4,a7
loc_119184:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
