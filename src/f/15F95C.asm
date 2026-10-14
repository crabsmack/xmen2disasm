; ---------------------------------------------------------------------------
; sub_15F95C	[jt 2082]
; ---------------------------------------------------------------------------
sub_15F95C:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	pea.l	$15FA2A(pc)
	move.w	-$38D8(a5),d0
	muls.w	#$E,d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> sub_1FA8DC
	move.l	d0,-$38DC(a5)
	moveq	#$0,d7
	addq.w	#$8,a7
	bra.s	loc_15F9C8
loc_15F980:
	movea.l	-$38DC(a5),a0
	move.l	d7,d0
	move.l	d0,d1
	mulu.w	#$E,d0
	swap	d1
	mulu.w	#$E,d1
	swap	d1
	clr.w	d1
	add.l	d1,d0
	lea.l	(a0,d0.l),a4
	movea.l	-$38D6(a5),a0
	move.l	d7,d0
	asl.l	#$4,d0
	lea.l	(a0,d0.l),a3
	move.w	(a3),d0
	ext.l	d0
	movea.l	-$3900(a5),a0
	asl.l	#$2,d0
	move.l	$2(a0,d0.l),(a4)
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	move.l	d7,d0
	addq.l	#$1,d7
loc_15F9C8:
	move.w	-$38D8(a5),d0
	ext.l	d0
	cmp.l	d7,d0
	bgt.s	loc_15F980
	clr.w	-$BCE(a5)
	move.l	-$38DC(a5),-$BD2(a5)
	move.w	-$38D8(a5),d0
	ext.l	d0
	movea.l	-$38DC(a5),a0
	move.l	d0,d1
	mulu.w	#$E,d0
	swap	d1
	mulu.w	#$E,d1
	swap	d1
	clr.w	d1
	add.l	d1,d0
	adda.l	d0,a0
	move.l	a0,-$BD6(a5)
	move.w	#$A,-$BD8(a5)
	move.w	#$5,-$BD8(a5)
	tst.w	-$38D8(a5)
	ble.s	loc_15FA18
	moveq	#$0,d0
	move.l	d0,-$BCC(a5)
	bra.s	loc_15FA20
loc_15FA18:
	lea.l	sub_15F954(pc),a0
	move.l	a0,-$BCC(a5)
loc_15FA20:
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
