; ---------------------------------------------------------------------------
; sub_0B78B8	[jt 935]
; ---------------------------------------------------------------------------
sub_0B78B8:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$10,d0
	and.b	$2E(a4),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_0B78D4
	moveq	#-$4,d0
	bra.s	loc_0B78D6
loc_0B78D4:
	moveq	#$4,d0
loc_0B78D6:
	move.w	d0,d7
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$C(a4),d1
	add.l	#$FFFFED00,d1
	move.l	d1,-(a7)
	ext.l	d7
	move.l	d7,d1
	lsl.l	#$8,d1
	add.l	$8(a4),d1
	move.l	d1,-(a7)
	lea.l	$3622(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$3622(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$14(a7),a7
	beq.s	loc_0B793A
	moveq	#$10,d0
	and.b	$2E(a4),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_0B7926
	moveq	#$0,d0
	bra.s	loc_0B792C
loc_0B7926:
	move.l	#$B4,d0
loc_0B792C:
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	jsr	$35FA(a5)	; -> sub_1339A6
	lea.l	$C(a7),a7
loc_0B793A:
	tst.l	$9A(a4)
	bne.s	loc_0B794E
	move.l	$64(a4),$5C(a4)
	move.w	#$F,$6C(a4)
	bra.s	loc_0B797C
loc_0B794E:
	addq.w	#$1,$98(a4)
	movea.l	$9A(a4),a0
	move.w	$98(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0B7962
	clr.w	$98(a4)
loc_0B7962:
	movea.l	$9A(a4),a0
	addq.l	#$2,a0
	move.w	$98(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$F,$6C(a4)
loc_0B797C:
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
