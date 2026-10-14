; ---------------------------------------------------------------------------
; sub_0AB080	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0AB080:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$C(a6),a4
	tst.w	$6(a4)
	beq.s	loc_0AB09C
	move.w	$6(a4),$98(a3)
loc_0AB09C:
	tst.w	$8(a4)
	beq.s	loc_0AB0A8
	move.w	$8(a4),$9A(a3)
loc_0AB0A8:
	tst.w	$A(a4)
	beq.s	loc_0AB0B4
	move.w	$A(a4),$9C(a3)
loc_0AB0B4:
	tst.w	$C(a4)
	beq.s	loc_0AB0C0
	move.w	$C(a4),$9E(a3)
loc_0AB0C0:
	tst.w	$E(a4)
	beq.s	loc_0AB0DC
	ori.w	#$1000,$6(a3)
	lea.l	sub_0AB1CA(pc),a0
	move.l	a0,$5C(a3)
	lea.l	sub_0AB1CA(pc),a0
	move.l	a0,$64(a3)
loc_0AB0DC:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
