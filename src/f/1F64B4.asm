; ---------------------------------------------------------------------------
; sub_1F64B4	[jt 2506]
; ---------------------------------------------------------------------------
sub_1F64B4:
	link.w	a6,#$FFFC
	movem.l	d3/a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$C(a6),a4
	move.l	a4,-(a7)
	jsr	sub_1F6530(pc)
	ori.w	#$800,$4(a4)
	move.l	$7C(a4),-$4(a6)
	addq.w	#$4,a7
	beq.s	loc_1F64E4
	move.l	-$4(a6),-(a7)
	jsr	$4FE2(a5)	; -> Timer_Stop
	addq.w	#$4,a7
loc_1F64E4:
	move.b	$3B(a3),$3C(a4)
	move.b	$15(a4),$3B(a3)
	move.b	$15(a3),$3A(a4)
	moveq	#$0,d0
	move.b	$3C(a4),d0
	cmpi.w	#$FF,d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F650A
	moveq	#$0,d0
	bra.s	loc_1F651A
loc_1F650A:
	moveq	#$0,d0
	move.b	$3C(a4),d0
	movea.l	-$34A6(a5),a0
	asl.l	#$2,d0
	move.l	(a0,d0.l),d0
loc_1F651A:
	movea.l	d0,a3
	move.l	a3,d0
	beq.s	loc_1F6526
	move.b	$15(a4),$3D(a3)
loc_1F6526:
	movem.l	-$10(a6),d3/a3-a4
	unlk	a6
	rts
