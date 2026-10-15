; ---------------------------------------------------------------------------
; sub_1419E0	[jt 1915]
; ---------------------------------------------------------------------------
sub_1419E0:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d5
	asr.l	#$8,d5
	moveq	#$10,d0
	and.b	$2E(a4),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_141A02
	moveq	#$40,d0
	bra.s	loc_141A04
loc_141A02:
	moveq	#-$40,d0
loc_141A04:
	move.w	d0,d6
	moveq	#$8,d0
	and.b	$2E(a4),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_141A16
	moveq	#-$35,d0
	bra.s	loc_141A18
loc_141A16:
	moveq	#$35,d0
loc_141A18:
	move.w	d0,d7
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	moveq	#$0,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,d1
	lsl.l	#$8,d1
	add.l	$C(a4),d1
	move.l	d1,-(a7)
	ext.l	d6
	move.l	d6,d1
	lsl.l	#$8,d1
	add.l	$8(a4),d1
	move.l	d1,-(a7)
	lea.l	$361A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$361A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$14(a7),a7
	beq.s	loc_141A90
	moveq	#$5A,d0
	move.l	d0,-(a7)
	pea.l	($C0).w
	moveq	#$10,d1
	and.b	$2E(a4),d1
	seq.b	d3
	neg.b	d3
	beq.s	loc_141A7C
	moveq	#$0,d1
	bra.s	loc_141A82
loc_141A7C:
	move.l	#$B4,d1
loc_141A82:
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	jsr	$3602(a5)	; -> Rocket_SetAngleB
	lea.l	$14(a7),a7
loc_141A90:
	tst.l	$96(a4)
	bne.s	loc_141AA4
	move.l	$64(a4),$5C(a4)
	move.w	#$F,$6C(a4)
	bra.s	loc_141AD2
loc_141AA4:
	addq.w	#$1,$94(a4)
	movea.l	$96(a4),a0
	move.w	$94(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_141AB8
	clr.w	$94(a4)
loc_141AB8:
	movea.l	$96(a4),a0
	addq.l	#$2,a0
	move.w	$94(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$F,$6C(a4)
loc_141AD2:
	movem.l	-$18(a6),d3/d5-d7/a3-a4
	unlk	a6
	rts
