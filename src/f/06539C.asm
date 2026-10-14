; ---------------------------------------------------------------------------
; sub_06539C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_06539C:
	link.w	a6,#$0
	tst.w	-$359A(a5)
	bne.s	loc_0653FC
	movea.l	-$3B2C(a5),a0
	moveq	#-$1,d0
	cmp.b	$3C(a0),d0
	bne.s	loc_0653C4
	movea.l	-$3B28(a5),a0
	tst.b	$40(a0)
	beq.s	loc_0653C4
	move.w	#$2,-$359A(a5)
	bra.s	loc_0653FC
loc_0653C4:
	movea.l	-$3B28(a5),a0
	moveq	#-$1,d0
	cmp.b	$3C(a0),d0
	bne.s	loc_0653E2
	movea.l	-$3B2C(a5),a0
	tst.b	$40(a0)
	beq.s	loc_0653E2
	move.w	#$2,-$359A(a5)
	bra.s	loc_0653FC
loc_0653E2:
	movea.l	-$3B28(a5),a0
	tst.b	$40(a0)
	beq.s	loc_0653FC
	movea.l	-$3B2C(a5),a0
	tst.b	$40(a0)
	beq.s	loc_0653FC
	move.w	#$2,-$359A(a5)
loc_0653FC:
	unlk	a6
	rts
