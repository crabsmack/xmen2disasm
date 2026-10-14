; ---------------------------------------------------------------------------
; sub_085BE8	[link-after-rts]
; ---------------------------------------------------------------------------
sub_085BE8:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	move.b	$F(a6),d7
	movea.l	$8(a6),a4
	cmp.b	$C(a4),d7
	beq.s	loc_085C54
	move.b	d7,$C(a4)
	moveq	#$0,d0
	move.b	$C(a4),d0
	tst.l	d0
	beq.s	loc_085C54
	lea.l	$145A(a5),a0
	move.l	$2(a0),$E(a4)
	clr.l	$12(a4)
	movea.l	$E(a4),a0
	move.b	$7(a0),$17(a4)
	lea.l	$1462(a5),a0
	move.l	$2(a0),$2A(a4)
	clr.l	$2E(a4)
	movea.l	$2A(a4),a0
	move.b	$7(a0),$33(a4)
	lea.l	$146A(a5),a0
	move.l	$2(a0),$46(a4)
	clr.l	$4A(a4)
	movea.l	$46(a4),a0
	move.b	$7(a0),$4F(a4)
loc_085C54:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
