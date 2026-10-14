; ---------------------------------------------------------------------------
; sub_0BE22A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BE22A:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_0BE24E
	movea.l	$AA(a4),a0
	move.w	$8(a0),d0
	add.w	#$F,d0
	move.w	d0,$9E(a4)
	bra.s	loc_0BE25E
loc_0BE24E:
	movea.l	$AA(a4),a0
	move.w	$C(a0),d0
	sub.w	#$F,d0
	move.w	d0,$9E(a4)
loc_0BE25E:
	move.l	a4,-(a7)
	jsr	sub_0BD894(pc)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_0BE27E
	clr.w	$6C(a4)
	lea.l	sub_0BDF9C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0BE292
loc_0BE27E:
	move.w	#$1E,$6C(a4)
	lea.l	sub_0BE29A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BE292:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
