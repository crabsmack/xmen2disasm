; ---------------------------------------------------------------------------
; sub_13518A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_13518A:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	clr.b	d7
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_1351B8
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	-$348E(a5),d1
	ext.l	d1
	moveq	#$1E,d2
	sub.l	d2,d1
	cmp.l	d0,d1
	ble.s	loc_1351D0
	moveq	#$1,d7
	bra.s	loc_1351D0
loc_1351B8:
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	-$348E(a5),d1
	ext.l	d1
	add.l	#$15E,d1
	cmp.l	d0,d1
	bge.s	loc_1351D0
	moveq	#$1,d7
loc_1351D0:
	tst.b	d7
	beq.s	loc_1351E0
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_1351E0:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
