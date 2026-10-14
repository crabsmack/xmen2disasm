; ---------------------------------------------------------------------------
; sub_11754A	[jt 1427]
; ---------------------------------------------------------------------------
sub_11754A:
	link.w	a6,#$0
	movem.l	d3/a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2D82(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	ori.w	#$3,$6(a4)
	lea.l	$2C8A(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1175C6
	lea.l	-$1758(a5),a0
	move.l	a0,d0
	bra.s	loc_1175CC
loc_1175C6:
	lea.l	-$1848(a5),a0
	move.l	a0,d0
loc_1175CC:
	movea.l	d0,a0
	moveq	#$4,d0
	and.b	$2E(a0),d0
	lea.l	$10(a7),a7
	beq.s	loc_1175E0
	ori.b	#$4,$2E(a4)
loc_1175E0:
	clr.w	$8C(a4)
	move.l	a3,d0
	beq.s	loc_1175EE
	move.w	$6(a3),$8C(a4)
loc_1175EE:
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	movem.l	-$C(a6),d3/a3-a4
	unlk	a6
	rts
