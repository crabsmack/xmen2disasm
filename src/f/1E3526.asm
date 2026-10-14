; ---------------------------------------------------------------------------
; sub_1E3526	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1E3526:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_1E3550
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.s	loc_1E358A
loc_1E3550:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$8A(a0),a1
	jsr	(a1)
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1E356E
	move.w	-$3BA8(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1E3576
loc_1E356E:
	move.w	-$3BA8(a5),d0
	and.w	-$3A38(a5),d0
loc_1E3576:
	addq.w	#$4,a7
	bne.s	loc_1E358A
	lea.l	sub_1E34BA(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_1E34BA(pc)
	addq.w	#$4,a7
loc_1E358A:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
