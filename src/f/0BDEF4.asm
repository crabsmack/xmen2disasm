; ---------------------------------------------------------------------------
; sub_0BDEF4	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BDEF4:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.b	$BF(a4)
	move.b	$BC(a4),d0
	beq.s	loc_0BDF0E
	subq.b	#$1,d0
	beq.s	loc_0BDF22
	bra.s	loc_0BDF36
loc_0BDF0E:
	clr.w	$6C(a4)
	lea.l	sub_0BDC9A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0BDF48
loc_0BDF22:
	clr.w	$6C(a4)
	lea.l	sub_0BE1BA(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0BDF48
loc_0BDF36:
	clr.w	$6C(a4)
	lea.l	sub_0BDAC4(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BDF48:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
