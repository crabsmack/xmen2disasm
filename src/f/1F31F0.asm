; ---------------------------------------------------------------------------
; sub_1F31F0	[jt 2459]
; ---------------------------------------------------------------------------
sub_1F31F0:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	beq.s	loc_1F320C
	move.l	a4,-(a7)
	jsr	sub_1F005C(pc)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_1F321E
loc_1F320C:
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_1F321E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
