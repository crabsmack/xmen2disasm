; ---------------------------------------------------------------------------
; sub_1142E8	[jt 1412]
; ---------------------------------------------------------------------------
sub_1142E8:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	move.b	$13(a6),d7
	movea.l	$8(a6),a4
	cmpi.b	#$D,d7
	beq.s	loc_11430A
	cmpi.b	#$E,d7
	beq.s	loc_11430A
	cmpi.b	#$F,d7
	bne.s	loc_114318
loc_11430A:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.s	loc_114324
loc_114318:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$7E(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_114324:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
