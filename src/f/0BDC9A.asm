; ---------------------------------------------------------------------------
; sub_0BDC9A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BDC9A:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	ori.w	#$1000,$6(a4)
	movea.l	$A2(a4),a0
	move.l	$8(a0),d0
	cmp.l	$8(a4),d0
	bge.s	loc_0BDCC0
	ori.b	#$10,$2E(a4)
	bra.s	loc_0BDCC6
loc_0BDCC0:
	andi.b	#$EF,$2E(a4)
loc_0BDCC6:
	move.l	$AA(a4),d0
	cmp.l	$76(a4),d0
	bne.s	loc_0BDCE4
	clr.w	$6C(a4)
	lea.l	sub_0BDCFE(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0BDCF6
loc_0BDCE4:
	clr.w	$6C(a4)
	lea.l	sub_0BDF50(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BDCF6:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
