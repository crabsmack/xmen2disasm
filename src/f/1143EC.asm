; ---------------------------------------------------------------------------
; sub_1143EC	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1143EC:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.b	$90(a4),d0
	tst.l	d0
	bls.s	loc_114456
	move.l	a4,-(a7)
	jsr	sub_11434A(pc)
	moveq	#$0,d0
	move.b	$90(a4),d0
	cmpi.b	#$1,d0
	shi.b	d3
	neg.b	d3
	beq.s	loc_114426
	tst.b	-$38DE(a5)
	beq.s	loc_114422
	moveq	#$2,d0
	bra.s	loc_11443C
loc_114422:
	moveq	#$1,d0
	bra.s	loc_11443C
loc_114426:
	moveq	#$0,d0
	move.b	$90(a4),d0
	cmpi.w	#$1,d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_11443A
	moveq	#$1,d0
	bra.s	loc_11443C
loc_11443A:
	moveq	#$0,d0
loc_11443C:
	sub.b	d0,$90(a4)
	addq.w	#$4,a7
	clr.w	$6C(a4)
	lea.l	sub_1143EC(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_114462
loc_114456:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$76(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_114462:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
