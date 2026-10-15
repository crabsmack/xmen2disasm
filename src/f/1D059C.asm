; ---------------------------------------------------------------------------
; sub_1D059C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1D059C:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_1D05C8
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1D06A4
loc_1D05C8:
	movea.l	$8C(a4),a0
	movea.l	a0,a1
	adda.w	$30(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	tst.b	$9D(a4)
	addq.w	#$8,a7
	bne.s	loc_1D05F2
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	-$3A2E(a5),d0
	move.w	d0,-$3A2E(a5)
	bra.s	loc_1D0600
loc_1D05F2:
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	-$3A30(a5),d0
	move.w	d0,-$3A30(a5)
loc_1D0600:
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$2C(a0),d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$2C(a0),d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1D0634
	move.w	-$3B98(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1D063C
loc_1D0634:
	move.w	-$3B98(a5),d0
	and.w	-$3A38(a5),d0
loc_1D063C:
	addq.w	#$8,a7
	beq.s	loc_1D0658
	ori.b	#$10,$2E(a4)
	move.w	#$800,$22(a4)
	move.w	#$F800,$16(a4)
	clr.w	$1E(a4)
	bra.s	loc_1D068C
loc_1D0658:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1D066C
	move.w	-$3B9A(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1D0674
loc_1D066C:
	move.w	-$3B9A(a5),d0
	and.w	-$3A38(a5),d0
loc_1D0674:
	beq.s	loc_1D068C
	andi.b	#$EF,$2E(a4)
	move.w	#$800,$22(a4)
	move.w	#$800,$16(a4)
	clr.w	$1E(a4)
loc_1D068C:
	move.w	#$C,$A8(a4)
	clr.w	$6C(a4)
	lea.l	sub_1D0560(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1D06A4:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
