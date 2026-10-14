; ---------------------------------------------------------------------------
; sub_1FB026	[jt 2569]
; ---------------------------------------------------------------------------
sub_1FB026:
	link.w	a6,#$FFFE
	movem.l	d4-d7/a3-a4,-(a7)
	move.w	$16(a6),d5
	movea.l	$8(a6),a3
	move.w	$1E(a6),-$2(a6)
	clr.b	(a3)
	clr.b	$B(a3)
	move.b	#$FF,$A(a3)
	moveq	#$3,d0
	and.w	$1A(a6),d0
	or.b	d0,(a3)
	move.b	d5,$1(a3)
	move.l	$10(a6),$2(a3)
	beq.w	loc_1FB0FA
	movea.l	$10(a6),a0
	moveq	#$20,d0
	cmp.b	(a0),d0
	bne.s	loc_1FB072
	move.w	$1E(a6),-$2(a6)
	bra.w	loc_1FB106
loc_1FB072:
	cmpi.w	#$FFFF,d5
	beq.s	loc_1FB09C
	ext.l	d5
	move.l	d5,d4
	move.l	$10(a6),d0
	moveq	#$24,d1
	add.l	d1,d0
	move.l	d4,d2
	lsl.l	#$4,d2
	add.l	d0,d2
	move.l	d4,d0
	lsl.l	#$2,d0
	movea.l	d0,a4
	adda.l	d2,a4
	moveq	#$0,d5
	move.b	$11(a4),d5
	tst.l	d5
	bra.s	loc_1FB0E0
loc_1FB09C:
	movea.l	$10(a6),a0
	moveq	#$0,d5
	move.b	$5(a0),d5
	moveq	#$0,d0
	move.w	d5,d0
	tst.l	d0
	bne.s	loc_1FB0E0
	move.b	$1(a0),d0
	ext.w	d0
	move.w	d0,d4
	movea.l	a0,a4
	lea.l	$24(a4),a4
	clr.w	d5
	clr.w	d6
	bra.s	loc_1FB0DC
loc_1FB0C2:
	moveq	#$0,d7
	move.b	$11(a4),d7
	moveq	#$0,d0
	move.w	d5,d0
	ext.l	d7
	cmp.l	d0,d7
	ble.s	loc_1FB0D4
	move.w	d7,d5
loc_1FB0D4:
	adda.w	#$14,a4
	move.w	d6,d0
	addq.w	#$1,d6
loc_1FB0DC:
	cmp.w	d6,d4
	bgt.s	loc_1FB0C2
loc_1FB0E0:
	move.w	$1E(a6),$6(a3)
	move.w	d5,$8(a3)
	ori.b	#$80,(a3)
	move.w	d5,d0
	add.w	$1E(a6),d0
	move.w	d0,-$2(a6)
	bra.s	loc_1FB106
loc_1FB0FA:
	move.w	#$FFFF,$6(a3)
	move.w	$1E(a6),-$2(a6)
loc_1FB106:
	tst.b	$23(a6)
	beq.s	loc_1FB118
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	jsr	sub_1FAD44(pc)
	addq.w	#$8,a7
loc_1FB118:
	move.w	-$2(a6),d0
	movem.l	-$1A(a6),d4-d7/a3-a4
	unlk	a6
	rts
